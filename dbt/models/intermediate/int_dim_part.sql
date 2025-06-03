{{ config(materialized='ephemeral') }}
SELECT
    P_PARTKEY as part_id,
    P_NAME as part_name,
    P_MFGR as part_mfgr,
    P_BRAND as part_brand,
    P_TYPE as part_type,
    P_SIZE as part_size,
    P_CONTAINER as part_container,
    P_RETAILPRICE as part_retailprice,
    P_COMMENT as part_comment,
    load_timestamp
FROM
    {{ref('stg_part')}} P
