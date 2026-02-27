{{ config(
    materialized='incremental',
    unique_key='L_ORDERKEY'
) }}

SELECT
    L_ORDERKEY,
    L_PARTKEY,
    L_SUPPKEY,
    L_LINENUMBER,
    L_QUANTITY,
    L_EXTENDEDPRICE,
    L_DISCOUNT,
    L_TAX,
    L_RETURNFLAG,
    L_LINESTATUS,
    L_SHIPDATE,
    CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM {{ source('tpch', 'LINEITEM') }}

{% if is_incremental() %}
WHERE L_SHIPDATE > (SELECT MAX(L_SHIPDATE) FROM {{ this }})
{% endif %}