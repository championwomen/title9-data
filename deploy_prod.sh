#!/bin/bash
# Production deployment script for Title IX sport-level data

set -e  # Exit on error

echo "=========================================="
echo "Title IX Sport Data - Production Deploy"
echo "=========================================="
echo ""

# Check if running in correct directory
if [ ! -f "dbt_project.yml" ]; then
    echo "Error: Must run from project root directory"
    exit 1
fi

# Check for CSV file
if [ ! -f "data/All_Data_Combined_2004_2005_2006_2007_2008_2009_2010_2011_2012_2013_2014_2015_2016_2017_2018_2019_2020_2021_2022_2023.csv" ]; then
    echo "Error: CSV file not found in data/ directory"
    exit 1
fi

echo "Step 1: Creating production table..."
echo "----------------------------------------"
# You'll need to set these or use environment variables
: "${DB_HOST:?Need to set DB_HOST}"
: "${DB_PORT:?Need to set DB_PORT}"
: "${DB_NAME:?Need to set DB_NAME}"
: "${DB_USER:?Need to set DB_USER}"
: "${DB_PASSWORD:?Need to set DB_PASSWORD}"

psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" \
  -f create_raw_table_text.sql

echo ""
echo "Step 2: Loading data..."
echo "----------------------------------------"
python3 load_sport_data_prod.py

echo ""
echo "Step 3: Running DBT..."
echo "----------------------------------------"
source venv/bin/activate  # or your virtualenv
dbt run --target prod --profiles-dir .
dbt test --target prod --profiles-dir .

echo ""
echo "=========================================="
echo "✓ Production deployment complete!"
echo "=========================================="
echo ""
echo "Don't forget to:"
echo "  - Verify data in Lightdash"
echo "  - Update any existing dashboards"
echo "  - Notify team of new sport-level metrics"
