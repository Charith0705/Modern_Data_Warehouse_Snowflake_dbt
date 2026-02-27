{{ config(materialized='view') }}

SELECT
    O_ORDERKEY        AS order_id,
    O_CUSTKEY         AS customer_id,
    O_ORDERSTATUS     AS order_status,
    O_TOTALPRICE      AS total_price,
    O_ORDERDATE       AS order_date,
    O_ORDERPRIORITY   AS order_priority,
    O_CLERK           AS clerk_name,
    O_SHIPPRIORITY    AS ship_priority,
    O_COMMENT         AS comments,
    ingestion_timestamp
FROM {{ ref('bronze_orders') }}