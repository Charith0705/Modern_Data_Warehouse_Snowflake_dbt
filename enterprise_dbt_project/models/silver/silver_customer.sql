{{ config(
    materialized='table'
) }}

SELECT
    customer_id,
    customer_name,
    address,
    nation_id,
    phone,
    account_balance,
    market_segment,
    comments,
    ingestion_timestamp
FROM {{ ref('stg_customer') }}
WHERE customer_id IS NOT NULL