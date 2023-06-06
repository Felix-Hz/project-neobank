SELECT t.*
FROM `transformed_data_dbt.transactions_to_lowercase` AS t
JOIN (
  SELECT
    transactions_currency,
    APPROX_QUANTILES(amount_usd, 4)[OFFSET(1)] AS first_quartile,
    APPROX_QUANTILES(amount_usd, 4)[OFFSET(3)] AS third_quartile
  FROM `transformed_data_dbt.transactions_to_lowercase`
  GROUP BY transactions_currency
) AS quartiles
ON t.transactions_currency = quartiles.transactions_currency
WHERE
  (t.amount_usd >= quartiles.first_quartile - 1.5 * (quartiles.third_quartile - quartiles.first_quartile))
  AND (t.amount_usd <= quartiles.third_quartile + 1.5 * (quartiles.third_quartile - quartiles.first_quartile))
ORDER BY transactions_currency ASC