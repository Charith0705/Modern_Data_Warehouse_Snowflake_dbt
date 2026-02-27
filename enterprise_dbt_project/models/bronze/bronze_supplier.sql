{{ config(
    materialized='incremental',
    unique_key='S_SUPPKEY'
) }}

SELECT
    S_SUPPKEY,
    S_NAME,
    S_ADDRESS,
    S_NATIONKEY,
    S_PHONE,
    S_ACCTBAL,
    S_COMMENT,
    CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM {{ source('tpch', 'SUPPLIER') }}

{% if is_incremental() %}
WHERE S_SUPPKEY > (SELECT MAX(S_SUPPKEY) FROM {{ this }})
{% endif %}