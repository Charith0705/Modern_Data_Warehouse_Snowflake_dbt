{{ config(materialized='view') }}

SELECT
    L_ORDERKEY       AS order_id,
    L_PARTKEY        AS part_id,
    L_SUPPKEY        AS supplier_id,
    L_LINENUMBER     AS line_number,
    L_QUANTITY       AS quantity,
    L_EXTENDEDPRICE  AS extended_price,
    L_DISCOUNT       AS discount,
    L_TAX            AS tax,
    L_RETURNFLAG     AS return_flag,
    L_LINESTATUS     AS line_status,
    L_SHIPDATE       AS ship_date,
    ingestion_timestamp
FROM {{ ref('bronze_lineitem') }}