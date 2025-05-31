{{ config(materialized='table') }}
SELECT
    CAST(L_ORDERKEY AS INT)         AS order_id,
    CAST(L_PARTKEY AS INT)          AS part_id,
    CAST(L_SUPPKEY AS INT)          AS supplier_id,
    CAST(L_LINENUMBER AS INT)       AS line_number,
    CAST(L_QUANTITY AS DECIMAL(15,2)) AS quantity,
    CAST(L_EXTENDEDPRICE AS DECIMAL(15,2)) AS extended_price,
    CAST(L_DISCOUNT AS DECIMAL(15,2)) AS discount,
    CAST(L_TAX AS DECIMAL(15,2))     AS tax,
    TRIM(L_RETURNFLAG)              AS return_flag,
    TRIM(L_LINESTATUS)              AS line_status,
    CAST(L_SHIPDATE AS DATE)        AS ship_date,
    CAST(L_COMMITDATE AS DATE)      AS commit_date,
    CAST(L_RECEIPTDATE AS DATE)     AS receipt_date,
    TRIM(L_SHIPINSTRUCT)            AS ship_instruct,
    TRIM(L_SHIPMODE)                AS ship_mode,
    TRIM(L_COMMENT)                 AS comment
FROM db.lineitem;