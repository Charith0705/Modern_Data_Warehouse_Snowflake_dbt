{{ config(
    materialized='incremental',
    unique_key='P_PARTKEY'
) }}

SELECT
    P_PARTKEY,
    P_NAME,
    P_MFGR,
    P_BRAND,
    P_TYPE,
    P_SIZE,
    P_CONTAINER,
    P_RETAILPRICE,
    CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM {{ source('tpch', 'PART') }}

{% if is_incremental() %}
WHERE P_PARTKEY > (SELECT MAX(P_PARTKEY) FROM {{ this }})
{% endif %}