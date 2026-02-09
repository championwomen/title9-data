# Known Issues

## Lightdash: eada_by_sport Not Appearing as Explore

**Status:** Under investigation

**Symptom:** 
- Lightdash only shows 3 explores: `eada`, `eada_full`, `male_female_eada`
- Missing: `eada_by_sport` (the sport-level detail table)

**Evidence from Logs:**
```
Manifest models 11
Filtered models 3
Validate 3 models in manifest with version v12
Fetching table metadata for 3 tables
Saved 3 explores to cache
```

Lightdash sees the model in the dbt manifest but filters it out during validation.

**Possible Causes:**
1. Table type difference: `eada_by_sport` is a BASE TABLE, others are VIEWs
2. Lightdash requires unique keys on tables (not present)
3. Column type mismatches between dbt YML and actual database

**Workarounds:**
1. Use **SQL Runner** in Lightdash to query `eada_by_sport` directly:
   ```sql
   SELECT * FROM dev.eada_by_sport LIMIT 100
   ```

2. Create a **view** based on eada_by_sport:
   ```sql
   CREATE VIEW dev.eada_by_sport_view AS SELECT * FROM dev.eada_by_sport;
   ```

3. Use **Lightdash Cloud** (app.lightdash.com) instead of self-hosted

**Next Steps:**
- Try converting eada_by_sport from table to view
- Add explicit unique keys to the model
- Check Lightdash documentation for self-hosted table requirements
