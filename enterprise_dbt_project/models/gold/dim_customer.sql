{{ config(materialized='table') }}

SELECT
    ROW_NUMBER() OVER (ORDER BY customer_id) AS customer_sk,
    customer_id,
    customer_name,
    address,
    nation_id,
    phone,
    account_balance,
    market_segment
FROM {{ ref('silver_customer') }}