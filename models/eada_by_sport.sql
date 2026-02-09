-- View materialization for Lightdash compatibility
with sport_data as (
    -- All Track Combined - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'All Track Combined' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(all_track_combined_mens_team_participation, '')::integer as participation,
        NULLIF(all_track_combined_mens_team_revenue, '')::numeric as revenue,
        NULLIF(all_track_combined_mens_team_expenses, '')::numeric as expenses,
        NULLIF(all_track_combined_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(all_track_combined_mens_team_participation, '') IS NOT NULL AND NULLIF(all_track_combined_mens_team_participation, '') != '0') or NULLIF(all_track_combined_mens_team_revenue, '') IS NOT NULL

    union all

    -- All Track Combined - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'All Track Combined' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(all_track_combined_womens_team_participation, '')::integer as participation,
        NULLIF(all_track_combined_womens_team_revenue, '')::numeric as revenue,
        NULLIF(all_track_combined_womens_team_expenses, '')::numeric as expenses,
        NULLIF(all_track_combined_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(all_track_combined_womens_team_participation, '') IS NOT NULL AND NULLIF(all_track_combined_womens_team_participation, '') != '0') or NULLIF(all_track_combined_womens_team_revenue, '') IS NOT NULL

    union all

    -- All Track Combined - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'All Track Combined' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(all_track_combined_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(all_track_combined_coed_team_men_participation, '') IS NOT NULL AND NULLIF(all_track_combined_coed_team_men_participation, '') != '0'

    union all

    -- All Track Combined - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'All Track Combined' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(all_track_combined_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(all_track_combined_coed_team_women_participation, '') IS NOT NULL AND NULLIF(all_track_combined_coed_team_women_participation, '') != '0'

    union all

    -- Archery - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Archery' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(archery_mens_team_participation, '')::integer as participation,
        NULLIF(archery_mens_team_revenue, '')::numeric as revenue,
        NULLIF(archery_mens_team_expenses, '')::numeric as expenses,
        NULLIF(archery_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(archery_mens_team_participation, '') IS NOT NULL AND NULLIF(archery_mens_team_participation, '') != '0') or NULLIF(archery_mens_team_revenue, '') IS NOT NULL

    union all

    -- Archery - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Archery' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(archery_womens_team_participation, '')::integer as participation,
        NULLIF(archery_womens_team_revenue, '')::numeric as revenue,
        NULLIF(archery_womens_team_expenses, '')::numeric as expenses,
        NULLIF(archery_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(archery_womens_team_participation, '') IS NOT NULL AND NULLIF(archery_womens_team_participation, '') != '0') or NULLIF(archery_womens_team_revenue, '') IS NOT NULL

    union all

    -- Archery - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Archery' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(archery_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(archery_coed_team_men_participation, '') IS NOT NULL AND NULLIF(archery_coed_team_men_participation, '') != '0'

    union all

    -- Archery - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Archery' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(archery_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(archery_coed_team_women_participation, '') IS NOT NULL AND NULLIF(archery_coed_team_women_participation, '') != '0'

    union all

    -- Badminton - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Badminton' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(badminton_mens_team_participation, '')::integer as participation,
        NULLIF(badminton_mens_team_revenue, '')::numeric as revenue,
        NULLIF(badminton_mens_team_expenses, '')::numeric as expenses,
        NULLIF(badminton_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(badminton_mens_team_participation, '') IS NOT NULL AND NULLIF(badminton_mens_team_participation, '') != '0') or NULLIF(badminton_mens_team_revenue, '') IS NOT NULL

    union all

    -- Badminton - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Badminton' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(badminton_womens_team_participation, '')::integer as participation,
        NULLIF(badminton_womens_team_revenue, '')::numeric as revenue,
        NULLIF(badminton_womens_team_expenses, '')::numeric as expenses,
        NULLIF(badminton_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(badminton_womens_team_participation, '') IS NOT NULL AND NULLIF(badminton_womens_team_participation, '') != '0') or NULLIF(badminton_womens_team_revenue, '') IS NOT NULL

    union all

    -- Badminton - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Badminton' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(badminton_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(badminton_coed_team_men_participation, '') IS NOT NULL AND NULLIF(badminton_coed_team_men_participation, '') != '0'

    union all

    -- Badminton - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Badminton' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(badminton_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(badminton_coed_team_women_participation, '') IS NOT NULL AND NULLIF(badminton_coed_team_women_participation, '') != '0'

    union all

    -- Baseball - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Baseball' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(baseball_mens_team_participation, '')::integer as participation,
        NULLIF(baseball_mens_team_revenue, '')::numeric as revenue,
        NULLIF(baseball_mens_team_expenses, '')::numeric as expenses,
        NULLIF(baseball_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(baseball_mens_team_participation, '') IS NOT NULL AND NULLIF(baseball_mens_team_participation, '') != '0') or NULLIF(baseball_mens_team_revenue, '') IS NOT NULL

    union all

    -- Baseball - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Baseball' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(baseball_womens_team_participation, '')::integer as participation,
        NULLIF(baseball_womens_team_revenue, '')::numeric as revenue,
        NULLIF(baseball_womens_team_expenses, '')::numeric as expenses,
        NULLIF(baseball_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(baseball_womens_team_participation, '') IS NOT NULL AND NULLIF(baseball_womens_team_participation, '') != '0') or NULLIF(baseball_womens_team_revenue, '') IS NOT NULL

    union all

    -- Baseball - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Baseball' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(baseball_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(baseball_coed_team_men_participation, '') IS NOT NULL AND NULLIF(baseball_coed_team_men_participation, '') != '0'

    union all

    -- Baseball - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Baseball' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(baseball_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(baseball_coed_team_women_participation, '') IS NOT NULL AND NULLIF(baseball_coed_team_women_participation, '') != '0'

    union all

    -- Basketball - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Basketball' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(basketball_mens_team_participation, '')::integer as participation,
        NULLIF(basketball_mens_team_revenue, '')::numeric as revenue,
        NULLIF(basketball_mens_team_expenses, '')::numeric as expenses,
        NULLIF(basketball_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(basketball_mens_team_participation, '') IS NOT NULL AND NULLIF(basketball_mens_team_participation, '') != '0') or NULLIF(basketball_mens_team_revenue, '') IS NOT NULL

    union all

    -- Basketball - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Basketball' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(basketball_womens_team_participation, '')::integer as participation,
        NULLIF(basketball_womens_team_revenue, '')::numeric as revenue,
        NULLIF(basketball_womens_team_expenses, '')::numeric as expenses,
        NULLIF(basketball_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(basketball_womens_team_participation, '') IS NOT NULL AND NULLIF(basketball_womens_team_participation, '') != '0') or NULLIF(basketball_womens_team_revenue, '') IS NOT NULL

    union all

    -- Basketball - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Basketball' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(basketball_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(basketball_coed_team_men_participation, '') IS NOT NULL AND NULLIF(basketball_coed_team_men_participation, '') != '0'

    union all

    -- Basketball - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Basketball' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(basketball_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(basketball_coed_team_women_participation, '') IS NOT NULL AND NULLIF(basketball_coed_team_women_participation, '') != '0'

    union all

    -- Beach Volleyball - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Beach Volleyball' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(beach_volleyball_mens_team_participation, '')::integer as participation,
        NULLIF(beach_volleyball_mens_team_revenue, '')::numeric as revenue,
        NULLIF(beach_volleyball_mens_team_expenses, '')::numeric as expenses,
        NULLIF(beach_volleyball_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(beach_volleyball_mens_team_participation, '') IS NOT NULL AND NULLIF(beach_volleyball_mens_team_participation, '') != '0') or NULLIF(beach_volleyball_mens_team_revenue, '') IS NOT NULL

    union all

    -- Beach Volleyball - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Beach Volleyball' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(beach_volleyball_womens_team_participation, '')::integer as participation,
        NULLIF(beach_volleyball_womens_team_revenue, '')::numeric as revenue,
        NULLIF(beach_volleyball_womens_team_expenses, '')::numeric as expenses,
        NULLIF(beach_volleyball_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(beach_volleyball_womens_team_participation, '') IS NOT NULL AND NULLIF(beach_volleyball_womens_team_participation, '') != '0') or NULLIF(beach_volleyball_womens_team_revenue, '') IS NOT NULL

    union all

    -- Beach Volleyball - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Beach Volleyball' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(beach_volleyball_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(beach_volleyball_coed_team_men_participation, '') IS NOT NULL AND NULLIF(beach_volleyball_coed_team_men_participation, '') != '0'

    union all

    -- Beach Volleyball - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Beach Volleyball' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(beach_volleyball_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(beach_volleyball_coed_team_women_participation, '') IS NOT NULL AND NULLIF(beach_volleyball_coed_team_women_participation, '') != '0'

    union all

    -- Bowling - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Bowling' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(bowling_mens_team_participation, '')::integer as participation,
        NULLIF(bowling_mens_team_revenue, '')::numeric as revenue,
        NULLIF(bowling_mens_team_expenses, '')::numeric as expenses,
        NULLIF(bowling_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(bowling_mens_team_participation, '') IS NOT NULL AND NULLIF(bowling_mens_team_participation, '') != '0') or NULLIF(bowling_mens_team_revenue, '') IS NOT NULL

    union all

    -- Bowling - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Bowling' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(bowling_womens_team_participation, '')::integer as participation,
        NULLIF(bowling_womens_team_revenue, '')::numeric as revenue,
        NULLIF(bowling_womens_team_expenses, '')::numeric as expenses,
        NULLIF(bowling_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(bowling_womens_team_participation, '') IS NOT NULL AND NULLIF(bowling_womens_team_participation, '') != '0') or NULLIF(bowling_womens_team_revenue, '') IS NOT NULL

    union all

    -- Bowling - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Bowling' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(bowling_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(bowling_coed_team_men_participation, '') IS NOT NULL AND NULLIF(bowling_coed_team_men_participation, '') != '0'

    union all

    -- Bowling - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Bowling' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(bowling_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(bowling_coed_team_women_participation, '') IS NOT NULL AND NULLIF(bowling_coed_team_women_participation, '') != '0'

    union all

    -- Diving - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Diving' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(diving_mens_team_participation, '')::integer as participation,
        NULLIF(diving_mens_team_revenue, '')::numeric as revenue,
        NULLIF(diving_mens_team_expenses, '')::numeric as expenses,
        NULLIF(diving_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(diving_mens_team_participation, '') IS NOT NULL AND NULLIF(diving_mens_team_participation, '') != '0') or NULLIF(diving_mens_team_revenue, '') IS NOT NULL

    union all

    -- Diving - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Diving' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(diving_womens_team_participation, '')::integer as participation,
        NULLIF(diving_womens_team_revenue, '')::numeric as revenue,
        NULLIF(diving_womens_team_expenses, '')::numeric as expenses,
        NULLIF(diving_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(diving_womens_team_participation, '') IS NOT NULL AND NULLIF(diving_womens_team_participation, '') != '0') or NULLIF(diving_womens_team_revenue, '') IS NOT NULL

    union all

    -- Diving - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Diving' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(diving_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(diving_coed_team_men_participation, '') IS NOT NULL AND NULLIF(diving_coed_team_men_participation, '') != '0'

    union all

    -- Diving - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Diving' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(diving_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(diving_coed_team_women_participation, '') IS NOT NULL AND NULLIF(diving_coed_team_women_participation, '') != '0'

    union all

    -- Equestrian - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Equestrian' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(equestrian_mens_team_participation, '')::integer as participation,
        NULLIF(equestrian_mens_team_revenue, '')::numeric as revenue,
        NULLIF(equestrian_mens_team_expenses, '')::numeric as expenses,
        NULLIF(equestrian_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(equestrian_mens_team_participation, '') IS NOT NULL AND NULLIF(equestrian_mens_team_participation, '') != '0') or NULLIF(equestrian_mens_team_revenue, '') IS NOT NULL

    union all

    -- Equestrian - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Equestrian' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(equestrian_womens_team_participation, '')::integer as participation,
        NULLIF(equestrian_womens_team_revenue, '')::numeric as revenue,
        NULLIF(equestrian_womens_team_expenses, '')::numeric as expenses,
        NULLIF(equestrian_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(equestrian_womens_team_participation, '') IS NOT NULL AND NULLIF(equestrian_womens_team_participation, '') != '0') or NULLIF(equestrian_womens_team_revenue, '') IS NOT NULL

    union all

    -- Equestrian - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Equestrian' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(equestrian_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(equestrian_coed_team_men_participation, '') IS NOT NULL AND NULLIF(equestrian_coed_team_men_participation, '') != '0'

    union all

    -- Equestrian - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Equestrian' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(equestrian_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(equestrian_coed_team_women_participation, '') IS NOT NULL AND NULLIF(equestrian_coed_team_women_participation, '') != '0'

    union all

    -- Fencing - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Fencing' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(fencing_mens_team_participation, '')::integer as participation,
        NULLIF(fencing_mens_team_revenue, '')::numeric as revenue,
        NULLIF(fencing_mens_team_expenses, '')::numeric as expenses,
        NULLIF(fencing_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(fencing_mens_team_participation, '') IS NOT NULL AND NULLIF(fencing_mens_team_participation, '') != '0') or NULLIF(fencing_mens_team_revenue, '') IS NOT NULL

    union all

    -- Fencing - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Fencing' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(fencing_womens_team_participation, '')::integer as participation,
        NULLIF(fencing_womens_team_revenue, '')::numeric as revenue,
        NULLIF(fencing_womens_team_expenses, '')::numeric as expenses,
        NULLIF(fencing_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(fencing_womens_team_participation, '') IS NOT NULL AND NULLIF(fencing_womens_team_participation, '') != '0') or NULLIF(fencing_womens_team_revenue, '') IS NOT NULL

    union all

    -- Fencing - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Fencing' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(fencing_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(fencing_coed_team_men_participation, '') IS NOT NULL AND NULLIF(fencing_coed_team_men_participation, '') != '0'

    union all

    -- Fencing - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Fencing' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(fencing_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(fencing_coed_team_women_participation, '') IS NOT NULL AND NULLIF(fencing_coed_team_women_participation, '') != '0'

    union all

    -- Field Hockey - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Field Hockey' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(field_hockey_mens_team_participation, '')::integer as participation,
        NULLIF(field_hockey_mens_team_revenue, '')::numeric as revenue,
        NULLIF(field_hockey_mens_team_expenses, '')::numeric as expenses,
        NULLIF(field_hockey_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(field_hockey_mens_team_participation, '') IS NOT NULL AND NULLIF(field_hockey_mens_team_participation, '') != '0') or NULLIF(field_hockey_mens_team_revenue, '') IS NOT NULL

    union all

    -- Field Hockey - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Field Hockey' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(field_hockey_womens_team_participation, '')::integer as participation,
        NULLIF(field_hockey_womens_team_revenue, '')::numeric as revenue,
        NULLIF(field_hockey_womens_team_expenses, '')::numeric as expenses,
        NULLIF(field_hockey_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(field_hockey_womens_team_participation, '') IS NOT NULL AND NULLIF(field_hockey_womens_team_participation, '') != '0') or NULLIF(field_hockey_womens_team_revenue, '') IS NOT NULL

    union all

    -- Field Hockey - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Field Hockey' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(field_hockey_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(field_hockey_coed_team_men_participation, '') IS NOT NULL AND NULLIF(field_hockey_coed_team_men_participation, '') != '0'

    union all

    -- Field Hockey - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Field Hockey' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(field_hockey_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(field_hockey_coed_team_women_participation, '') IS NOT NULL AND NULLIF(field_hockey_coed_team_women_participation, '') != '0'

    union all

    -- Football - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Football' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(football_mens_team_participation, '')::integer as participation,
        NULLIF(football_mens_team_revenue, '')::numeric as revenue,
        NULLIF(football_mens_team_expenses, '')::numeric as expenses,
        NULLIF(football_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(football_mens_team_participation, '') IS NOT NULL AND NULLIF(football_mens_team_participation, '') != '0') or NULLIF(football_mens_team_revenue, '') IS NOT NULL

    union all

    -- Football - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Football' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(football_womens_team_participation, '')::integer as participation,
        NULLIF(football_womens_team_revenue, '')::numeric as revenue,
        NULLIF(football_womens_team_expenses, '')::numeric as expenses,
        NULLIF(football_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(football_womens_team_participation, '') IS NOT NULL AND NULLIF(football_womens_team_participation, '') != '0') or NULLIF(football_womens_team_revenue, '') IS NOT NULL

    union all

    -- Football - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Football' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(football_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(football_coed_team_men_participation, '') IS NOT NULL AND NULLIF(football_coed_team_men_participation, '') != '0'

    union all

    -- Football - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Football' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(football_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(football_coed_team_women_participation, '') IS NOT NULL AND NULLIF(football_coed_team_women_participation, '') != '0'

    union all

    -- Golf - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Golf' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(golf_mens_team_participation, '')::integer as participation,
        NULLIF(golf_mens_team_revenue, '')::numeric as revenue,
        NULLIF(golf_mens_team_expenses, '')::numeric as expenses,
        NULLIF(golf_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(golf_mens_team_participation, '') IS NOT NULL AND NULLIF(golf_mens_team_participation, '') != '0') or NULLIF(golf_mens_team_revenue, '') IS NOT NULL

    union all

    -- Golf - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Golf' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(golf_womens_team_participation, '')::integer as participation,
        NULLIF(golf_womens_team_revenue, '')::numeric as revenue,
        NULLIF(golf_womens_team_expenses, '')::numeric as expenses,
        NULLIF(golf_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(golf_womens_team_participation, '') IS NOT NULL AND NULLIF(golf_womens_team_participation, '') != '0') or NULLIF(golf_womens_team_revenue, '') IS NOT NULL

    union all

    -- Golf - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Golf' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(golf_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(golf_coed_team_men_participation, '') IS NOT NULL AND NULLIF(golf_coed_team_men_participation, '') != '0'

    union all

    -- Golf - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Golf' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(golf_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(golf_coed_team_women_participation, '') IS NOT NULL AND NULLIF(golf_coed_team_women_participation, '') != '0'

    union all

    -- Gymnastics - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Gymnastics' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(gymnastics_mens_team_participation, '')::integer as participation,
        NULLIF(gymnastics_mens_team_revenue, '')::numeric as revenue,
        NULLIF(gymnastics_mens_team_expenses, '')::numeric as expenses,
        NULLIF(gymnastics_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(gymnastics_mens_team_participation, '') IS NOT NULL AND NULLIF(gymnastics_mens_team_participation, '') != '0') or NULLIF(gymnastics_mens_team_revenue, '') IS NOT NULL

    union all

    -- Gymnastics - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Gymnastics' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(gymnastics_womens_team_participation, '')::integer as participation,
        NULLIF(gymnastics_womens_team_revenue, '')::numeric as revenue,
        NULLIF(gymnastics_womens_team_expenses, '')::numeric as expenses,
        NULLIF(gymnastics_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(gymnastics_womens_team_participation, '') IS NOT NULL AND NULLIF(gymnastics_womens_team_participation, '') != '0') or NULLIF(gymnastics_womens_team_revenue, '') IS NOT NULL

    union all

    -- Gymnastics - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Gymnastics' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(gymnastics_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(gymnastics_coed_team_men_participation, '') IS NOT NULL AND NULLIF(gymnastics_coed_team_men_participation, '') != '0'

    union all

    -- Gymnastics - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Gymnastics' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(gymnastics_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(gymnastics_coed_team_women_participation, '') IS NOT NULL AND NULLIF(gymnastics_coed_team_women_participation, '') != '0'

    union all

    -- Ice Hockey - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Ice Hockey' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(ice_hockey_mens_team_participation, '')::integer as participation,
        NULLIF(ice_hockey_mens_team_revenue, '')::numeric as revenue,
        NULLIF(ice_hockey_mens_team_expenses, '')::numeric as expenses,
        NULLIF(ice_hockey_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(ice_hockey_mens_team_participation, '') IS NOT NULL AND NULLIF(ice_hockey_mens_team_participation, '') != '0') or NULLIF(ice_hockey_mens_team_revenue, '') IS NOT NULL

    union all

    -- Ice Hockey - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Ice Hockey' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(ice_hockey_womens_team_participation, '')::integer as participation,
        NULLIF(ice_hockey_womens_team_revenue, '')::numeric as revenue,
        NULLIF(ice_hockey_womens_team_expenses, '')::numeric as expenses,
        NULLIF(ice_hockey_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(ice_hockey_womens_team_participation, '') IS NOT NULL AND NULLIF(ice_hockey_womens_team_participation, '') != '0') or NULLIF(ice_hockey_womens_team_revenue, '') IS NOT NULL

    union all

    -- Ice Hockey - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Ice Hockey' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(ice_hockey_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(ice_hockey_coed_team_men_participation, '') IS NOT NULL AND NULLIF(ice_hockey_coed_team_men_participation, '') != '0'

    union all

    -- Ice Hockey - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Ice Hockey' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(ice_hockey_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(ice_hockey_coed_team_women_participation, '') IS NOT NULL AND NULLIF(ice_hockey_coed_team_women_participation, '') != '0'

    union all

    -- Lacrosse - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Lacrosse' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(lacrosse_mens_team_participation, '')::integer as participation,
        NULLIF(lacrosse_mens_team_revenue, '')::numeric as revenue,
        NULLIF(lacrosse_mens_team_expenses, '')::numeric as expenses,
        NULLIF(lacrosse_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(lacrosse_mens_team_participation, '') IS NOT NULL AND NULLIF(lacrosse_mens_team_participation, '') != '0') or NULLIF(lacrosse_mens_team_revenue, '') IS NOT NULL

    union all

    -- Lacrosse - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Lacrosse' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(lacrosse_womens_team_participation, '')::integer as participation,
        NULLIF(lacrosse_womens_team_revenue, '')::numeric as revenue,
        NULLIF(lacrosse_womens_team_expenses, '')::numeric as expenses,
        NULLIF(lacrosse_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(lacrosse_womens_team_participation, '') IS NOT NULL AND NULLIF(lacrosse_womens_team_participation, '') != '0') or NULLIF(lacrosse_womens_team_revenue, '') IS NOT NULL

    union all

    -- Lacrosse - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Lacrosse' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(lacrosse_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(lacrosse_coed_team_men_participation, '') IS NOT NULL AND NULLIF(lacrosse_coed_team_men_participation, '') != '0'

    union all

    -- Lacrosse - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Lacrosse' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(lacrosse_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(lacrosse_coed_team_women_participation, '') IS NOT NULL AND NULLIF(lacrosse_coed_team_women_participation, '') != '0'

    union all

    -- Other Sports - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Other Sports' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(other_sports_mens_team_participation, '')::integer as participation,
        NULLIF(other_sports_mens_team_revenue, '')::numeric as revenue,
        NULLIF(other_sports_mens_team_expenses, '')::numeric as expenses,
        NULLIF(other_sports_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(other_sports_mens_team_participation, '') IS NOT NULL AND NULLIF(other_sports_mens_team_participation, '') != '0') or NULLIF(other_sports_mens_team_revenue, '') IS NOT NULL

    union all

    -- Other Sports - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Other Sports' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(other_sports_womens_team_participation, '')::integer as participation,
        NULLIF(other_sports_womens_team_revenue, '')::numeric as revenue,
        NULLIF(other_sports_womens_team_expenses, '')::numeric as expenses,
        NULLIF(other_sports_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(other_sports_womens_team_participation, '') IS NOT NULL AND NULLIF(other_sports_womens_team_participation, '') != '0') or NULLIF(other_sports_womens_team_revenue, '') IS NOT NULL

    union all

    -- Other Sports - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Other Sports' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(other_sports_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(other_sports_coed_team_men_participation, '') IS NOT NULL AND NULLIF(other_sports_coed_team_men_participation, '') != '0'

    union all

    -- Other Sports - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Other Sports' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(other_sports_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(other_sports_coed_team_women_participation, '') IS NOT NULL AND NULLIF(other_sports_coed_team_women_participation, '') != '0'

    union all

    -- Rifle - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Rifle' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(rifle_mens_team_participation, '')::integer as participation,
        NULLIF(rifle_mens_team_revenue, '')::numeric as revenue,
        NULLIF(rifle_mens_team_expenses, '')::numeric as expenses,
        NULLIF(rifle_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(rifle_mens_team_participation, '') IS NOT NULL AND NULLIF(rifle_mens_team_participation, '') != '0') or NULLIF(rifle_mens_team_revenue, '') IS NOT NULL

    union all

    -- Rifle - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Rifle' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(rifle_womens_team_participation, '')::integer as participation,
        NULLIF(rifle_womens_team_revenue, '')::numeric as revenue,
        NULLIF(rifle_womens_team_expenses, '')::numeric as expenses,
        NULLIF(rifle_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(rifle_womens_team_participation, '') IS NOT NULL AND NULLIF(rifle_womens_team_participation, '') != '0') or NULLIF(rifle_womens_team_revenue, '') IS NOT NULL

    union all

    -- Rifle - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Rifle' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(rifle_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(rifle_coed_team_men_participation, '') IS NOT NULL AND NULLIF(rifle_coed_team_men_participation, '') != '0'

    union all

    -- Rifle - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Rifle' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(rifle_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(rifle_coed_team_women_participation, '') IS NOT NULL AND NULLIF(rifle_coed_team_women_participation, '') != '0'

    union all

    -- Rodeo - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Rodeo' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(rodeo_mens_team_participation, '')::integer as participation,
        NULLIF(rodeo_mens_team_revenue, '')::numeric as revenue,
        NULLIF(rodeo_mens_team_expenses, '')::numeric as expenses,
        NULLIF(rodeo_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(rodeo_mens_team_participation, '') IS NOT NULL AND NULLIF(rodeo_mens_team_participation, '') != '0') or NULLIF(rodeo_mens_team_revenue, '') IS NOT NULL

    union all

    -- Rodeo - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Rodeo' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(rodeo_womens_team_participation, '')::integer as participation,
        NULLIF(rodeo_womens_team_revenue, '')::numeric as revenue,
        NULLIF(rodeo_womens_team_expenses, '')::numeric as expenses,
        NULLIF(rodeo_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(rodeo_womens_team_participation, '') IS NOT NULL AND NULLIF(rodeo_womens_team_participation, '') != '0') or NULLIF(rodeo_womens_team_revenue, '') IS NOT NULL

    union all

    -- Rodeo - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Rodeo' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(rodeo_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(rodeo_coed_team_men_participation, '') IS NOT NULL AND NULLIF(rodeo_coed_team_men_participation, '') != '0'

    union all

    -- Rodeo - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Rodeo' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(rodeo_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(rodeo_coed_team_women_participation, '') IS NOT NULL AND NULLIF(rodeo_coed_team_women_participation, '') != '0'

    union all

    -- Rowing - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Rowing' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(rowing_mens_team_participation, '')::integer as participation,
        NULLIF(rowing_mens_team_revenue, '')::numeric as revenue,
        NULLIF(rowing_mens_team_expenses, '')::numeric as expenses,
        NULLIF(rowing_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(rowing_mens_team_participation, '') IS NOT NULL AND NULLIF(rowing_mens_team_participation, '') != '0') or NULLIF(rowing_mens_team_revenue, '') IS NOT NULL

    union all

    -- Rowing - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Rowing' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(rowing_womens_team_participation, '')::integer as participation,
        NULLIF(rowing_womens_team_revenue, '')::numeric as revenue,
        NULLIF(rowing_womens_team_expenses, '')::numeric as expenses,
        NULLIF(rowing_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(rowing_womens_team_participation, '') IS NOT NULL AND NULLIF(rowing_womens_team_participation, '') != '0') or NULLIF(rowing_womens_team_revenue, '') IS NOT NULL

    union all

    -- Rowing - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Rowing' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(rowing_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(rowing_coed_team_men_participation, '') IS NOT NULL AND NULLIF(rowing_coed_team_men_participation, '') != '0'

    union all

    -- Rowing - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Rowing' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(rowing_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(rowing_coed_team_women_participation, '') IS NOT NULL AND NULLIF(rowing_coed_team_women_participation, '') != '0'

    union all

    -- Sailing - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Sailing' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(sailing_mens_team_participation, '')::integer as participation,
        NULLIF(sailing_mens_team_revenue, '')::numeric as revenue,
        NULLIF(sailing_mens_team_expenses, '')::numeric as expenses,
        NULLIF(sailing_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(sailing_mens_team_participation, '') IS NOT NULL AND NULLIF(sailing_mens_team_participation, '') != '0') or NULLIF(sailing_mens_team_revenue, '') IS NOT NULL

    union all

    -- Sailing - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Sailing' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(sailing_womens_team_participation, '')::integer as participation,
        NULLIF(sailing_womens_team_revenue, '')::numeric as revenue,
        NULLIF(sailing_womens_team_expenses, '')::numeric as expenses,
        NULLIF(sailing_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(sailing_womens_team_participation, '') IS NOT NULL AND NULLIF(sailing_womens_team_participation, '') != '0') or NULLIF(sailing_womens_team_revenue, '') IS NOT NULL

    union all

    -- Sailing - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Sailing' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(sailing_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(sailing_coed_team_men_participation, '') IS NOT NULL AND NULLIF(sailing_coed_team_men_participation, '') != '0'

    union all

    -- Sailing - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Sailing' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(sailing_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(sailing_coed_team_women_participation, '') IS NOT NULL AND NULLIF(sailing_coed_team_women_participation, '') != '0'

    union all

    -- Skiing - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Skiing' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(skiing_mens_team_participation, '')::integer as participation,
        NULLIF(skiing_mens_team_revenue, '')::numeric as revenue,
        NULLIF(skiing_mens_team_expenses, '')::numeric as expenses,
        NULLIF(skiing_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(skiing_mens_team_participation, '') IS NOT NULL AND NULLIF(skiing_mens_team_participation, '') != '0') or NULLIF(skiing_mens_team_revenue, '') IS NOT NULL

    union all

    -- Skiing - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Skiing' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(skiing_womens_team_participation, '')::integer as participation,
        NULLIF(skiing_womens_team_revenue, '')::numeric as revenue,
        NULLIF(skiing_womens_team_expenses, '')::numeric as expenses,
        NULLIF(skiing_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(skiing_womens_team_participation, '') IS NOT NULL AND NULLIF(skiing_womens_team_participation, '') != '0') or NULLIF(skiing_womens_team_revenue, '') IS NOT NULL

    union all

    -- Skiing - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Skiing' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(skiing_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(skiing_coed_team_men_participation, '') IS NOT NULL AND NULLIF(skiing_coed_team_men_participation, '') != '0'

    union all

    -- Skiing - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Skiing' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(skiing_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(skiing_coed_team_women_participation, '') IS NOT NULL AND NULLIF(skiing_coed_team_women_participation, '') != '0'

    union all

    -- Soccer - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Soccer' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(soccer_mens_team_participation, '')::integer as participation,
        NULLIF(soccer_mens_team_revenue, '')::numeric as revenue,
        NULLIF(soccer_mens_team_expenses, '')::numeric as expenses,
        NULLIF(soccer_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(soccer_mens_team_participation, '') IS NOT NULL AND NULLIF(soccer_mens_team_participation, '') != '0') or NULLIF(soccer_mens_team_revenue, '') IS NOT NULL

    union all

    -- Soccer - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Soccer' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(soccer_womens_team_participation, '')::integer as participation,
        NULLIF(soccer_womens_team_revenue, '')::numeric as revenue,
        NULLIF(soccer_womens_team_expenses, '')::numeric as expenses,
        NULLIF(soccer_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(soccer_womens_team_participation, '') IS NOT NULL AND NULLIF(soccer_womens_team_participation, '') != '0') or NULLIF(soccer_womens_team_revenue, '') IS NOT NULL

    union all

    -- Soccer - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Soccer' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(soccer_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(soccer_coed_team_men_participation, '') IS NOT NULL AND NULLIF(soccer_coed_team_men_participation, '') != '0'

    union all

    -- Soccer - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Soccer' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(soccer_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(soccer_coed_team_women_participation, '') IS NOT NULL AND NULLIF(soccer_coed_team_women_participation, '') != '0'

    union all

    -- Softball - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Softball' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(softball_mens_team_participation, '')::integer as participation,
        NULLIF(softball_mens_team_revenue, '')::numeric as revenue,
        NULLIF(softball_mens_team_expenses, '')::numeric as expenses,
        NULLIF(softball_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(softball_mens_team_participation, '') IS NOT NULL AND NULLIF(softball_mens_team_participation, '') != '0') or NULLIF(softball_mens_team_revenue, '') IS NOT NULL

    union all

    -- Softball - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Softball' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(softball_womens_team_participation, '')::integer as participation,
        NULLIF(softball_womens_team_revenue, '')::numeric as revenue,
        NULLIF(softball_womens_team_expenses, '')::numeric as expenses,
        NULLIF(softball_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(softball_womens_team_participation, '') IS NOT NULL AND NULLIF(softball_womens_team_participation, '') != '0') or NULLIF(softball_womens_team_revenue, '') IS NOT NULL

    union all

    -- Softball - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Softball' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(softball_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(softball_coed_team_men_participation, '') IS NOT NULL AND NULLIF(softball_coed_team_men_participation, '') != '0'

    union all

    -- Softball - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Softball' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(softball_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(softball_coed_team_women_participation, '') IS NOT NULL AND NULLIF(softball_coed_team_women_participation, '') != '0'

    union all

    -- Squash - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Squash' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(squash_mens_team_participation, '')::integer as participation,
        NULLIF(squash_mens_team_revenue, '')::numeric as revenue,
        NULLIF(squash_mens_team_expenses, '')::numeric as expenses,
        NULLIF(squash_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(squash_mens_team_participation, '') IS NOT NULL AND NULLIF(squash_mens_team_participation, '') != '0') or NULLIF(squash_mens_team_revenue, '') IS NOT NULL

    union all

    -- Squash - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Squash' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(squash_womens_team_participation, '')::integer as participation,
        NULLIF(squash_womens_team_revenue, '')::numeric as revenue,
        NULLIF(squash_womens_team_expenses, '')::numeric as expenses,
        NULLIF(squash_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(squash_womens_team_participation, '') IS NOT NULL AND NULLIF(squash_womens_team_participation, '') != '0') or NULLIF(squash_womens_team_revenue, '') IS NOT NULL

    union all

    -- Squash - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Squash' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(squash_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(squash_coed_team_men_participation, '') IS NOT NULL AND NULLIF(squash_coed_team_men_participation, '') != '0'

    union all

    -- Squash - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Squash' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(squash_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(squash_coed_team_women_participation, '') IS NOT NULL AND NULLIF(squash_coed_team_women_participation, '') != '0'

    union all

    -- Swimming - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Swimming' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(swimming_mens_team_participation, '')::integer as participation,
        NULLIF(swimming_mens_team_revenue, '')::numeric as revenue,
        NULLIF(swimming_mens_team_expenses, '')::numeric as expenses,
        NULLIF(swimming_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(swimming_mens_team_participation, '') IS NOT NULL AND NULLIF(swimming_mens_team_participation, '') != '0') or NULLIF(swimming_mens_team_revenue, '') IS NOT NULL

    union all

    -- Swimming - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Swimming' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(swimming_womens_team_participation, '')::integer as participation,
        NULLIF(swimming_womens_team_revenue, '')::numeric as revenue,
        NULLIF(swimming_womens_team_expenses, '')::numeric as expenses,
        NULLIF(swimming_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(swimming_womens_team_participation, '') IS NOT NULL AND NULLIF(swimming_womens_team_participation, '') != '0') or NULLIF(swimming_womens_team_revenue, '') IS NOT NULL

    union all

    -- Swimming - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Swimming' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(swimming_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(swimming_coed_team_men_participation, '') IS NOT NULL AND NULLIF(swimming_coed_team_men_participation, '') != '0'

    union all

    -- Swimming - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Swimming' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(swimming_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(swimming_coed_team_women_participation, '') IS NOT NULL AND NULLIF(swimming_coed_team_women_participation, '') != '0'

    union all

    -- Swimming And Diving - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Swimming And Diving' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(swimming_and_diving_mens_team_participation, '')::integer as participation,
        NULLIF(swimming_and_diving_mens_team_revenue, '')::numeric as revenue,
        NULLIF(swimming_and_diving_mens_team_expenses, '')::numeric as expenses,
        NULLIF(swimming_and_diving_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(swimming_and_diving_mens_team_participation, '') IS NOT NULL AND NULLIF(swimming_and_diving_mens_team_participation, '') != '0') or NULLIF(swimming_and_diving_mens_team_revenue, '') IS NOT NULL

    union all

    -- Swimming And Diving - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Swimming And Diving' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(swimming_and_diving_womens_team_participation, '')::integer as participation,
        NULLIF(swimming_and_diving_womens_team_revenue, '')::numeric as revenue,
        NULLIF(swimming_and_diving_womens_team_expenses, '')::numeric as expenses,
        NULLIF(swimming_and_diving_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(swimming_and_diving_womens_team_participation, '') IS NOT NULL AND NULLIF(swimming_and_diving_womens_team_participation, '') != '0') or NULLIF(swimming_and_diving_womens_team_revenue, '') IS NOT NULL

    union all

    -- Swimming And Diving - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Swimming And Diving' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(swimming_and_diving_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(swimming_and_diving_coed_team_men_participation, '') IS NOT NULL AND NULLIF(swimming_and_diving_coed_team_men_participation, '') != '0'

    union all

    -- Swimming And Diving - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Swimming And Diving' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(swimming_and_diving_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(swimming_and_diving_coed_team_women_participation, '') IS NOT NULL AND NULLIF(swimming_and_diving_coed_team_women_participation, '') != '0'

    union all

    -- Synchronized Swimming - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Synchronized Swimming' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(synchronized_swimming_mens_team_participation, '')::integer as participation,
        NULLIF(synchronized_swimming_mens_team_revenue, '')::numeric as revenue,
        NULLIF(synchronized_swimming_mens_team_expenses, '')::numeric as expenses,
        NULLIF(synchronized_swimming_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(synchronized_swimming_mens_team_participation, '') IS NOT NULL AND NULLIF(synchronized_swimming_mens_team_participation, '') != '0') or NULLIF(synchronized_swimming_mens_team_revenue, '') IS NOT NULL

    union all

    -- Synchronized Swimming - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Synchronized Swimming' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(synchronized_swimming_womens_team_participation, '')::integer as participation,
        NULLIF(synchronized_swimming_womens_team_revenue, '')::numeric as revenue,
        NULLIF(synchronized_swimming_womens_team_expenses, '')::numeric as expenses,
        NULLIF(synchronized_swimming_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(synchronized_swimming_womens_team_participation, '') IS NOT NULL AND NULLIF(synchronized_swimming_womens_team_participation, '') != '0') or NULLIF(synchronized_swimming_womens_team_revenue, '') IS NOT NULL

    union all

    -- Synchronized Swimming - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Synchronized Swimming' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(synchronized_swimming_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(synchronized_swimming_coed_team_men_participation, '') IS NOT NULL AND NULLIF(synchronized_swimming_coed_team_men_participation, '') != '0'

    union all

    -- Synchronized Swimming - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Synchronized Swimming' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(synchronized_swimming_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(synchronized_swimming_coed_team_women_participation, '') IS NOT NULL AND NULLIF(synchronized_swimming_coed_team_women_participation, '') != '0'

    union all

    -- Table Tennis - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Table Tennis' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(table_tennis_mens_team_participation, '')::integer as participation,
        NULLIF(table_tennis_mens_team_revenue, '')::numeric as revenue,
        NULLIF(table_tennis_mens_team_expenses, '')::numeric as expenses,
        NULLIF(table_tennis_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(table_tennis_mens_team_participation, '') IS NOT NULL AND NULLIF(table_tennis_mens_team_participation, '') != '0') or NULLIF(table_tennis_mens_team_revenue, '') IS NOT NULL

    union all

    -- Table Tennis - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Table Tennis' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(table_tennis_womens_team_participation, '')::integer as participation,
        NULLIF(table_tennis_womens_team_revenue, '')::numeric as revenue,
        NULLIF(table_tennis_womens_team_expenses, '')::numeric as expenses,
        NULLIF(table_tennis_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(table_tennis_womens_team_participation, '') IS NOT NULL AND NULLIF(table_tennis_womens_team_participation, '') != '0') or NULLIF(table_tennis_womens_team_revenue, '') IS NOT NULL

    union all

    -- Table Tennis - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Table Tennis' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(table_tennis_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(table_tennis_coed_team_men_participation, '') IS NOT NULL AND NULLIF(table_tennis_coed_team_men_participation, '') != '0'

    union all

    -- Table Tennis - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Table Tennis' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(table_tennis_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(table_tennis_coed_team_women_participation, '') IS NOT NULL AND NULLIF(table_tennis_coed_team_women_participation, '') != '0'

    union all

    -- Team Handball - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Team Handball' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(team_handball_mens_team_participation, '')::integer as participation,
        NULLIF(team_handball_mens_team_revenue, '')::numeric as revenue,
        NULLIF(team_handball_mens_team_expenses, '')::numeric as expenses,
        NULLIF(team_handball_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(team_handball_mens_team_participation, '') IS NOT NULL AND NULLIF(team_handball_mens_team_participation, '') != '0') or NULLIF(team_handball_mens_team_revenue, '') IS NOT NULL

    union all

    -- Team Handball - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Team Handball' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(team_handball_womens_team_participation, '')::integer as participation,
        NULLIF(team_handball_womens_team_revenue, '')::numeric as revenue,
        NULLIF(team_handball_womens_team_expenses, '')::numeric as expenses,
        NULLIF(team_handball_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(team_handball_womens_team_participation, '') IS NOT NULL AND NULLIF(team_handball_womens_team_participation, '') != '0') or NULLIF(team_handball_womens_team_revenue, '') IS NOT NULL

    union all

    -- Team Handball - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Team Handball' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(team_handball_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(team_handball_coed_team_men_participation, '') IS NOT NULL AND NULLIF(team_handball_coed_team_men_participation, '') != '0'

    union all

    -- Team Handball - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Team Handball' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(team_handball_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(team_handball_coed_team_women_participation, '') IS NOT NULL AND NULLIF(team_handball_coed_team_women_participation, '') != '0'

    union all

    -- Tennis - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Tennis' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(tennis_mens_team_participation, '')::integer as participation,
        NULLIF(tennis_mens_team_revenue, '')::numeric as revenue,
        NULLIF(tennis_mens_team_expenses, '')::numeric as expenses,
        NULLIF(tennis_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(tennis_mens_team_participation, '') IS NOT NULL AND NULLIF(tennis_mens_team_participation, '') != '0') or NULLIF(tennis_mens_team_revenue, '') IS NOT NULL

    union all

    -- Tennis - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Tennis' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(tennis_womens_team_participation, '')::integer as participation,
        NULLIF(tennis_womens_team_revenue, '')::numeric as revenue,
        NULLIF(tennis_womens_team_expenses, '')::numeric as expenses,
        NULLIF(tennis_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(tennis_womens_team_participation, '') IS NOT NULL AND NULLIF(tennis_womens_team_participation, '') != '0') or NULLIF(tennis_womens_team_revenue, '') IS NOT NULL

    union all

    -- Tennis - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Tennis' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(tennis_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(tennis_coed_team_men_participation, '') IS NOT NULL AND NULLIF(tennis_coed_team_men_participation, '') != '0'

    union all

    -- Tennis - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Tennis' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(tennis_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(tennis_coed_team_women_participation, '') IS NOT NULL AND NULLIF(tennis_coed_team_women_participation, '') != '0'

    union all

    -- Total - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Total' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(total_mens_team_participation, '')::integer as participation,
        NULLIF(total_mens_team_revenue, '')::numeric as revenue,
        NULLIF(total_mens_team_expenses, '')::numeric as expenses,
        NULLIF(total_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(total_mens_team_participation, '') IS NOT NULL AND NULLIF(total_mens_team_participation, '') != '0') or NULLIF(total_mens_team_revenue, '') IS NOT NULL

    union all

    -- Total - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Total' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(total_womens_team_participation, '')::integer as participation,
        NULLIF(total_womens_team_revenue, '')::numeric as revenue,
        NULLIF(total_womens_team_expenses, '')::numeric as expenses,
        NULLIF(total_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(total_womens_team_participation, '') IS NOT NULL AND NULLIF(total_womens_team_participation, '') != '0') or NULLIF(total_womens_team_revenue, '') IS NOT NULL

    union all

    -- Total - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Total' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(total_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(total_coed_team_men_participation, '') IS NOT NULL AND NULLIF(total_coed_team_men_participation, '') != '0'

    union all

    -- Total - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Total' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(total_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(total_coed_team_women_participation, '') IS NOT NULL AND NULLIF(total_coed_team_women_participation, '') != '0'

    union all

    -- Track And Field Indoor - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Track And Field Indoor' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(track_and_field_indoor_mens_team_participation, '')::integer as participation,
        NULLIF(track_and_field_indoor_mens_team_revenue, '')::numeric as revenue,
        NULLIF(track_and_field_indoor_mens_team_expenses, '')::numeric as expenses,
        NULLIF(track_and_field_indoor_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(track_and_field_indoor_mens_team_participation, '') IS NOT NULL AND NULLIF(track_and_field_indoor_mens_team_participation, '') != '0') or NULLIF(track_and_field_indoor_mens_team_revenue, '') IS NOT NULL

    union all

    -- Track And Field Indoor - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Track And Field Indoor' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(track_and_field_indoor_womens_team_participation, '')::integer as participation,
        NULLIF(track_and_field_indoor_womens_team_revenue, '')::numeric as revenue,
        NULLIF(track_and_field_indoor_womens_team_expenses, '')::numeric as expenses,
        NULLIF(track_and_field_indoor_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(track_and_field_indoor_womens_team_participation, '') IS NOT NULL AND NULLIF(track_and_field_indoor_womens_team_participation, '') != '0') or NULLIF(track_and_field_indoor_womens_team_revenue, '') IS NOT NULL

    union all

    -- Track And Field Indoor - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Track And Field Indoor' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(track_and_field_indoor_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(track_and_field_indoor_coed_team_men_participation, '') IS NOT NULL AND NULLIF(track_and_field_indoor_coed_team_men_participation, '') != '0'

    union all

    -- Track And Field Indoor - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Track And Field Indoor' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(track_and_field_indoor_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(track_and_field_indoor_coed_team_women_participation, '') IS NOT NULL AND NULLIF(track_and_field_indoor_coed_team_women_participation, '') != '0'

    union all

    -- Track And Field Outdoor - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Track And Field Outdoor' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(track_and_field_outdoor_mens_team_participation, '')::integer as participation,
        NULLIF(track_and_field_outdoor_mens_team_revenue, '')::numeric as revenue,
        NULLIF(track_and_field_outdoor_mens_team_expenses, '')::numeric as expenses,
        NULLIF(track_and_field_outdoor_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(track_and_field_outdoor_mens_team_participation, '') IS NOT NULL AND NULLIF(track_and_field_outdoor_mens_team_participation, '') != '0') or NULLIF(track_and_field_outdoor_mens_team_revenue, '') IS NOT NULL

    union all

    -- Track And Field Outdoor - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Track And Field Outdoor' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(track_and_field_outdoor_womens_team_participation, '')::integer as participation,
        NULLIF(track_and_field_outdoor_womens_team_revenue, '')::numeric as revenue,
        NULLIF(track_and_field_outdoor_womens_team_expenses, '')::numeric as expenses,
        NULLIF(track_and_field_outdoor_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(track_and_field_outdoor_womens_team_participation, '') IS NOT NULL AND NULLIF(track_and_field_outdoor_womens_team_participation, '') != '0') or NULLIF(track_and_field_outdoor_womens_team_revenue, '') IS NOT NULL

    union all

    -- Track And Field Outdoor - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Track And Field Outdoor' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(track_and_field_outdoor_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(track_and_field_outdoor_coed_team_men_participation, '') IS NOT NULL AND NULLIF(track_and_field_outdoor_coed_team_men_participation, '') != '0'

    union all

    -- Track And Field Outdoor - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Track And Field Outdoor' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(track_and_field_outdoor_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(track_and_field_outdoor_coed_team_women_participation, '') IS NOT NULL AND NULLIF(track_and_field_outdoor_coed_team_women_participation, '') != '0'

    union all

    -- Track And Field X Country - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Track And Field X Country' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(track_and_field_x_country_mens_team_participation, '')::integer as participation,
        NULLIF(track_and_field_x_country_mens_team_revenue, '')::numeric as revenue,
        NULLIF(track_and_field_x_country_mens_team_expenses, '')::numeric as expenses,
        NULLIF(track_and_field_x_country_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(track_and_field_x_country_mens_team_participation, '') IS NOT NULL AND NULLIF(track_and_field_x_country_mens_team_participation, '') != '0') or NULLIF(track_and_field_x_country_mens_team_revenue, '') IS NOT NULL

    union all

    -- Track And Field X Country - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Track And Field X Country' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(track_and_field_x_country_womens_team_participation, '')::integer as participation,
        NULLIF(track_and_field_x_country_womens_team_revenue, '')::numeric as revenue,
        NULLIF(track_and_field_x_country_womens_team_expenses, '')::numeric as expenses,
        NULLIF(track_and_field_x_country_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(track_and_field_x_country_womens_team_participation, '') IS NOT NULL AND NULLIF(track_and_field_x_country_womens_team_participation, '') != '0') or NULLIF(track_and_field_x_country_womens_team_revenue, '') IS NOT NULL

    union all

    -- Track And Field X Country - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Track And Field X Country' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(track_and_field_x_country_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(track_and_field_x_country_coed_team_men_participation, '') IS NOT NULL AND NULLIF(track_and_field_x_country_coed_team_men_participation, '') != '0'

    union all

    -- Track And Field X Country - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Track And Field X Country' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(track_and_field_x_country_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(track_and_field_x_country_coed_team_women_participation, '') IS NOT NULL AND NULLIF(track_and_field_x_country_coed_team_women_participation, '') != '0'

    union all

    -- Volleyball - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Volleyball' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(volleyball_mens_team_participation, '')::integer as participation,
        NULLIF(volleyball_mens_team_revenue, '')::numeric as revenue,
        NULLIF(volleyball_mens_team_expenses, '')::numeric as expenses,
        NULLIF(volleyball_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(volleyball_mens_team_participation, '') IS NOT NULL AND NULLIF(volleyball_mens_team_participation, '') != '0') or NULLIF(volleyball_mens_team_revenue, '') IS NOT NULL

    union all

    -- Volleyball - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Volleyball' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(volleyball_womens_team_participation, '')::integer as participation,
        NULLIF(volleyball_womens_team_revenue, '')::numeric as revenue,
        NULLIF(volleyball_womens_team_expenses, '')::numeric as expenses,
        NULLIF(volleyball_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(volleyball_womens_team_participation, '') IS NOT NULL AND NULLIF(volleyball_womens_team_participation, '') != '0') or NULLIF(volleyball_womens_team_revenue, '') IS NOT NULL

    union all

    -- Volleyball - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Volleyball' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(volleyball_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(volleyball_coed_team_men_participation, '') IS NOT NULL AND NULLIF(volleyball_coed_team_men_participation, '') != '0'

    union all

    -- Volleyball - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Volleyball' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(volleyball_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(volleyball_coed_team_women_participation, '') IS NOT NULL AND NULLIF(volleyball_coed_team_women_participation, '') != '0'

    union all

    -- Water Polo - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Water Polo' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(water_polo_mens_team_participation, '')::integer as participation,
        NULLIF(water_polo_mens_team_revenue, '')::numeric as revenue,
        NULLIF(water_polo_mens_team_expenses, '')::numeric as expenses,
        NULLIF(water_polo_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(water_polo_mens_team_participation, '') IS NOT NULL AND NULLIF(water_polo_mens_team_participation, '') != '0') or NULLIF(water_polo_mens_team_revenue, '') IS NOT NULL

    union all

    -- Water Polo - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Water Polo' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(water_polo_womens_team_participation, '')::integer as participation,
        NULLIF(water_polo_womens_team_revenue, '')::numeric as revenue,
        NULLIF(water_polo_womens_team_expenses, '')::numeric as expenses,
        NULLIF(water_polo_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(water_polo_womens_team_participation, '') IS NOT NULL AND NULLIF(water_polo_womens_team_participation, '') != '0') or NULLIF(water_polo_womens_team_revenue, '') IS NOT NULL

    union all

    -- Water Polo - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Water Polo' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(water_polo_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(water_polo_coed_team_men_participation, '') IS NOT NULL AND NULLIF(water_polo_coed_team_men_participation, '') != '0'

    union all

    -- Water Polo - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Water Polo' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(water_polo_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(water_polo_coed_team_women_participation, '') IS NOT NULL AND NULLIF(water_polo_coed_team_women_participation, '') != '0'

    union all

    -- Weight Lifting - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Weight Lifting' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(weight_lifting_mens_team_participation, '')::integer as participation,
        NULLIF(weight_lifting_mens_team_revenue, '')::numeric as revenue,
        NULLIF(weight_lifting_mens_team_expenses, '')::numeric as expenses,
        NULLIF(weight_lifting_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(weight_lifting_mens_team_participation, '') IS NOT NULL AND NULLIF(weight_lifting_mens_team_participation, '') != '0') or NULLIF(weight_lifting_mens_team_revenue, '') IS NOT NULL

    union all

    -- Weight Lifting - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Weight Lifting' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(weight_lifting_womens_team_participation, '')::integer as participation,
        NULLIF(weight_lifting_womens_team_revenue, '')::numeric as revenue,
        NULLIF(weight_lifting_womens_team_expenses, '')::numeric as expenses,
        NULLIF(weight_lifting_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(weight_lifting_womens_team_participation, '') IS NOT NULL AND NULLIF(weight_lifting_womens_team_participation, '') != '0') or NULLIF(weight_lifting_womens_team_revenue, '') IS NOT NULL

    union all

    -- Weight Lifting - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Weight Lifting' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(weight_lifting_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(weight_lifting_coed_team_men_participation, '') IS NOT NULL AND NULLIF(weight_lifting_coed_team_men_participation, '') != '0'

    union all

    -- Weight Lifting - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Weight Lifting' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(weight_lifting_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(weight_lifting_coed_team_women_participation, '') IS NOT NULL AND NULLIF(weight_lifting_coed_team_women_participation, '') != '0'

    union all

    -- Wrestling - Men's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Wrestling' as sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(wrestling_mens_team_participation, '')::integer as participation,
        NULLIF(wrestling_mens_team_revenue, '')::numeric as revenue,
        NULLIF(wrestling_mens_team_expenses, '')::numeric as expenses,
        NULLIF(wrestling_mens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(wrestling_mens_team_participation, '') IS NOT NULL AND NULLIF(wrestling_mens_team_participation, '') != '0') or NULLIF(wrestling_mens_team_revenue, '') IS NOT NULL

    union all

    -- Wrestling - Women's Team
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Wrestling' as sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(wrestling_womens_team_participation, '')::integer as participation,
        NULLIF(wrestling_womens_team_revenue, '')::numeric as revenue,
        NULLIF(wrestling_womens_team_expenses, '')::numeric as expenses,
        NULLIF(wrestling_womens_team_operating_expenses, '')::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where (NULLIF(wrestling_womens_team_participation, '') IS NOT NULL AND NULLIF(wrestling_womens_team_participation, '') != '0') or NULLIF(wrestling_womens_team_revenue, '') IS NOT NULL

    union all

    -- Wrestling - Coed Team Men
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Wrestling' as sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(wrestling_coed_team_men_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(wrestling_coed_team_men_participation, '') IS NOT NULL AND NULLIF(wrestling_coed_team_men_participation, '') != '0'

    union all

    -- Wrestling - Coed Team Women
    select
        survey_year as year,
        unitid,
        ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sanction_name as sanction,
        male_undergraduates,
        female_undergraduates,
        total_undergraduates,
        'Wrestling' as sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(wrestling_coed_team_women_participation, '')::integer as participation,
        NULL::numeric as revenue,
        NULL::numeric as expenses,
        NULL::numeric as operating_expenses
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(wrestling_coed_team_women_participation, '') IS NOT NULL AND NULLIF(wrestling_coed_team_women_participation, '') != '0'
)

select * from sport_data