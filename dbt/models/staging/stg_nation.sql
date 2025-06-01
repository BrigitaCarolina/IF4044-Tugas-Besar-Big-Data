{{ config(materialized='table') }}
SELECT 
    CAST(N_NATIONKEY AS INT) AS nation_id,
    CAST(N_REGIONKEY AS INT) AS region_id,
    TRIM(N_NAME) AS nation_name,       
    TRIM(N_COMMENT) AS nation_comment,
    CAST(N_LOADTIMESTAMP AS TIMESTAMP)          AS load_timestamp
FROM db.nation;