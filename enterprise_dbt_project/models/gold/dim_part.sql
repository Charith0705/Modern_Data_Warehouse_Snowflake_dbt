{{ config(materialized='table') }}

SELECT
    ROW_NUMBER() OVER (ORDER BY part_id) AS part_sk,
    part_id,
    part_name,
    manufacturer,
    brand,
    type,
    size,
    container,
    retail_price
FROM {{ ref('stg_part') }}