### Title 9 DBT

This repository contains the database processing and calculations around the data collected on Title IX from the [Equity in Athletics Data Analysis website](https://ope.ed.gov/athletics).  We've loaded the data from each year into a single database segmented by year.  You can see how we process the data by looking at:
1. Renaming the columns into names that are more complete and easier to understand.  See `models/eada.sql`.
2. Setting up the formatting and calculations.  See `models/schema.yml`

We are using DBT to process the data and to be able to re-process and test it easily.

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
