{{ config(
    materialized='table'
) }}

SELECT
    order_id,
    customer_id,
    order_status,
    total_price,
    order_date,
    order_priority,
    clerk_name,
    ship_priority,
    comments,
    ingestion_timestamp
FROM {{ ref('stg_orders') }}
WHERE total_price IS NOT NULL
  AND order_date IS NOT NULL