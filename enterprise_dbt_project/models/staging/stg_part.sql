{{ config(materialized='view') }}

SELECT
    P_PARTKEY        AS part_id,
    P_NAME           AS part_name,
    P_MFGR           AS manufacturer,
    P_BRAND          AS brand,
    P_TYPE           AS type,
    P_SIZE           AS size,
    P_CONTAINER      AS container,
    P_RETAILPRICE    AS retail_price,
    ingestion_timestamp
FROM {{ ref('bronze_part') }}