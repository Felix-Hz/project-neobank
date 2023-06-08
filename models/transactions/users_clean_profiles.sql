with
    user_profiles as (
        select
            user_id,
            percentage_outbound,
            case
                when percentage_outbound > 55 then "dynamo" else "Static"
            end as user_profile
        from `neo-bank-388616.insights.percentage_inbound_outbound`
    )

select
    u_clean.user_id,
    u_clean.birth_year,
    u_clean.country,
    u_clean.city,
    format_timestamp('%Y-%m-%d', u_clean.created_date) as created_date,
    u_clean.user_settings_crypto_unlocked,
    u_clean.plan,
    u_clean.attributes_notifications_marketing_push,
    u_clean.attributes_notifications_marketing_email,
    u_clean.num_contacts,
    u_clean.num_referrals,
    u_clean.num_successful_referrals,
    u_clean.nb_transactions,
    format_timestamp('%Y-%m-%d', u_clean.latest_transaction) as latest_transaction,
    format_timestamp('%Y-%m-%d', u_clean.first_transaction) as first_transaction,
    user_profiles.percentage_outbound,
    user_profiles.user_profile,
    coalesce(u_status.user_status, 'inactive') as user_status
from neo_bank.users_clean1 as u_clean
inner join user_profiles on u_clean.user_id = user_profiles.user_id
inner join insights.user_status as u_status on u_clean.user_id = u_status.user_id
