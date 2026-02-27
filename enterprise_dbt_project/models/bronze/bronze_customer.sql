{{ config(
    materialized='incremental',
    unique_key='C_CUSTKEY'
) }}

SELECT
    C_CUSTKEY,
    C_NAME,
    C_ADDRESS,
    C_NATIONKEY,
    C_PHONE,
    C_ACCTBAL,
    C_MKTSEGMENT,
    C_COMMENT,
    CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM {{ source('tpch', 'CUSTOMER') }}

{% if is_incremental() %}
WHERE C_CUSTKEY > (SELECT MAX(C_CUSTKEY) FROM {{ this }})
{% endif %}