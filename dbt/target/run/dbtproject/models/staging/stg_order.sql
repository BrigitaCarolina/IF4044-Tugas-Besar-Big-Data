
  
    
        create table db.stg_order
      
      
      
      
      
      
      
      

      as
      
SELECT
    CAST(O_ORDERKEY AS INT)        AS order_id,
    CAST(O_CUSTKEY AS INT)         AS customer_id,
    TRIM(O_ORDERSTATUS)            AS order_status,
    CAST(O_TOTALPRICE AS DECIMAL(15,2)) AS total_price,
    CAST(O_ORDERDATE AS DATE)      AS order_date,
    TRIM(O_ORDERPRIORITY)          AS order_priority,
    TRIM(O_CLERK)                  AS clerk,
    CAST(O_SHIPPRIORITY AS INT)    AS ship_priority,
    TRIM(O_COMMENT)                AS comment
FROM db.orders;
  