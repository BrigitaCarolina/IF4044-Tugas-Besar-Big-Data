{{config(materialized = 'table')}}

SELECT 
    C.customer_nation_id, 
    C.customer_nation_name,
    P.part_id, 
    P.part_name, 
    SUM(LO.extended_price) as total_item_price
FROM 
    {{ref('int_dim_customer')}} C 
INNER JOIN 
    {{ref('int_line_order')}} LO
ON C.customer_id = LO.customer_id
INNER JOIN 
    {{ref('int_dim_part')}} P
ON LO.part_id = P.part_id
GROUP BY 
    1,2,3,4
ORDER BY
    5 DESC