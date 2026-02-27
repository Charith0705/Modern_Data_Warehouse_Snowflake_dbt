{{ config(
    materialized='incremental',
    unique_key='O_ORDERKEY'
) }}

SELECT
    O_ORDERKEY,
    O_CUSTKEY,
    O_ORDERSTATUS,
    O_TOTALPRICE,
    O_ORDERDATE,
    O_ORDERPRIORITY,
    O_CLERK,
    O_SHIPPRIORITY,
    O_COMMENT,
    CURRENT_TIMESTAMP() AS ingestion_timestamp
FROM {{ source('tpch', 'ORDERS') }}

{% if is_incremental() %}
WHERE O_ORDERDATE > (
    SELECT MAX(O_ORDERDATE) FROM {{ this }}
)
{% endif %}