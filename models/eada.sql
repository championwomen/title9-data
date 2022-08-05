with eada_renanmed as (
  select year,
    unitid as institution_id,
    institution_name,
    -- addr1_txt as address_1,
    -- addr2_txt as address1,
    -- city_txt as city,
    state_cd as state,
    -- zip_text as zip_code,
    -- classificationcode,
    classification_name as classification,
    -- classificationother,
    efmalecount as enrollment_male,
    effemalecount as enrollment_female,
    eftotalcount as enrollment_total,
    -- sector_cd, sector_name,
    studentaid_men as athletic_student_aid_for_men,
    studentaid_women as athletic_student_aid_for_women,
    studentaid_coed as athletic_student_aid_for_coed,
    studentaid_total as athletic_student_aid_total,
    stuaid_men_ratio / 100.0 as athletic_student_aid_ratio_men,
    stuaid_women_ratio / 100.0 as athletic_student_aid_ratio_women,
    stuaid_coed_ratio / 100.0 as athletic_student_aid_coed_ratio,
    recruitexp_men as recruiting_expenses_for_men,
    recruitexp_women as recruiting_expenses_for_women,
    recruitexp_coed as recruiting_expenses_for_coed,
    recruitexp_total as recruiting_expenses_total,
    -- hdcoach_salary_men,
    -- hdcoach_salary_women,
    -- hdcoach_salary_coed,
    -- num_hdcoach_men,
    -- num_hdcoach_women,
    -- num_hdcoach_coed,
    -- hdcoach_sal_fte_men,
    -- hdcoach_sal_fte_womn,
    -- hdcoach_sal_fte_coed,
    -- fte_hdcoach_men,
    -- fte_hdcoach_women,
    -- fte_hdcoach_coed,
    -- ascoach_salary_men,
    -- ascoach_salary_women,
    -- ascoach_salary_coed,
    -- num_ascoach_men,
    -- num_ascoach_women,
    -- num_ascoach_coed,
    -- ascoach_sal_fte_men,
    -- ascoach_sal_fte_womn,
    -- ascoach_sal_fte_coed,
    -- fte_ascoach_men,
    -- fte_ascoach_women,
    -- fte_ascoach_coed,
    il_partic_men as num_participating_men_on_mens_teams,
    il_partic_women as num_participating_women_on_womens_teams,
    il_partic_coed_men as num_participating_men_on_coed_teams,
    il_partic_coed_women as num_participating_coed_women,
    il_sum_partic_men as num_participating_men_total,
    il_sum_partic_women as num_participating_women_total,
    il_opexpperpart_men as expenses_per_participant_on_mens_teams,
    il_opexpperteam_men as total_expenses_for_mens_team,
    il_opexpperpart_women as expenses_per_participant_on_womens_team,
    il_opexpperteam_women as total_expenses_for_womens_team,
    il_total_opexp_menwomen as total_expenses_for_men_and_women,
    il_opexpperpart_coed_men as expenses_per_participant_men_on_coed_teams,
    il_opexpperteam_coed_men as total_expenses_for_men_on_coed_teams,
    il_opexp_part_coed_women as expenses_per_participant_women_on_coed_teams,
    il_opexp_team_coed_women as expenses_per_team_women_on_coed_teams,
    il_total_opexp_coedteam as total_expenses_per_coed_team,
    il_sum_opexpperpart_men as expenses_per_particpant_men_including_coed,
    il_sum_opexpperteam_men as total_expenses_men_including_coed,
    il_sum_opexpperpart_women as expenses_per_participant_women_including_coed,
    il_sum_opexpperteam_women as total_expenses_women_including_coed,
    il_total_opexp_inclcoed as total_expenses_including_coed,
    -- il_men_ftheadcoach_male,
    -- il_men_ptheadcoach_male,
    -- il_men_ftunivemploy_male,
    -- il_men_ptunivemploy_male,
    -- il_men_ftheadcoach_fem,
    -- il_men_ptheadcoach_fem,
    -- il_men_ftunivemploy_fem,
    -- il_men_ptunivemploy_fem,
    -- il_men_total_headcoach,
    -- il_women_fthdcoach_male,
    -- il_women_pthdcoach_male,
    -- il_women_ftunivemp_male,
    -- il_women_ptunivemp_male,
    -- il_women_fthdcoach_fem,
    -- il_women_pthdcoach_fem,
    -- il_women_ftunivemp_fem,
    -- il_women_ptunivemp_fem,
    -- il_women_total_hdcoach,
    -- il_coed_fthdcoach_male,
    -- il_coed_pthdcoach_male,
    -- il_coed_ftunivemp_male,
    -- il_coed_ptunivemp_male,
    -- il_coed_fthdcoach_fem,
    -- il_coed_pthdcoach_fem,
    -- il_coed_ftunivemp_fem,
    -- il_coed_ptunivemp_fem,
    -- il_coed_total_hdcoach,
    -- il_sum_fthdcoach_male,
    -- il_sum_pthdcoach_male,
    -- il_sum_ftunivemp_male,
    -- il_sum_ptunivemp_male,
    -- il_sum_fthdcoach_fem,
    -- il_sum_pthdcoach_fem,
    -- il_sum_ftunivemp_fem,
    -- il_sum_ptunivemp_fem,
    -- il_sum_total_hdcoach,
    -- il_men_ftascoach_male,
    -- il_men_ptascoach_male,
    -- il_men_ftacunivemp_male,
    -- il_men_ptacunivemp_male,
    -- il_men_ftasstcoach_fem,
    -- il_men_ptasstcoach_fem,
    -- il_men_ftacunivemp_fem,
    -- il_men_ptacunivemp_fem,
    -- il_men_total_asstcoach,
    -- il_women_ftascoach_male,
    -- il_women_ptascoach_male,
    -- il_women_ftacunemp_male,
    -- il_women_ptacunemp_male,
    -- il_women_ftastcoach_fem,
    -- il_women_ptastcoach_fem,
    -- il_womn_ftacunivemp_fem,
    -- il_womn_ptacunivemp_fem,
    -- il_women_total_astcoach,
    -- il_coed_ftascoach_male,
    -- il_coed_ptascoach_male,
    -- il_coed_ftacunemp_male,
    -- il_coed_ptacunemp_male,
    -- il_coed_ftastcoach_fem,
    -- il_coed_ptastcoach_fem,
    -- il_coed_ftacunivemp_fem,
    -- il_coed_ptacunivemp_fem,
    -- il_coed_total_astcoach,
    -- il_sum_ftascoach_male,
    -- il_sum_ptascoach_male,
    -- il_sum_ftacunivemp_male,
    -- il_sum_ptacunivemp_male,
    -- il_sum_ftascoach_fem,
    -- il_sum_ptascoach_fem,
    -- il_sum_ftacunivemp_fem,
    -- il_sum_ptacunivemp_fem,
    -- il_sum_total_asstcoach,
    il_rev_men as total_revenue_mens_teams,
    il_rev_women as total_revenue_womens_teams,
    il_total_rev_menwomen as total_revenue_mens_and_womens_teams,
    il_rev_coed_men as total_revenue_men_on_coed_teams,
    il_rev_coed_women as total_revenue_women_on_coed_teams,
    il_total_rev_coed as total_revenue_coed,
    il_revenue_menall as total_revenue_men_including_coed,
    il_revenue_womenall as total_revenue_women_including_coed,
    IL_TOTAL_REVENUE_ALL as total_revenue_all_teams,
    -- IL_EXP_MEN,
    -- IL_EXP_WOMEN,
    -- IL_TOTAL_EXP_MENWOMEN,
    -- IL_EXP_COED_MEN,
    -- IL_EXP_COED_WOMEN,
    -- IL_TOTAL_EXP_COED,
    -- IL_EXPENSE_MENALL,
    -- IL_EXPENSE_WOMENALL,
    -- IL_TOTAL_EXPENSE_ALL,
    UNDUP_CT_PARTIC_MEN as unduplicated_men_participanting_in_mens_and_coed,
    UNDUP_CT_PARTIC_WOMEN as unduplicated_women_participating_in_womens_and_coed,
    TOT_REVENUE_ALL_NOTALLOC as total_revenue_not_allocated_by_gender_or_sport,
    TOT_EXPENSE_ALL_NOTALLOC as total_expenses_not_allocated_by_gender_or_sport,
    GRND_TOTAL_REVENUE as grand_total_revenue,
    GRND_TOTAL_EXPENSE as grand_total_expenses
  from raw_eada
)

select *,
  enrollment_male::float / enrollment_total as percentage_males_enrolled,
  enrollment_female::float / enrollment_total as percentage_females_enrolled
from eada_renanmed
