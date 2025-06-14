with
source as (
    select * from {{ source('db', 'customer') }}
),
customer as (
    SELECT
        CAST(C_CUSTKEY AS INT)         AS customer_id,
        TRIM(C_NAME)                   AS name,
        TRIM(C_ADDRESS)                AS address,
        CAST(C_NATIONKEY AS INT)       AS nation_id,
        TRIM(C_PHONE)                  AS phone,
        CAST(C_ACCTBAL AS DECIMAL(15,2)) AS account_balance,
        TRIM(C_MKTSEGMENT)             AS market_segment,
        TRIM(C_COMMENT)                AS comment,
        CAST(C_LOADTIMESTAMP AS TIMESTAMP)          AS load_timestamp
    FROM source
)

select * from customer