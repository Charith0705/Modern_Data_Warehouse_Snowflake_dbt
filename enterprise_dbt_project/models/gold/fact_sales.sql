{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

SELECT
    o.order_id,
    dc.customer_sk,
    dp.part_sk,
    ds.supplier_sk,
    o.order_date,
    l.quantity,
    l.extended_price,
    l.discount,
    l.tax,
    (l.extended_price * (1 - l.discount)) AS net_sales
FROM {{ ref('silver_orders') }} o
JOIN {{ ref('silver_lineitem') }} l
    ON o.order_id = l.order_id
JOIN {{ ref('dim_customer') }} dc
    ON o.customer_id = dc.customer_id
JOIN {{ ref('dim_part') }} dp
    ON l.part_id = dp.part_id
JOIN {{ ref('dim_supplier') }} ds
    ON l.supplier_id = ds.supplier_id

{% if is_incremental() %}
WHERE o.order_date > (
    SELECT MAX(order_date) FROM {{ this }}
)
{% endif %}