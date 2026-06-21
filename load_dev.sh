#!/bin/bash
# Local dev loader: rebuild raw_eada_by_sport (long, 2009-2025) and add 2025
# general data to raw_eada, then run dbt against the dev target.
#
# Prereq: Docker Desktop running. ./data is mounted to /data in the postgres
# container, so we use fast server-side COPY.
set -euo pipefail
cd "$(dirname "$0")"

PG="docker exec -i title9-postgres psql -v ON_ERROR_STOP=1 -U title9 -d title9"
BY_SPORT_CSV="/data/eada_by_sport_long_2009_2025.csv"
GENERAL_CSV="/data/2025.csv"
GENERAL_YEAR=2025

# raw_eada column list (in CSV order) — extracted from the canonical COPY
# statement in README.md so there is a single source of truth (avoids a
# hand-maintained 168-name list).
RAW_EADA_COLS="$(python3 - <<'PY'
import re
m = re.search(r'\\COPY raw_eada\((.*?)\) FROM', open("README.md").read(), re.S)
print(", ".join(c.strip() for c in m.group(1).split(",")))
PY
)"
if [ "$(echo "$RAW_EADA_COLS" | tr ',' '\n' | wc -l | tr -d ' ')" != "168" ]; then
  echo "ERROR: expected 168 raw_eada columns, got a different count"; exit 1
fi

echo "==> Starting postgres..."
docker compose up -d postgres
echo "==> Waiting for healthy postgres..."
until docker exec title9-postgres pg_isready -U title9 >/dev/null 2>&1; do sleep 2; done

echo "==> [by-sport] Recreating raw_eada_by_sport (long schema) ..."
$PG < create_raw_eada_by_sport.sql

echo "==> [by-sport] Loading $BY_SPORT_CSV via COPY ..."
$PG -c "COPY raw_eada_by_sport FROM '$BY_SPORT_CSV' WITH (FORMAT CSV, HEADER, NULL '')"
$PG -c "SELECT survey_year, count(*) FROM raw_eada_by_sport GROUP BY survey_year ORDER BY survey_year;"

echo "==> [general] Adding ${GENERAL_YEAR} into raw_eada (idempotent) ..."
$PG -c "DELETE FROM raw_eada WHERE year = ${GENERAL_YEAR};"
$PG -c "COPY raw_eada(${RAW_EADA_COLS}) FROM '$GENERAL_CSV' WITH (FORMAT CSV, HEADER, NULL '')"
$PG -c "UPDATE raw_eada SET year = ${GENERAL_YEAR} WHERE year IS NULL;"
$PG -c "SELECT year, count(*) FROM raw_eada GROUP BY year ORDER BY year;"

echo "==> Running dbt ..."
# The venv's `dbt` wrapper has a stale shebang; invoke dbt as a module instead.
if [ -x venv/bin/python3 ]; then DBT="venv/bin/python3 -m dbt.cli.main";
elif [ -x dbt-env/bin/python3 ]; then DBT="dbt-env/bin/python3 -m dbt.cli.main";
else DBT="dbt"; fi
$DBT run --profiles-dir . --select eada eada_by_sport male_female_eada eada_full
$DBT test --profiles-dir .

echo "==> Done."
