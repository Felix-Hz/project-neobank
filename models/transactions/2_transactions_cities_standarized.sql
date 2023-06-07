WITH cte AS (
  SELECT
    *,
    CASE
      WHEN REGEXP_CONTAINS(ea_merchant_city, r'new york') THEN 'new york'
      WHEN REGEXP_CONTAINS(ea_merchant_city, r'praha') THEN 'praga'
      WHEN REGEXP_CONTAINS(ea_merchant_city, r'paris') THEN 'paris'
      WHEN REGEXP_CONTAINS(ea_merchant_city, r'tfl') THEN 'london'
      WHEN REGEXP_CONTAINS(ea_merchant_city, r'london') THEN 'london'
      WHEN REGEXP_CONTAINS(ea_merchant_city, r'dublin') THEN 'dublin'
      WHEN ea_merchant_city = '4029357733' THEN 'london'
      WHEN ea_merchant_city = '800-592-8996' THEN 'san francisco'
      WHEN ea_merchant_city = 'abudhabi' THEN 'abu dhabi'
      WHEN ea_merchant_city = 'dubai h' THEN 'dubai'
      WHEN ea_merchant_city = 'cluj-napoca' THEN 'cluj napoca'
      WHEN ea_merchant_city = 'palma de mall' THEN 'palma de mallorca'
      WHEN ea_merchant_city = 'z?rich' THEN 'zurich'
      ELSE ea_merchant_city
    END AS ea_merchant_city_modif
  FROM transformed_data_dbt.transactions_to_lowercase
)
SELECT
  *,
  COALESCE(ea_merchant_city_modif, 'n/a') AS ea_merchant_city_standarized
FROM cte


