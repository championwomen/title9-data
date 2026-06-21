-- Auto-generated from the long EADA 'schools' source (2009-2025).
-- One row per sport x institution x year x sex; coed teams split into Male/Female rows.
-- Materialized as a view for Lightdash.
with sport_data as (
    -- Men's team
    select
        survey_year::integer as year,
        unitid,
        opeid as ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sector_name as sector,
        NULLIF(efmalecount, '')::integer as male_undergraduates,
        NULLIF(effemalecount, '')::integer as female_undergraduates,
        NULLIF(eftotalcount, '')::integer as total_undergraduates,
        sportscode as sport_code,
        sport_name,
        'Male' as sex,
        false as is_coed_sport,
        NULLIF(partic_men, '')::integer as participation,
        NULLIF(rev_men, '')::numeric as revenue,
        NULLIF(exp_men, '')::numeric as total_expenses,
        NULLIF(opexpperteam_men, '')::numeric as operating_expenses,
        NULLIF(opexpperpart_men, '')::numeric as operating_expense_per_participant,
        NULLIF(men_ftheadcoach_male, '')::integer as ft_head_coaches_male,
        NULLIF(men_ptheadcoach_male, '')::integer as pt_head_coaches_male,
        NULLIF(men_ftheadcoach_fem, '')::integer as ft_head_coaches_female,
        NULLIF(men_ptheadcoach_fem, '')::integer as pt_head_coaches_female,
        NULLIF(men_total_headcoach, '')::integer as total_head_coaches,
        NULLIF(men_ftunivemploy_male, '')::integer as ft_head_coach_univ_emp_male,
        NULLIF(men_ptunivemploy_male, '')::integer as pt_head_coach_univ_emp_male,
        NULLIF(men_ftunivemploy_fem, '')::integer as ft_head_coach_univ_emp_female,
        NULLIF(men_ptunivemploy_fem, '')::integer as pt_head_coach_univ_emp_female,
        NULLIF(men_ftascoach_male, '')::integer as ft_asst_coaches_male,
        NULLIF(men_ptascoach_male, '')::integer as pt_asst_coaches_male,
        NULLIF(men_ftasstcoach_fem, '')::integer as ft_asst_coaches_female,
        NULLIF(men_ptasstcoach_fem, '')::integer as pt_asst_coaches_female,
        NULLIF(men_total_asstcoach, '')::integer as total_asst_coaches,
        NULLIF(men_ftacunivemp_male, '')::integer as ft_asst_coach_univ_emp_male,
        NULLIF(men_ptacunivemp_male, '')::integer as pt_asst_coach_univ_emp_male,
        NULLIF(men_ftacunivemp_fem, '')::integer as ft_asst_coach_univ_emp_female,
        NULLIF(men_ptacunivemp_fem, '')::integer as pt_asst_coach_univ_emp_female
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(partic_men, '') is not null and NULLIF(partic_men, '') != '0'

    union all

    -- Women's team
    select
        survey_year::integer as year,
        unitid,
        opeid as ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sector_name as sector,
        NULLIF(efmalecount, '')::integer as male_undergraduates,
        NULLIF(effemalecount, '')::integer as female_undergraduates,
        NULLIF(eftotalcount, '')::integer as total_undergraduates,
        sportscode as sport_code,
        sport_name,
        'Female' as sex,
        false as is_coed_sport,
        NULLIF(partic_women, '')::integer as participation,
        NULLIF(rev_women, '')::numeric as revenue,
        NULLIF(exp_women, '')::numeric as total_expenses,
        NULLIF(opexpperteam_women, '')::numeric as operating_expenses,
        NULLIF(opexpperpart_women, '')::numeric as operating_expense_per_participant,
        NULLIF(women_fthdcoach_male, '')::integer as ft_head_coaches_male,
        NULLIF(women_pthdcoach_male, '')::integer as pt_head_coaches_male,
        NULLIF(women_fthdcoach_fem, '')::integer as ft_head_coaches_female,
        NULLIF(women_pthdcoach_fem, '')::integer as pt_head_coaches_female,
        NULLIF(women_total_hdcoach, '')::integer as total_head_coaches,
        NULLIF(women_ftunivemp_male, '')::integer as ft_head_coach_univ_emp_male,
        NULLIF(women_ptunivemp_male, '')::integer as pt_head_coach_univ_emp_male,
        NULLIF(women_ftunivemp_fem, '')::integer as ft_head_coach_univ_emp_female,
        NULLIF(women_ptunivemp_fem, '')::integer as pt_head_coach_univ_emp_female,
        NULLIF(women_ftascoach_male, '')::integer as ft_asst_coaches_male,
        NULLIF(women_ptascoach_male, '')::integer as pt_asst_coaches_male,
        NULLIF(women_ftastcoach_fem, '')::integer as ft_asst_coaches_female,
        NULLIF(women_ptastcoach_fem, '')::integer as pt_asst_coaches_female,
        NULLIF(women_total_astcoach, '')::integer as total_asst_coaches,
        NULLIF(women_ftacunemp_male, '')::integer as ft_asst_coach_univ_emp_male,
        NULLIF(women_ptacunemp_male, '')::integer as pt_asst_coach_univ_emp_male,
        NULLIF(womn_ftacunivemp_fem, '')::integer as ft_asst_coach_univ_emp_female,
        NULLIF(womn_ptacunivemp_fem, '')::integer as pt_asst_coach_univ_emp_female
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(partic_women, '') is not null and NULLIF(partic_women, '') != '0'

    union all

    -- Coed team — men's participation (coed coaching/finances attributed here)
    select
        survey_year::integer as year,
        unitid,
        opeid as ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sector_name as sector,
        NULLIF(efmalecount, '')::integer as male_undergraduates,
        NULLIF(effemalecount, '')::integer as female_undergraduates,
        NULLIF(eftotalcount, '')::integer as total_undergraduates,
        sportscode as sport_code,
        sport_name,
        'Male' as sex,
        true as is_coed_sport,
        NULLIF(partic_coed_men, '')::integer as participation,
        NULLIF(rev_coed_men, '')::numeric as revenue,
        NULLIF(exp_coed_men, '')::numeric as total_expenses,
        NULLIF(opexpperteam_coed_men, '')::numeric as operating_expenses,
        NULLIF(opexpperpart_coed_men, '')::numeric as operating_expense_per_participant,
        NULLIF(coed_fthdcoach_male, '')::integer as ft_head_coaches_male,
        NULLIF(coed_pthdcoach_male, '')::integer as pt_head_coaches_male,
        NULLIF(coed_fthdcoach_fem, '')::integer as ft_head_coaches_female,
        NULLIF(coed_pthdcoach_fem, '')::integer as pt_head_coaches_female,
        NULLIF(coed_total_hdcoach, '')::integer as total_head_coaches,
        NULLIF(coed_ftunivemp_male, '')::integer as ft_head_coach_univ_emp_male,
        NULLIF(coed_ptunivemp_male, '')::integer as pt_head_coach_univ_emp_male,
        NULLIF(coed_ftunivemp_fem, '')::integer as ft_head_coach_univ_emp_female,
        NULLIF(coed_ptunivemp_fem, '')::integer as pt_head_coach_univ_emp_female,
        NULLIF(coed_ftascoach_male, '')::integer as ft_asst_coaches_male,
        NULLIF(coed_ptascoach_male, '')::integer as pt_asst_coaches_male,
        NULLIF(coed_ftastcoach_fem, '')::integer as ft_asst_coaches_female,
        NULLIF(coed_ptastcoach_fem, '')::integer as pt_asst_coaches_female,
        NULLIF(coed_total_astcoach, '')::integer as total_asst_coaches,
        NULLIF(coed_ftacunemp_male, '')::integer as ft_asst_coach_univ_emp_male,
        NULLIF(coed_ptacunemp_male, '')::integer as pt_asst_coach_univ_emp_male,
        NULLIF(coed_ftacunivemp_fem, '')::integer as ft_asst_coach_univ_emp_female,
        NULLIF(coed_ptacunivemp_fem, '')::integer as pt_asst_coach_univ_emp_female
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(partic_coed_men, '') is not null and NULLIF(partic_coed_men, '') != '0'

    union all

    -- Coed team — women's participation (coaching NULL to avoid double-count)
    select
        survey_year::integer as year,
        unitid,
        opeid as ope_id,
        institution_name,
        state_cd as state,
        classification_name as classification,
        sector_name as sector,
        NULLIF(efmalecount, '')::integer as male_undergraduates,
        NULLIF(effemalecount, '')::integer as female_undergraduates,
        NULLIF(eftotalcount, '')::integer as total_undergraduates,
        sportscode as sport_code,
        sport_name,
        'Female' as sex,
        true as is_coed_sport,
        NULLIF(partic_coed_women, '')::integer as participation,
        NULLIF(rev_coed_women, '')::numeric as revenue,
        NULLIF(exp_coed_women, '')::numeric as total_expenses,
        NULLIF(opexp_team_coed_women, '')::numeric as operating_expenses,
        NULLIF(opexp_part_coed_women, '')::numeric as operating_expense_per_participant,
        NULL::integer as ft_head_coaches_male,
        NULL::integer as pt_head_coaches_male,
        NULL::integer as ft_head_coaches_female,
        NULL::integer as pt_head_coaches_female,
        NULL::integer as total_head_coaches,
        NULL::integer as ft_head_coach_univ_emp_male,
        NULL::integer as pt_head_coach_univ_emp_male,
        NULL::integer as ft_head_coach_univ_emp_female,
        NULL::integer as pt_head_coach_univ_emp_female,
        NULL::integer as ft_asst_coaches_male,
        NULL::integer as pt_asst_coaches_male,
        NULL::integer as ft_asst_coaches_female,
        NULL::integer as pt_asst_coaches_female,
        NULL::integer as total_asst_coaches,
        NULL::integer as ft_asst_coach_univ_emp_male,
        NULL::integer as pt_asst_coach_univ_emp_male,
        NULL::integer as ft_asst_coach_univ_emp_female,
        NULL::integer as pt_asst_coach_univ_emp_female
    from {{ source('raw', 'raw_eada_by_sport') }}
    where NULLIF(partic_coed_women, '') is not null and NULLIF(partic_coed_women, '') != '0'
)
select * from sport_data
