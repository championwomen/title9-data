#!/usr/bin/env python3
"""
Load EADA sport-level data into PostgreSQL (Production Version)

Usage:
    # With environment variables:
    export DB_HOST=your-prod-host
    export DB_PORT=5432
    export DB_NAME=title9
    export DB_USER=title9
    export DB_PASSWORD=your-password
    python3 load_sport_data_prod.py

    # Or edit the DEFAULTS section below and run directly
"""

import csv
import os
import sys
import psycopg2
from psycopg2.extras import execute_values

# ============== CONFIGURATION ==============
# Option 1: Set these defaults for your production database
DEFAULTS = {
    "host": os.getenv("DB_HOST", "localhost"),
    "port": int(os.getenv("DB_PORT", 5434)),
    "database": os.getenv("DB_NAME", "title9"),
    "user": os.getenv("DB_USER", "title9"),
    "password": os.getenv("DB_PASSWORD", "title9"),
}

CSV_FILE = "data/All_Data_Combined_2004_2005_2006_2007_2008_2009_2010_2011_2012_2013_2014_2015_2016_2017_2018_2019_2020_2021_2022_2023.csv"
BATCH_SIZE = 1000  # Commit every N rows
# ============== END CONFIGURATION ==============


def get_connection():
    """Create database connection"""
    try:
        conn = psycopg2.connect(
            host=DEFAULTS["host"],
            port=DEFAULTS["port"],
            database=DEFAULTS["database"],
            user=DEFAULTS["user"],
            password=DEFAULTS["password"],
        )
        print(
            f"✓ Connected to {DEFAULTS['host']}:{DEFAULTS['port']}/{DEFAULTS['database']}"
        )
        return conn
    except psycopg2.Error as e:
        print(f"✗ Connection failed: {e}")
        sys.exit(1)


def load_data(conn):
    """Load CSV data into raw_eada_by_sport table"""
    cursor = conn.cursor()

    # Get column names from database
    cursor.execute("""
        SELECT column_name 
        FROM information_schema.columns 
        WHERE table_name = 'raw_eada_by_sport' 
        AND column_name != 'id'
        ORDER BY ordinal_position
    """)
    db_columns = [row[0] for row in cursor.fetchall()]

    print(f"✓ Table has {len(db_columns)} columns")

    # Get CSV headers
    with open(CSV_FILE, "r", encoding="utf-8-sig") as f:
        reader = csv.reader(f)
        csv_headers = next(reader)

    print(f"✓ CSV has {len(csv_headers)} columns")

    if len(csv_headers) != len(db_columns):
        print(
            f"⚠ Warning: Column count mismatch (CSV: {len(csv_headers)}, DB: {len(db_columns)})"
        )
        print("Will pad/truncate as needed")

    # Confirm before truncating
    cursor.execute("SELECT COUNT(*) FROM raw_eada_by_sport")
    existing_count = cursor.fetchone()[0]

    if existing_count > 0:
        response = input(
            f"\n⚠ Table has {existing_count} existing rows. Truncate and reload? (yes/no): "
        )
        if response.lower() != "yes":
            print("Aborted.")
            return

    # Truncate table
    print("\n→ Truncating table...")
    cursor.execute("TRUNCATE raw_eada_by_sport")
    conn.commit()

    # Load data
    print(f"→ Loading data from {CSV_FILE}...")

    with open(CSV_FILE, "r", encoding="utf-8-sig") as f:
        reader = csv.reader(f)
        next(reader)  # Skip header

        row_count = 0
        batch = []

        for row in reader:
            # Pad or truncate row to match DB columns
            while len(row) < len(db_columns):
                row.append(None)
            row = row[: len(db_columns)]

            # Convert empty strings to None
            row = [None if x == "" else x for x in row]

            batch.append(row)
            row_count += 1

            if len(batch) >= BATCH_SIZE:
                # Insert batch
                placeholders = ",".join(["%s"] * len(db_columns))
                sql = f"INSERT INTO raw_eada_by_sport ({','.join(db_columns)}) VALUES ({placeholders})"

                for row_data in batch:
                    cursor.execute(sql, row_data)

                conn.commit()
                print(f"  Loaded {row_count} rows...")
                batch = []

        # Insert remaining rows
        if batch:
            placeholders = ",".join(["%s"] * len(db_columns))
            sql = f"INSERT INTO raw_eada_by_sport ({','.join(db_columns)}) VALUES ({placeholders})"

            for row_data in batch:
                cursor.execute(sql, row_data)

            conn.commit()

    print(f"\n✓ Successfully loaded {row_count} rows")

    # Verify
    cursor.execute("SELECT COUNT(*) FROM raw_eada_by_sport")
    final_count = cursor.fetchone()[0]
    print(f"✓ Table now has {final_count} total rows")

    # Show year distribution
    cursor.execute("""
        SELECT survey_year, COUNT(*) 
        FROM raw_eada_by_sport 
        GROUP BY survey_year 
        ORDER BY survey_year
    """)

    print("\nYear distribution:")
    for year, count in cursor.fetchall():
        print(f"  {year}: {count} rows")

    cursor.close()


def main():
    print("=" * 60)
    print("EADA Sport Data Loader - Production")
    print("=" * 60)
    print(f"\nTarget: {DEFAULTS['host']}:{DEFAULTS['port']}/{DEFAULTS['database']}")
    print(f"CSV: {CSV_FILE}")
    print("\n" + "=" * 60)

    conn = get_connection()

    try:
        load_data(conn)
        print("\n" + "=" * 60)
        print("✓ Load completed successfully!")
        print("=" * 60)
        print("\nNext steps:")
        print("  1. Run DBT: dbt run --target prod --profiles-dir .")
        print("  2. Run tests: dbt test --target prod --profiles-dir .")
        print("  3. Refresh Lightdash to see new data")

    except Exception as e:
        print(f"\n✗ Error: {e}")
        conn.rollback()
        sys.exit(1)
    finally:
        conn.close()


if __name__ == "__main__":
    main()
