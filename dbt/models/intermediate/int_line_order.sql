{{ config(materialized='incremental') }}
SELECT
    sha2(
        (
            COALESCE(L.order_id, '') || '-' ||
            COALESCE(P.dbt_scd_id, '') || '-' ||
            COALESCE(S.dbt_scd_id, '') || '-' ||
            COALESCE(C.dbt_scd_id, '')
        ), 256
    ) line_order_id,
    L.order_id, 
    P.dbt_scd_id AS part_scd_id,
    L.part_id,
    S.dbt_scd_id AS supplier_scd_id,
    L.supplier_id,
    L.line_number,
    L.quantity,
    L.extended_price,
    L.discount,
    L.tax,
    L.return_flag,
    L.line_status,
    L.ship_date,
    L.commit_date,
    L.receipt_date,
    L.ship_instruct,
    L.ship_mode,
    L.comment as lineitem_comment,
    C.dbt_scd_id as customer_scd_id,
    O.customer_id,
    O.order_status,
    O.total_price as total_order_price,
    PS.ps_supplycost as supply_cost,
    O.order_date,
    O.order_priority,
    O.clerk,
    O.ship_priority,
    O.comment AS order_comment
FROM
    {{ref('stg_lineitem')}} L 
INNER JOIN
    {{ref('stg_order')}} O ON L.order_id = O.order_id
INNER JOIN 
    {{ref('customer_history')}} C ON C.customer_id = O.customer_id
INNER JOIN 
    {{ref('stg_partsupp')}} PS on PS.ps_suppkey = L.supplier_id
INNER JOIN 
    {{ref('part_history')}} P ON L.part_id = P.part_id
INNER JOIN 
    {{ref('supplier_history')}} S on S.supplier_id = L.supplier_id
WHERE 
    C.dbt_valid_to is null AND P.dbt_valid_to is null AND S.dbt_valid_to is null

{% if is_incremental() %}
  AND order_date >= (select coalesce(max(order_date),'1900-01-01') from {{ this }} )
{% endif %}