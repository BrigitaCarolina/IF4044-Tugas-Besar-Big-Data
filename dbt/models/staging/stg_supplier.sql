{{ config(materialized='table') }}
SELECT
    CAST(S_SUPPKEY AS INT) AS s_suppkey,
    TRIM(S_NAME) AS s_name,
    TRIM(S_ADDRESS) AS s_address,
    CAST(S_NATIONKEY AS INT) AS s_nationkey,
    TRIM(S_PHONE) AS s_phone,
    CAST(S_ACCTBAL AS DECIMAL(15,2)) AS s_acctbal,
    TRIM(S_COMMENT) AS s_comment
FROM db.supplier;