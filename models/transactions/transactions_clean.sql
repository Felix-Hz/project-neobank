select
    transaction_id,
    user_id,
    transactions_type,
    transactions_currency,
    amount_usd,
    transactions_state,
    direction,
    format_timestamp('%Y-%m-%d', created_date) as created_date,
    ea_merchant_city_standarized,
    cast(coalesce(ea_merchant_mcc, 0) as int) as ea_merchant_mcc_standarized,
    coalesce(ea_cardholderpresence, 'unknown') as ea_cardholderpresence_standarized,
    coalesce(ea_merchant_country, 'n/a') as ea_merchant_country_standarized
from `neo-bank-388616.transformed_data_dbt.2_transactions_cities_standarized`
where amount_usd < 100000
order by ea_merchant_mcc_standarized desc
