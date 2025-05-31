create or replace view db.stg_partsupp
  
  
  as
    SELECT
    CAST(PS_PARTKEY AS INT) AS ps_partkey,
    CAST(PS_SUPPKEY AS INT) AS ps_suppkey,
    CAST(PS_AVAILQTY AS INT) AS ps_availqty,
    CAST(PS_SUPPLYCOST AS INT) AS ps_supplycost,
    TRIM(PS_COMMENT) AS PS_COMMENT
FROM db.partsupp;
