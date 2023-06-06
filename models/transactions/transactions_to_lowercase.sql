SELECT 
  transaction_id
  , user_id
  , LOWER(transactions_type) AS transactions_type
  , LOWER(transactions_currency) AS transactions_currency
  , amount_usd
  , LOWER(transactions_state) AS transactions_state
  , LOWER(ea_cardholderpresence) AS ea_cardholderpresence
  , ea_merchant_mcc
  , LOWER(ea_merchant_city)as ea_merchant_city
  , LOWER(ea_merchant_country) AS ea_merchant_country
  , LOWER(direction) AS direction
  , created_date
 FROM `neo-bank-388616.neo_bank.transactions`