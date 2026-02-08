# Production Deployment Guide

## Overview
This guide explains how to deploy the Title IX sport-level data to your production database.

## Prerequisites
- Access to production PostgreSQL database
- CSV file: `All_Data_Combined_2004_2005_2006_2007_2008_2009_2010_2011_2012_2013_2014_2015_2016_2017_2018_2019_2020_2021_2022_2023.csv`
- Python 3 with psycopg2 (install: `pip install psycopg2-binary`)

## Option 1: Python Script (Recommended)

### Step 1: Create Production Table
Use the SQL file we generated:
```bash
# Connect to production database and create table
psql -h YOUR_PROD_HOST -p YOUR_PROD_PORT -U YOUR_PROD_USER -d YOUR_PROD_DB \
  -f create_raw_table_text.sql
```

### Step 2: Load Data with Python Script
Update the connection parameters in `load_sport_data_prod.py`:
```python
conn = psycopg2.connect(
    host="YOUR_PROD_HOST",
    port="YOUR_PROD_PORT",
    database="YOUR_PROD_DB",
    user="YOUR_PROD_USER",
    password="YOUR_PROD_PASSWORD"
)
```

Then run:
```bash
python3 load_sport_data_prod.py
```

### Step 3: Run DBT in Production
Update your `profiles.yml` with production credentials:
```yaml
title9:
  outputs:
    prod:
      type: postgres
      host: YOUR_PROD_HOST
      port: YOUR_PROD_PORT
      user: YOUR_PROD_USER
      pass: YOUR_PROD_PASSWORD
      dbname: YOUR_PROD_DB
      schema: prod
      threads: 4  # Can use more threads in production
  target: prod
```

Then run:
```bash
dbt run --target prod --profiles-dir .
dbt test --target prod --profiles-dir .
```

## Option 2: Manual SQL Approach

If you prefer to avoid Python, you can:

1. **Create table** using the generated SQL
2. **Load data** using PostgreSQL COPY command:
   ```sql
   \COPY raw_eada_by_sport FROM '/path/to/All_Data_Combined_2004_2005_2006_2007_2008_2009_2010_2011_2012_2013_2014_2015_2016_2017_2018_2019_2020_2021_2022_2023.csv' 
   WITH (FORMAT CSV, HEADER, ENCODING 'UTF8', NULL '');
   ```
3. **Run DBT** as shown above

## Important Notes

### Data Safety
- **Always backup** your production database before loading new data
- Test on a staging environment first if possible
- The script truncates the table before loading (data replacement, not append)

### Performance Considerations
- Production load of 38,148 rows takes ~2-3 minutes
- DBT model build takes ~3 minutes (563,267 output rows)
- Consider running during low-traffic hours

### Column Name Truncation
PostgreSQL truncates column names to 63 characters. The generated SQL handles this, but if you manually create tables, ensure column names match exactly.

### Lightdash Integration
After production deployment:
1. Lightdash will automatically detect the new `eada_by_sport` model
2. Metrics defined in the YML will be available
3. You can create dashboards filtered by sport, year, sex, etc.

## Troubleshooting

### Connection Issues
```bash
# Test connection
psql -h YOUR_PROD_HOST -p YOUR_PROD_PORT -U YOUR_PROD_USER -d YOUR_PROD_DB -c "SELECT 1"
```

### Data Load Errors
If the Python script fails:
1. Check CSV encoding (should be UTF-8)
2. Verify all 710 columns exist in the CSV
3. Check for special characters in institution names

### DBT Errors
If DBT fails in production:
1. Verify schema exists and user has permissions
2. Check that raw_eada_by_sport table was created successfully
3. Review logs in `target/logs/`

## Files for Production

These files have been created for you:
1. `create_raw_table_text.sql` - Table creation SQL
2. `load_sport_data_prod.py` - Python loader script (template)
3. `profiles.yml` - DBT configuration (update with prod credentials)

## Next Steps

1. Review and customize `load_sport_data_prod.py` with your production credentials
2. Test the load process on a small subset first
3. Schedule the production deployment
4. Update Lightdash to use the new sport-level data

Need help with any specific step? Let me know!
