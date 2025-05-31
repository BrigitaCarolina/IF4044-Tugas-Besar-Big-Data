
  
    
        create table db.stg_region
      
      
      
      
      
      
      
      

      as
      
SELECT 
    CAST(R_REGIONKEY AS INT) AS r_regionkey,
    TRIM(R_NAME) AS r_name,
    TRIM(R_COMMENT) AS r_comment
FROM db.region;
  