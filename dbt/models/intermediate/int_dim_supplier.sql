{{ config(materialized='table') }}

SELECT
    sha2(
        (
            COALESCE(S.S_SUPPKEY, '') || '-' ||
            COALESCE(S.S_NAME, '') || '-' ||
            COALESCE(S.S_ADDRESS, '') || '-' ||
            COALESCE(N.nation_id, '') || '-' ||
            COALESCE(S.S_PHONE, '') || '-' ||
            COALESCE(S.S_ACCTBAL, '') || '-' ||
            COALESCE(S.S_COMMENT, '') || '-' ||
            COALESCE(R.r_regionkey, '') || '-' ||
            COALESCE(N.nation_name, '') || '-' ||
            COALESCE(N.nation_comment, '') || '-' ||
            COALESCE(R.R_NAME, '') || '-' ||
            COALESCE(R.R_COMMENT, '')
        ), 256
    ) as supplier_sk,
    S.S_SUPPKEY as supplier_id,
    S.S_NAME as supplier_name,
    S.S_ADDRESS AS supplier_address,
    N.nation_id AS supplier_nation_id,
    S.S_PHONE AS supplier_phone,
    S.S_ACCTBAL AS supplier_acctbal,
    S.S_COMMENT AS supplier_comment,
    R.r_regionkey as supplier_region_id,
    N.nation_name as supplier_nation_name,       
    N.nation_comment as nation_comment,
    R.r_name as supplier_region_name,
    R.r_comment as region_comment
FROM
    {{ref('stg_supplier')}} S 
JOIN 
    {{ref('stg_nation')}} N ON S.S_NATIONKEY = N.nation_id
JOIN
    {{ref('stg_region')}} R ON R.r_regionkey = N.region_id