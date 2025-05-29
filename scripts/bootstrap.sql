CREATE TABLE db.nation ( N_NATIONKEY  INTEGER NOT NULL,
                            N_NAME       CHAR(25) NOT NULL,
                            N_REGIONKEY  INTEGER NOT NULL,
                            N_COMMENT    VARCHAR(152))
USING iceberg
LOCATION '/mnt/project/warehouse/nation';

LOAD DATA INPATH '/mnt/project/dbt/seeds/nation.csv'
INTO TABLE db.nation;

CREATE TABLE db.region ( R_REGIONKEY  INTEGER NOT NULL,
                            R_NAME       CHAR(25) NOT NULL,
                            R_COMMENT    VARCHAR(152))
USING iceberg
LOCATION '/mnt/project/warehouse/region';

LOAD DATA INPATH '/mnt/project/dbt/seeds/region.csv'
INTO TABLE db.region;

CREATE TABLE db.part  ( P_PARTKEY     INTEGER NOT NULL,
                          P_NAME        VARCHAR(55) NOT NULL,
                          P_MFGR        CHAR(25) NOT NULL,
                          P_BRAND       CHAR(10) NOT NULL,
                          P_TYPE        VARCHAR(25) NOT NULL,
                          P_SIZE        INTEGER NOT NULL,
                          P_CONTAINER   CHAR(10) NOT NULL,
                          P_RETAILPRICE DECIMAL(15,2) NOT NULL,
                          P_COMMENT     VARCHAR(23) NOT NULL )
USING iceberg
LOCATION '/mnt/project/warehouse/part';

LOAD DATA INPATH '/mnt/project/dbt/seeds/part.csv'
INTO TABLE db.part;

CREATE TABLE db.supplier ( S_SUPPKEY     INTEGER NOT NULL,
                             S_NAME        CHAR(25) NOT NULL,
                             S_ADDRESS     VARCHAR(40) NOT NULL,
                             S_NATIONKEY   INTEGER NOT NULL,
                             S_PHONE       CHAR(15) NOT NULL,
                             S_ACCTBAL     DECIMAL(15,2) NOT NULL,
                             S_COMMENT     VARCHAR(101) NOT NULL)
USING iceberg
LOCATION '/mnt/project/warehouse/supplier';

LOAD DATA INPATH '/mnt/project/dbt/seeds/supplier.csv'
INTO TABLE db.supplier;

CREATE TABLE db.partsupp ( PS_PARTKEY     INTEGER NOT NULL,
                             PS_SUPPKEY     INTEGER NOT NULL,
                             PS_AVAILQTY    INTEGER NOT NULL,
                             PS_SUPPLYCOST  DECIMAL(15,2)  NOT NULL,
                             PS_COMMENT     VARCHAR(199) NOT NULL )
USING iceberg
LOCATION '/mnt/project/warehouse/partsupp';

LOAD DATA INPATH '/mnt/project/dbt/seeds/partsupp.csv'
INTO TABLE db.partsupp;

CREATE TABLE dbt.customer ( C_CUSTKEY     INTEGER NOT NULL,
                             C_NAME        VARCHAR(25) NOT NULL,
                             C_ADDRESS     VARCHAR(40) NOT NULL,
                             C_NATIONKEY   INTEGER NOT NULL,
                             C_PHONE       CHAR(15) NOT NULL,
                             C_ACCTBAL     DECIMAL(15,2)   NOT NULL,
                             C_MKTSEGMENT  CHAR(10) NOT NULL,
                             C_COMMENT     VARCHAR(117) NOT NULL)
USING iceberg
LOCATION '/mnt/project/warehouse/customer';

LOAD DATA INPATH '/mnt/project/dbt/seeds/customer.csv'
INTO TABLE dbt.customer;

CREATE TABLE db.orders  ( O_ORDERKEY       INTEGER NOT NULL,
                           O_CUSTKEY        INTEGER NOT NULL,
                           O_ORDERSTATUS    CHAR(1) NOT NULL,
                           O_TOTALPRICE     DECIMAL(15,2) NOT NULL,
                           O_ORDERDATE      DATE NOT NULL,
                           O_ORDERPRIORITY  CHAR(15) NOT NULL,  
                           O_CLERK          CHAR(15) NOT NULL, 
                           O_SHIPPRIORITY   INTEGER NOT NULL,
                           O_COMMENT        VARCHAR(79) NOT NULL)
USING iceberg
LOCATION '/mnt/project/warehouse/orders';

LOAD DATA INPATH '/mnt/project/dbt/seeds/orders.csv'
INTO TABLE db.orders;

CREATE TABLE db.lineitem ( L_ORDERKEY    INTEGER NOT NULL,
                             L_PARTKEY     INTEGER NOT NULL,
                             L_SUPPKEY     INTEGER NOT NULL,
                             L_LINENUMBER  INTEGER NOT NULL,
                             L_QUANTITY    DECIMAL(15,2) NOT NULL,
                             L_EXTENDEDPRICE  DECIMAL(15,2) NOT NULL,
                             L_DISCOUNT    DECIMAL(15,2) NOT NULL,
                             L_TAX         DECIMAL(15,2) NOT NULL,
                             L_RETURNFLAG  CHAR(1) NOT NULL,
                             L_LINESTATUS  CHAR(1) NOT NULL,
                             L_SHIPDATE    DATE NOT NULL,
                             L_COMMITDATE  DATE NOT NULL,
                             L_RECEIPTDATE DATE NOT NULL,
                             L_SHIPINSTRUCT CHAR(25) NOT NULL,
                             L_SHIPMODE     CHAR(10) NOT NULL,
                             L_COMMENT      VARCHAR(44) NOT NULL)
USING iceberg
LOCATION '/mnt/project/warehouse/lineitem';

LOAD DATA INPATH '/mnt/project/dbt/seeds/lineitem.csv'
INTO TABLE db.lineitem;