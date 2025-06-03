with
source as (
    select * from {{ source('db', 'part') }}
),
part as (
    SELECT 
        CAST(P_PARTKEY AS INT) AS p_partkey,
        TRIM(P_NAME) AS p_name,
        TRIM(P_MFGR) AS p_mfgr,
        TRIM(P_BRAND) AS p_brand,
        TRIM(P_TYPE) AS p_type,
        CAST(P_SIZE AS INT) AS p_size,
        TRIM(P_CONTAINER) AS p_container,
        CAST(P_RETAILPRICE AS DECIMAL(15,2)) AS p_retailprice,
        TRIM(P_COMMENT) AS p_comment,
        CAST(P_LOADTIMESTAMP AS TIMESTAMP) AS load_timestamp
    FROM source
)

select * from part
