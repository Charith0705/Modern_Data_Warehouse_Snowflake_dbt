{{ config(materialized='table') }}

SELECT
    ROW_NUMBER() OVER (ORDER BY supplier_id) AS supplier_sk,
    supplier_id,
    supplier_name,
    address,
    nation_id,
    phone,
    account_balance
FROM {{ ref('stg_supplier') }}