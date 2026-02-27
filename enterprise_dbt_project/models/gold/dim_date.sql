{{ config(materialized='table') }}

SELECT DISTINCT
    order_date AS date,
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    DAY(order_date) AS day
FROM {{ ref('silver_orders') }}