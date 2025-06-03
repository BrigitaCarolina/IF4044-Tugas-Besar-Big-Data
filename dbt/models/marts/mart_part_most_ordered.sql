{{config(materialized = 'table')}}

SELECT
    P.dbt_scd_id, 
    P.part_id,
    P.part_name,
    SUM(LO.quantity) as ordered_item_quantity,
    SUM(LO.extended_price * (1 - LO.discount)) as total_revenue
FROM 
    {{ref('int_dim_part')}} P
INNER JOIN 
    {{ref('int_line_order')}} LO
ON  
    P.dbt_scd_id = LO.part_scd_id
GROUP BY
    1, 2
ORDER BY 4, 3