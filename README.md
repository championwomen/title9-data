### Title 9 DBT

This repository contains the database processing and calculations around the data collected on Title IX from the [Equity in Athletics Data Analysis website](https://ope.ed.gov/athletics).  We've loaded the data from each year into a single database segmented by year.  You can see how we process the data by looking at:
1. Renaming the columns into names that are more complete and easier to understand.  See `models/eada.sql`.
2. Setting up the formatting and calculations.  See `models/schema.yml`

We are using DBT to process the data and to be able to re-process and test it easily.

Try running the following commands:
- `dbt run`
- `dbt test`

### Configure dbt
In order to set up `dbt`, you have to set up a `~/.dbt/profiles.yml` configuration file.  This should look something like:

```
title9:
  outputs:

    dev:
      type: postgres
      threads: 1
      host: localhost
      port: 5432
      user: xxxx
      pass: xxxx
      dbname: xxxx
      schema: dev
    prod:
      type: postgres
      threads: 1
      host: xxxx
      port: 5432
      user: xxxx
      pass: xxxx
      dbname: xxxx
      schema: prod
  target: dev
```

### Create a database
We are using PostgreSQL to store this data.  You can create the skeleton of the database using the following command:

``` sql
CREATE TABLE public.raw_eada (
    year integer,
    unitid integer,
    institution_name character varying(68),
    addr1_txt character varying(61),
    addr2_txt character varying(40),
    city_txt character varying(23),
    state_cd character(2),
    zip_text character varying(14),
    classificationcode integer,
    classification_name character varying(36),
    classificationother character varying(53),
    efmalecount integer,
    effemalecount integer,
    eftotalcount integer,
    sector_cd integer,
    sector_name character varying(35),
    studentaid_men numeric(12,2),
    studentaid_women numeric(12,2),
    studentaid_coed numeric(12,2),
    studentaid_total numeric(12,2),
    stuaid_men_ratio numeric(12,2),
    stuaid_women_ratio numeric(12,2),
    stuaid_coed_ratio numeric(12,2),
    recruitexp_men numeric(12,2),
    recruitexp_women numeric(12,2),
    recruitexp_coed numeric(12,2),
    recruitexp_total numeric(12,2),
    hdcoach_salary_men numeric(12,2),
    hdcoach_salary_women numeric(12,2),
    hdcoach_salary_coed numeric(12,2),
    num_hdcoach_men numeric(12,2),
    num_hdcoach_women numeric(12,2),
    num_hdcoach_coed numeric(12,2),
    hdcoach_sal_fte_men numeric(12,2),
    hdcoach_sal_fte_womn numeric(12,2),
    hdcoach_sal_fte_coed numeric(12,2),
    fte_hdcoach_men numeric(12,2),
    fte_hdcoach_women numeric(12,2),
    fte_hdcoach_coed numeric(12,2),
    ascoach_salary_men numeric(12,2),
    ascoach_salary_women numeric(12,2),
    ascoach_salary_coed numeric(12,2),
    num_ascoach_men numeric(12,2),
    num_ascoach_women numeric(12,2),
    num_ascoach_coed numeric(12,2),
    ascoach_sal_fte_men numeric(12,2),
    ascoach_sal_fte_womn numeric(12,2),
    ascoach_sal_fte_coed numeric(12,2),
    fte_ascoach_men numeric(12,2),
    fte_ascoach_women numeric(12,2),
    fte_ascoach_coed numeric(12,2),
    il_partic_men numeric(12,2),
    il_partic_women numeric(12,2),
    il_partic_coed_men numeric(12,2),
    il_partic_coed_women numeric(12,2),
    il_sum_partic_men numeric(12,2),
    il_sum_partic_women numeric(12,2),
    il_opexpperpart_men numeric(12,2),
    il_opexpperteam_men numeric(12,2),
    il_opexpperpart_women numeric(12,2),
    il_opexpperteam_women numeric(12,2),
    il_total_opexp_menwomen numeric(12,2),
    il_opexpperpart_coed_men numeric(12,2),
    il_opexpperteam_coed_men numeric(12,2),
    il_opexp_part_coed_women numeric(12,2),
    il_opexp_team_coed_women numeric(12,2),
    il_total_opexp_coedteam numeric(12,2),
    il_sum_opexpperpart_men numeric(12,2),
    il_sum_opexpperteam_men numeric(12,2),
    il_sum_opexpperpart_women numeric(12,2),
    il_sum_opexpperteam_women numeric(12,2),
    il_total_opexp_inclcoed numeric(12,2),
    il_men_ftheadcoach_male numeric(12,2),
    il_men_ptheadcoach_male numeric(12,2),
    il_men_ftunivemploy_male numeric(12,2),
    il_men_ptunivemploy_male numeric(12,2),
    il_men_ftheadcoach_fem numeric(12,2),
    il_men_ptheadcoach_fem numeric(12,2),
    il_men_ftunivemploy_fem numeric(12,2),
    il_men_ptunivemploy_fem numeric(12,2),
    il_men_total_headcoach numeric(12,2),
    il_women_fthdcoach_male numeric(12,2),
    il_women_pthdcoach_male numeric(12,2),
    il_women_ftunivemp_male numeric(12,2),
    il_women_ptunivemp_male numeric(12,2),
    il_women_fthdcoach_fem numeric(12,2),
    il_women_pthdcoach_fem numeric(12,2),
    il_women_ftunivemp_fem numeric(12,2),
    il_women_ptunivemp_fem numeric(12,2),
    il_women_total_hdcoach numeric(12,2),
    il_coed_fthdcoach_male numeric(12,2),
    il_coed_pthdcoach_male numeric(12,2),
    il_coed_ftunivemp_male numeric(12,2),
    il_coed_ptunivemp_male numeric(12,2),
    il_coed_fthdcoach_fem numeric(12,2),
    il_coed_pthdcoach_fem numeric(12,2),
    il_coed_ftunivemp_fem numeric(12,2),
    il_coed_ptunivemp_fem numeric(12,2),
    il_coed_total_hdcoach numeric(12,2),
    il_sum_fthdcoach_male numeric(12,2),
    il_sum_pthdcoach_male numeric(12,2),
    il_sum_ftunivemp_male numeric(12,2),
    il_sum_ptunivemp_male numeric(12,2),
    il_sum_fthdcoach_fem numeric(12,2),
    il_sum_pthdcoach_fem numeric(12,2),
    il_sum_ftunivemp_fem numeric(12,2),
    il_sum_ptunivemp_fem numeric(12,2),
    il_sum_total_hdcoach numeric(12,2),
    il_men_ftascoach_male numeric(12,2),
    il_men_ptascoach_male numeric(12,2),
    il_men_ftacunivemp_male numeric(12,2),
    il_men_ptacunivemp_male numeric(12,2),
    il_men_ftasstcoach_fem numeric(12,2),
    il_men_ptasstcoach_fem numeric(12,2),
    il_men_ftacunivemp_fem numeric(12,2),
    il_men_ptacunivemp_fem numeric(12,2),
    il_men_total_asstcoach numeric(12,2),
    il_women_ftascoach_male numeric(12,2),
    il_women_ptascoach_male numeric(12,2),
    il_women_ftacunemp_male numeric(12,2),
    il_women_ptacunemp_male numeric(12,2),
    il_women_ftastcoach_fem numeric(12,2),
    il_women_ptastcoach_fem numeric(12,2),
    il_womn_ftacunivemp_fem numeric(12,2),
    il_womn_ptacunivemp_fem numeric(12,2),
    il_women_total_astcoach numeric(12,2),
    il_coed_ftascoach_male numeric(12,2),
    il_coed_ptascoach_male numeric(12,2),
    il_coed_ftacunemp_male numeric(12,2),
    il_coed_ptacunemp_male numeric(12,2),
    il_coed_ftastcoach_fem numeric(12,2),
    il_coed_ptastcoach_fem numeric(12,2),
    il_coed_ftacunivemp_fem numeric(12,2),
    il_coed_ptacunivemp_fem numeric(12,2),
    il_coed_total_astcoach numeric(12,2),
    il_sum_ftascoach_male numeric(12,2),
    il_sum_ptascoach_male numeric(12,2),
    il_sum_ftacunivemp_male numeric(12,2),
    il_sum_ptacunivemp_male numeric(12,2),
    il_sum_ftascoach_fem numeric(12,2),
    il_sum_ptascoach_fem numeric(12,2),
    il_sum_ftacunivemp_fem numeric(12,2),
    il_sum_ptacunivemp_fem numeric(12,2),
    il_sum_total_asstcoach numeric(12,2),
    il_rev_men numeric(12,2),
    il_rev_women numeric(12,2),
    il_total_rev_menwomen numeric(12,2),
    il_rev_coed_men numeric(12,2),
    il_rev_coed_women numeric(12,2),
    il_total_rev_coed numeric(12,2),
    il_revenue_menall numeric(12,2),
    il_revenue_womenall numeric(12,2),
    il_total_revenue_all numeric(12,2),
    il_exp_men numeric(12,2),
    il_exp_women numeric(12,2),
    il_total_exp_menwomen numeric(12,2),
    il_exp_coed_men numeric(12,2),
    il_exp_coed_women numeric(12,2),
    il_total_exp_coed numeric(12,2),
    il_expense_menall numeric(12,2),
    il_expense_womenall numeric(12,2),
    il_total_expense_all numeric(12,2),
    undup_ct_partic_men integer,
    undup_ct_partic_women integer,
    tot_revenue_all_notalloc numeric(12,2),
    tot_expense_all_notalloc numeric(12,2),
    grnd_total_revenue numeric(12,2),
    grnd_total_expense numeric(12,2),
    opeid character(8)
);
```

Save the data from the EADA website as a CSV and load it into this table using:

``` sql
\COPY raw_eada(unitid, opeid, institution_name, addr1_txt, addr2_txt, city_txt, state_cd, zip_text, classificationcode, classification_name, classificationother, efmalecount, effemalecount, eftotalcount, sector_cd, sector_name, studentaid_men, studentaid_women, studentaid_coed, studentaid_total, stuaid_men_ratio, stuaid_women_ratio, stuaid_coed_ratio, recruitexp_men, recruitexp_women, recruitexp_coed, recruitexp_total, hdcoach_salary_men, hdcoach_salary_women, hdcoach_salary_coed, num_hdcoach_men, num_hdcoach_women, num_hdcoach_coed, hdcoach_sal_fte_men, hdcoach_sal_fte_womn, hdcoach_sal_fte_coed, fte_hdcoach_men, fte_hdcoach_women, fte_hdcoach_coed, ascoach_salary_men, ascoach_salary_women, ascoach_salary_coed, num_ascoach_men, num_ascoach_women, num_ascoach_coed, ascoach_sal_fte_men, ascoach_sal_fte_womn, ascoach_sal_fte_coed, fte_ascoach_men, fte_ascoach_women, fte_ascoach_coed, il_partic_men, il_partic_women, il_partic_coed_men, il_partic_coed_women, il_sum_partic_men, il_sum_partic_women, il_opexpperpart_men, il_opexpperteam_men, il_opexpperpart_women, il_opexpperteam_women, il_total_opexp_menwomen, il_opexpperpart_coed_men, il_opexpperteam_coed_men, il_opexp_part_coed_women, il_opexp_team_coed_women, il_total_opexp_coedteam, il_sum_opexpperpart_men, il_sum_opexpperteam_men, il_sum_opexpperpart_women, il_sum_opexpperteam_women, il_total_opexp_inclcoed, il_men_ftheadcoach_male, il_men_ptheadcoach_male, il_men_ftunivemploy_male, il_men_ptunivemploy_male, il_men_ftheadcoach_fem, il_men_ptheadcoach_fem, il_men_ftunivemploy_fem, il_men_ptunivemploy_fem, il_men_total_headcoach, il_women_fthdcoach_male, il_women_pthdcoach_male, il_women_ftunivemp_male, il_women_ptunivemp_male, il_women_fthdcoach_fem, il_women_pthdcoach_fem, il_women_ftunivemp_fem, il_women_ptunivemp_fem, il_women_total_hdcoach, il_coed_fthdcoach_male, il_coed_pthdcoach_male, il_coed_ftunivemp_male, il_coed_ptunivemp_male, il_coed_fthdcoach_fem, il_coed_pthdcoach_fem, il_coed_ftunivemp_fem, il_coed_ptunivemp_fem, il_coed_total_hdcoach, il_sum_fthdcoach_male, il_sum_pthdcoach_male, il_sum_ftunivemp_male, il_sum_ptunivemp_male, il_sum_fthdcoach_fem, il_sum_pthdcoach_fem, il_sum_ftunivemp_fem, il_sum_ptunivemp_fem, il_sum_total_hdcoach, il_men_ftascoach_male, il_men_ptascoach_male, il_men_ftacunivemp_male, il_men_ptacunivemp_male, il_men_ftasstcoach_fem, il_men_ptasstcoach_fem, il_men_ftacunivemp_fem, il_men_ptacunivemp_fem, il_men_total_asstcoach, il_women_ftascoach_male, il_women_ptascoach_male, il_women_ftacunemp_male, il_women_ptacunemp_male, il_women_ftastcoach_fem, il_women_ptastcoach_fem, il_womn_ftacunivemp_fem, il_womn_ptacunivemp_fem, il_women_total_astcoach, il_coed_ftascoach_male, il_coed_ptascoach_male, il_coed_ftacunemp_male, il_coed_ptacunemp_male, il_coed_ftastcoach_fem, il_coed_ptastcoach_fem, il_coed_ftacunivemp_fem, il_coed_ptacunivemp_fem, il_coed_total_astcoach, il_sum_ftascoach_male, il_sum_ptascoach_male, il_sum_ftacunivemp_male, il_sum_ptacunivemp_male, il_sum_ftascoach_fem, il_sum_ptascoach_fem, il_sum_ftacunivemp_fem, il_sum_ptacunivemp_fem, il_sum_total_asstcoach, il_rev_men, il_rev_women, il_total_rev_menwomen, il_rev_coed_men, il_rev_coed_women, il_total_rev_coed, il_revenue_menall, il_revenue_womenall, il_total_revenue_all, il_exp_men, il_exp_women, il_total_exp_menwomen, il_exp_coed_men, il_exp_coed_women, il_total_exp_coed, il_expense_menall, il_expense_womenall, il_total_expense_all, undup_ct_partic_men, undup_ct_partic_women, tot_revenue_all_notalloc, tot_expense_all_notalloc, grnd_total_revenue, grnd_total_expense) FROM '2022.csv' DELIMITER ',' CSV HEADER;
```

Once the data is loaded, you can update the year in this way:

``` sql
UPDATE raw_eada SET year = 2022 WHERE year IS NULL;
```

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
