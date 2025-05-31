{{ config(materialized='incremental') }}
SELECT
    sha2(
        (
            COALESCE(L.order_id, '') || '-' ||
            COALESCE(L.part_id, '') || '-' ||
            COALESCE(L.supplier_id, '') || '-' ||
            COALESCE(O.customer_id, '')
        ), 256
    ),
    L.order_id, 
    L.part_id,
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
    O.customer_id,
    O.order_status,
    O.total_price as total_order_price,
    O.order_date,
    O.order_priority,
    O.clerk,
    O.ship_priority,
    O.comment AS order_comment
FROM
    {{ref('stg_lineitem')}} L 
JOIN
    {{ref('stg_order')}} O ON L.order_id = O.order_id


{% if is_incremental() %}

  where order_date >= (select coalesce(max(order_date),'1900-01-01') from {{ this }} )

{% endif %}