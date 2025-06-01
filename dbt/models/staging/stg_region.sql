{{ config(materialized='table') }}
SELECT 
    CAST(R_REGIONKEY AS INT) AS r_regionkey,
    TRIM(R_NAME) AS r_name,
    TRIM(R_COMMENT) AS r_comment,
    CAST(R_LOADTIMESTAMP AS TIMESTAMP)          AS load_timestamp
FROM db.region;