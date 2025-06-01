{{ config(materialized='table') }}
SELECT
    sha2(
        (
            COALESCE(P_PARTKEY, '') || '-' ||
            COALESCE(P_NAME, '') || '-' ||
            COALESCE(P_MFGR, '') || '-' ||
            COALESCE(P_BRAND, '') || '-' ||
            COALESCE(P_TYPE, '') || '-' ||
            COALESCE(P_SIZE, '') || '-' ||
            COALESCE(P_CONTAINER, '') || '-' ||
            COALESCE(P_RETAILPRICE, '') || '-' ||
            COALESCE(P_COMMENT, '')
        ), 256
    ) AS part_sk,
    P_PARTKEY as part_id,
    P_NAME as part_name,
    P_MFGR as part_mfgr,
    P_BRAND as part_brand,
    P_TYPE as part_type,
    P_SIZE as part_size,
    P_CONTAINER as part_container,
    P_RETAILPRICE as part_retailprice,
    P_COMMENT as part_comment

FROM
    {{ref('stg_part')}} P
