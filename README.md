### Title 9 DBT

This repository contains the database processing and calculations around the data collected on Title IX from the [Equity in Athletics Data Analysis website](https://ope.ed.gov/athletics).  We've loaded the data from each year into a single database segmented by year.  You can see how we process the data by looking at:
1. Renaming the columns into names that are more complete and easier to understand.  See [models/eada.sql](https://github.com/championwomen/title9-data/blob/main/models/eada.sql).
2. Reformatting some of the data into one row per sex and year and school vs. a single row per school.  See [models/male_female_eada.sql](https://github.com/championwomen/title9-data/blob/main/models/male_female_eada.sql)
3. Setting up the formatting and calculations.  See [models/eada.yml](https://github.com/championwomen/title9-data/blob/main/models/eada.yml)
 and [models/male_female_eada.yml](https://github.com/championwomen/title9-data/blob/main/models/male_female_eada.yml).

We are using DBT to process the data and to be able to re-process and test it easily.

Try running the following commands:
- `dbt run`
- `dbt test`

### Docker Setup (Recommended)

If you're already using PostgreSQL for other projects, it's recommended to run a dedicated Postgres instance in Docker on a non-standard port (5434) to avoid conflicts.

```bash
# Start both PostgreSQL and Lightdash
docker compose up -d

# Start only PostgreSQL
docker compose up -d postgres

# Stop all services
docker compose down

# Reset everything (including data)
docker compose down -v

# View logs
docker compose logs -f postgres
docker compose logs -f lightdash
```

The Docker setup includes:
- **PostgreSQL 15** running on port **5434** (mapped from container port 5432)
- **Lightdash** BI tool running on port **8080** for local testing
- Persistent volumes for data storage
- Mounted `./data` directory for loading CSV files
- Health checks to ensure services are ready

#### Lightdash (Local BI Testing)

The Docker setup includes Lightdash for testing your dbt models locally:

```bash
# Start all services (includes Lightdash)
docker compose up -d

# Wait for Lightdash to start (first time may take 2-3 minutes)
docker compose logs -f lightdash

# Access Lightdash
open http://localhost:8080
```

**First-time setup:**

⚠️ **Important:** The available connection methods in the UI have limitations:
- **dbt Cloud** - For cloud-hosted dbt (not local)
- **dbt local server** - Requires dbt RPC server (❌ deprecated in dbt 1.5+)
- **CLI** - Lightdash CLI expects HTTPS; local HTTP server causes SSL errors
- **GitHub** - Can work with public repos or local files

**Recommended approach for local development:**

1. **Start the services** (if not already running):
   ```bash
   docker compose up -d
   ```

2. **Run dbt** to compile your models:
   ```bash
   source venv/bin/activate
   dbt run --profiles-dir .
   ```

3. **Open Lightdash:** http://localhost:8080

4. **Create a new project:**
   - Click "Create project"
   - Try **"GitHub"** option first:
     - For testing, you can create a public GitHub repo with your dbt project
     - Or use local development workarounds below
   - If GitHub doesn't work, try the **CLI** option (see troubleshooting below)

5. **Connect to PostgreSQL:**
   - Host: `postgres`
   - Port: `5432`
   - Database: `title9`
   - User: `title9`
   - Password: `title9`
   - Schema: `dev`

6. **Explore your data!**

**Troubleshooting - CLI SSL Error:**
If you get "The server does not support SSL connections" with the CLI:
```bash
# The CLI requires HTTPS but local server uses HTTP
# Workaround: Push your dbt project to GitHub and use GitHub integration
# Or use Lightdash Cloud (https://app.lightdash.com) with your production database
```

**Alternative: Direct SQL Exploration**
Since Lightdash local setup has limitations, you can also:
- Use the Lightdash UI to write custom SQL queries directly
- Connect to your PostgreSQL database at `postgres:5432`
- Query the compiled dbt models in the `dev` schema

**Note:** Lightdash connects to the PostgreSQL container internally using the Docker network. From your host machine, use port 5434 for dbt commands, but Lightdash uses the internal `postgres:5432` connection.

**Note:** Lightdash runs via emulation on ARM64 (Apple Silicon) Macs. For local testing, this works fine and is the recommended approach.

### Configure dbt

In order to set up `dbt`, you have to set up a `profiles.yml` configuration file. We provide one in the project root (`./profiles.yml`), or you can put it in `~/.dbt/profiles.yml`.

**The project includes three targets:**

1. **`dev`** - For local dbt CLI usage (outside Docker)
   - Connects to: `localhost:5434`
   - Used when running: `dbt run --profiles-dir .`

2. **`docker`** - For Lightdash running in Docker
   - Connects to: `postgres:5432` (internal Docker network)
   - Used automatically by Lightdash container

3. **`prod`** - For production deployment
   - Update with your production database credentials

**Current profiles.yml:**
```yaml
title9:
  outputs:
    dev:
      type: postgres
      threads: 4
      host: localhost
      port: 5434
      user: title9
      pass: title9
      dbname: title9
      schema: dev
    
    docker:
      type: postgres
      threads: 4
      host: postgres  # Internal Docker network
      port: 5432
      user: title9
      pass: title9
      dbname: title9
      schema: dev
    
    prod:
      type: postgres
      threads: 4
      host: YOUR_PROD_HOST
      port: 5432
      user: title9
      pass: YOUR_PASSWORD
      dbname: title9
      schema: prod
  
  target: dev  # Default target for local CLI
```

**For local PostgreSQL:**
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

Note that the `opeid` column is new, and is only present in the data from 2022 and on.

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

**For Docker setup:**
Place your CSV files in the `./data/` directory (mounted to `/data/` in the container), then use the path `/data/yourfile.csv` in the COPY command below.

**For local PostgreSQL:**
Use your local file path in the COPY command below.

``` sql
\COPY raw_eada(unitid, opeid, institution_name, addr1_txt, addr2_txt, city_txt, state_cd, zip_text, classificationcode, classification_name, classificationother, efmalecount, effemalecount, eftotalcount, sector_cd, sector_name, studentaid_men, studentaid_women, studentaid_coed, studentaid_total, stuaid_men_ratio, stuaid_women_ratio, stuaid_coed_ratio, recruitexp_men, recruitexp_women, recruitexp_coed, recruitexp_total, hdcoach_salary_men, hdcoach_salary_women, hdcoach_salary_coed, num_hdcoach_men, num_hdcoach_women, num_hdcoach_coed, hdcoach_sal_fte_men, hdcoach_sal_fte_womn, hdcoach_sal_fte_coed, fte_hdcoach_men, fte_hdcoach_women, fte_hdcoach_coed, ascoach_salary_men, ascoach_salary_women, ascoach_salary_coed, num_ascoach_men, num_ascoach_women, num_ascoach_coed, ascoach_sal_fte_men, ascoach_sal_fte_womn, ascoach_sal_fte_coed, fte_ascoach_men, fte_ascoach_women, fte_ascoach_coed, il_partic_men, il_partic_women, il_partic_coed_men, il_partic_coed_women, il_sum_partic_men, il_sum_partic_women, il_opexpperpart_men, il_opexpperteam_men, il_opexpperpart_women, il_opexpperteam_women, il_total_opexp_menwomen, il_opexpperpart_coed_men, il_opexpperteam_coed_men, il_opexp_part_coed_women, il_opexp_team_coed_women, il_total_opexp_coedteam, il_sum_opexpperpart_men, il_sum_opexpperteam_men, il_sum_opexpperpart_women, il_sum_opexpperteam_women, il_total_opexp_inclcoed, il_men_ftheadcoach_male, il_men_ptheadcoach_male, il_men_ftunivemploy_male, il_men_ptunivemploy_male, il_men_ftheadcoach_fem, il_men_ptheadcoach_fem, il_men_ftunivemploy_fem, il_men_ptunivemploy_fem, il_men_total_headcoach, il_women_fthdcoach_male, il_women_pthdcoach_male, il_women_ftunivemp_male, il_women_ptunivemp_male, il_women_fthdcoach_fem, il_women_pthdcoach_fem, il_women_ftunivemp_fem, il_women_ptunivemp_fem, il_women_total_hdcoach, il_coed_fthdcoach_male, il_coed_pthdcoach_male, il_coed_ftunivemp_male, il_coed_ptunivemp_male, il_coed_fthdcoach_fem, il_coed_pthdcoach_fem, il_coed_ftunivemp_fem, il_coed_ptunivemp_fem, il_coed_total_hdcoach, il_sum_fthdcoach_male, il_sum_pthdcoach_male, il_sum_ftunivemp_male, il_sum_ptunivemp_male, il_sum_fthdcoach_fem, il_sum_pthdcoach_fem, il_sum_ftunivemp_fem, il_sum_ptunivemp_fem, il_sum_total_hdcoach, il_men_ftascoach_male, il_men_ptascoach_male, il_men_ftacunivemp_male, il_men_ptacunivemp_male, il_men_ftasstcoach_fem, il_men_ptasstcoach_fem, il_men_ftacunivemp_fem, il_men_ptacunivemp_fem, il_men_total_asstcoach, il_women_ftascoach_male, il_women_ptascoach_male, il_women_ftacunemp_male, il_women_ptacunemp_male, il_women_ftastcoach_fem, il_women_ptastcoach_fem, il_womn_ftacunivemp_fem, il_womn_ptacunivemp_fem, il_women_total_astcoach, il_coed_ftascoach_male, il_coed_ptascoach_male, il_coed_ftacunemp_male, il_coed_ptacunemp_male, il_coed_ftastcoach_fem, il_coed_ptastcoach_fem, il_coed_ftacunivemp_fem, il_coed_ptacunivemp_fem, il_coed_total_astcoach, il_sum_ftascoach_male, il_sum_ptascoach_male, il_sum_ftacunivemp_male, il_sum_ptacunivemp_male, il_sum_ftascoach_fem, il_sum_ptascoach_fem, il_sum_ftacunivemp_fem, il_sum_ptacunivemp_fem, il_sum_total_asstcoach, il_rev_men, il_rev_women, il_total_rev_menwomen, il_rev_coed_men, il_rev_coed_women, il_total_rev_coed, il_revenue_menall, il_revenue_womenall, il_total_revenue_all, il_exp_men, il_exp_women, il_total_exp_menwomen, il_exp_coed_men, il_exp_coed_women, il_total_exp_coed, il_expense_menall, il_expense_womenall, il_total_expense_all, undup_ct_partic_men, undup_ct_partic_women, tot_revenue_all_notalloc, tot_expense_all_notalloc, grnd_total_revenue, grnd_total_expense) FROM '2022.csv' DELIMITER ',' CSV HEADER;
```

Once the data is loaded, you can update the year in this way:

``` sql
UPDATE raw_eada SET year = 2022 WHERE year IS NULL;
```

We have a supplementary table that we're manually collecting that
includes the number of male practice players on each women's sports
team.  Here is the SQL to create that table:

``` sql
CREATE TABLE public.raw_practice_players (
    year integer,
    unitid integer,
    num_male_practice_players integer
);

```

Import from a CSV file:

**Note:** For Docker, place the file in `./data/` and use `/data/mpp-2022.csv` as the path.

``` sql
\COPY raw_practice_players(unitid, num_male_practice_players) FROM 'mpp-2022.csv' DELIMITER ',' CSV HEADER;
```

Update the practice players data to include the year:
``` sql
UPDATE raw_practice_players SET year = 2022 WHERE year IS NULL;
```


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


UPDATE raw_eada SET year = 2023 WHERE year IS NULL;
