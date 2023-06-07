SELECT
  * EXCEPT (ea_merchant_city, ea_merchant_country, ea_merchant_city_modif),
  CAST(COALESCE(ea_merchant_mcc, 0) AS INT) as ea_merchant_mcc_standarized,
  COALESCE(ea_cardholderpresence, 'unknown') as ea_cardholderpresence_standarized, 
  COALESCE(ea_merchant_country, 'n/a') AS ea_merchant_country_standarized
FROM `neo-bank-388616.transformed_data_dbt.2_transactions_cities_standarized`
WHERE amount_usd < 100000
ORDER BY ea_merchant_mcc_standarized DESC