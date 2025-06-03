{{ config(materialized='ephemeral') }}

SELECT
    C.customer_id,
    C.name as customer_name,
    C.address as customer_address,
    N.nation_id as customer_nation_id,
    C.phone as customer_phone,
    C.account_balance as customer_account_balance,
    C.market_segment as customer_market_segment,
    C.comment as customer_comment,
    R.r_regionkey as customer_region_id,
    N.nation_name as customer_nation_name,       
    N.nation_comment as nation_comment,
    R.r_name as customer_region_name,
    R.r_comment as region_comment,
    C.load_timestamp
FROM
    {{ref('stg_customer')}} C
JOIN 
    {{ref('stg_nation')}} N ON C.nation_id = N.nation_id
JOIN
    {{ref('stg_region')}} R ON R.r_regionkey = N.region_id