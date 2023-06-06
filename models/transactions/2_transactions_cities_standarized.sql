SELECT
  * EXCEPT (ea_merchant_city)
  , CASE
    WHEN ea_merchant_city = 'praha' THEN 'praga'
    WHEN ea_merchant_city LIKE 'praha%' THEN 'praga'
    WHEN ea_merchant_city LIKE '%paris%' THEN 'paris'
    WHEN ea_merchant_city = 'tfl.gov.uk/cp' THEN 'london'
    WHEN ea_merchant_city = 'tfl travel ch' THEN 'london'
    WHEN ea_merchant_city LIKE 'london%' THEN 'london'
    WHEN ea_merchant_city = '4029357733' THEN 'london'
    WHEN ea_merchant_city = '800-592-8996' THEN 'san francisco'
    WHEN ea_merchant_city like '%dublin%' THEN 'dublin'
    WHEN ea_merchant_city = 'cluj-napoca' THEN 'cluj napoca'
    WHEN ea_merchant_city = 'palma de mall' THEN 'palma de mallorca'
    WHEN ea_merchant_city = 'z?rich' THEN 'zurich'
    ELSE ea_merchant_city
  END AS ea_merchant_city,
  COALESCE(ea_merchant_city, 'n/a') AS ea_merchant_city_standarized,
FROM transformed_data_dbt.transactions_no_outliers