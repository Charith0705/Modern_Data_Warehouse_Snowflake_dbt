{{ config(
    materialized='table'
) }}

SELECT
    order_id,
    part_id,
    supplier_id,
    line_number,
    quantity,
    extended_price,
    discount,
    tax,
    return_flag,
    line_status,
    ship_date,
    ingestion_timestamp
FROM {{ ref('stg_lineitem') }}
WHERE quantity > 0
  AND extended_price >= 0