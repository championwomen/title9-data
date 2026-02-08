#!/usr/bin/env python3
import csv
import re

# Read the CSV header
with open("/tmp/columns.csv", "r") as f:
    reader = csv.reader(f)
    headers = next(reader)


def to_snake_case(name):
    """Convert column name to snake_case"""
    # Replace spaces and special chars with underscores
    name = re.sub(r"[^a-zA-Z0-9]+", "_", name)
    # Remove leading/trailing underscores
    name = name.strip("_")
    # Convert to lowercase
    name = name.lower()
    # Remove consecutive underscores
    name = re.sub(r"_+", "_", name)
    return name


def get_data_type(column_name, index):
    """Determine appropriate PostgreSQL data type based on column name and position"""
    col_lower = column_name.lower()

    # First 12 columns - institution data
    if index == 0:  # Survey Year
        return "INTEGER"
    elif index == 1:  # UNITID
        return "INTEGER"
    elif index == 2:  # OPE ID
        return "INTEGER"
    elif index == 3:  # Institution Name
        return "CHARACTER VARYING(255)"
    elif index == 4:  # State CD
        return "CHARACTER VARYING(10)"
    elif index == 5:  # Classification Name
        return "CHARACTER VARYING(255)"
    elif index == 6:  # Classification Other
        return "CHARACTER VARYING(255)"
    elif index == 7:  # Sanction Code
        return "CHARACTER VARYING(50)"
    elif index == 8:  # Sanction Name
        return "CHARACTER VARYING(255)"
    elif index in [9, 10, 11]:  # Undergraduate counts
        return "INTEGER"

    # Participation columns (contains "participation" or ends with "count")
    if "participation" in col_lower or col_lower.endswith("count"):
        return "INTEGER"

    # Number of coaches/FTEs (counts)
    if "number" in col_lower and (
        "coach" in col_lower or "fte" in col_lower or "included" in col_lower
    ):
        return "INTEGER"

    # Financial columns - Salary, Revenue, Expenses, Aid
    if any(
        word in col_lower
        for word in ["salary", "revenue", "expenses", "expense", "aid"]
    ):
        return "NUMERIC(12,2)"

    # Default to VARCHAR for anything else
    return "CHARACTER VARYING(100)"


# Generate column definitions
columns = []
for i, col in enumerate(headers):
    snake_name = to_snake_case(col)
    data_type = get_data_type(col, i)
    columns.append(f"    {snake_name} {data_type}")

# Generate CREATE TABLE statement
sql = "CREATE TABLE public.raw_eada_by_sport (\n"
sql += ",\n".join(columns)
sql += "\n);"

print(sql)
