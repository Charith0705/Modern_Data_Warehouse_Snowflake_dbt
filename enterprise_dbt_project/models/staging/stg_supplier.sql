{{ config(materialized='view') }}

SELECT
    S_SUPPKEY        AS supplier_id,
    S_NAME           AS supplier_name,
    S_ADDRESS        AS address,
    S_NATIONKEY      AS nation_id,
    S_PHONE          AS phone,
    S_ACCTBAL        AS account_balance,
    S_COMMENT        AS comments,
    ingestion_timestamp
FROM {{ ref('bronze_supplier') }}