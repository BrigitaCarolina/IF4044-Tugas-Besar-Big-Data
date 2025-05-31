
SELECT 
    CAST(N_NATIONKEY AS INT) AS nation_id,
    CAST(N_REGIONKEY AS INT) AS region_id,
    TRIM(N_NAME) AS nation_name,       
    TRIM(N_COMMENT) AS nation_comment
FROM db.nation;