{{config(materialized = 'table')}}

SELECT 
    C.customer_nation_id, 
    C.customer_nation_name,
    P.dbt_scd_id as part_scd_id,
    P.part_id, 
    P.part_name, 
    SUM(LO.extended_price) as total_item_price
FROM 
    {{ref('int_dim_customer')}} C 
INNER JOIN 
    {{ref('int_line_order')}} LO
ON C.dbt_scd_id = LO.customer_scd_id
INNER JOIN 
    {{ref('int_dim_part')}} P
ON LO.part_scd_id = P.dbt_scd_id
GROUP BY 
    1,2,3,4
ORDER BY
    5 DESC