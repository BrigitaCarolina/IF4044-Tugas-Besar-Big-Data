create or replace view db.stg_region
  
  
  as
    SELECT 
    CAST(R_REGIONKEY AS INT) AS R_REGIONKEY,
    TRIM(R_NAME) AS R_NAME,
    TRIM(R_COMMENT) AS R_COMMENT
FROM db.region;
