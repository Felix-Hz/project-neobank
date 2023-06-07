with
    users_new as (
        select
            user_id as user_id_2,
            birth_year,
            plan,
            city,
            country,
            format_timestamp('%Y-%m-%d', member_at) as member_at,
            format_timestamp('%Y-%m-%d', first_transaction) as first_transaction,
            format_timestamp('%Y-%m-%d', latest_transaction) as latest_transaction,
            nb_transactions,
            user_settings_crypto_unlocked,
            attributes_notifications_marketing_push,
            attributes_notifications_marketing_email,
            num_contacts,
            num_referrals,
            num_successful_referrals
        from insights.users_transactions
    )

select * except (user_id_2)
from transformed_data_dbt.transactions_clean as t_clean
left join users_new on t_clean.user_id = users_new.user_id_2
