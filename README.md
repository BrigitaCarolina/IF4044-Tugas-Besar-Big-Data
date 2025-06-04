# tugas-besar-big-data

## Getting Started

### Prerequisites

- Docker
- [TPC-H data in CSV format](#generating-tpc-h-csv-data)

### Environment Variables
- /spark-iceberg-docker/.env
  - PROJECT_DIRECTORY_PATH\
    Absolute host path to the project root directory
  - WAREHOUSE_DIRECTORY_PATH\
    Absolute host path to the warehouse. Iceberg will store data in this directory.

### 1. Clone the Repository

```sh
git clone https://github.com/BrigitaCarolina/tugas-besar-big-data.git
cd tugas-besar-big-data
```

### 2. Copy the TPC-H CSV Data to the Project Directory
Copy the TPC-H CSV data files to the `seeds` directory in the project root.

### 3. Set Up the Container

```sh
cd spark-iceberg-docker
docker compose up -d
```

This will launch Spark and Iceberg with Hive Catalog services in a Docker container. Volumes will be mounted to `PROJECT_DIRECTORY_PATH` and `WAREHOUSE_DIRECTORY_PATH` as specified in the `.env` file.


### 4. Access the Container Bash

```sh
docker exec -it spark-iceberg /bin/bash
```

The working directory will be set to `/mnt/project`, which is the mounted project directory.

### 5. Initialize the Hive Metastore Schema

```sh
schematool --dbType derby --initSchema
```
### 6. Run Hive Metastore

```sh
hive --service metastore \
    --hiveconf hive.metastore.warehouse.dir=/usr/hive/warehouse \
    --hiveconf hive.metastore.uris=thrift://localhost:9083 &
```
This will start the Hive Metastore service on background, which is required for Iceberg to manage metadata.

### 7. Run Spark Shell

```sh
spark-sql --packages org.apache.iceberg:iceberg-spark-runtime-3.5_2.12:1.9.1\
    --conf spark.sql.extensions=org.apache.iceberg.spark.extensions.IcebergSparkSessionExtensions \
    --conf spark.sql.catalog.local=org.apache.iceberg.spark.SparkCatalog \
    --conf spark.sql.catalog.local.type=hive \
    --conf spark.sql.catalog.local.warehouse=/usr/hive/warehouse \
    --conf spark.sql.catalog.local.uri=thrift://localhost:9083 \
    --conf spark.sql.defaultCatalog=local
```
This will launch the Spark shell with Iceberg support, which allows you to create and manage Iceberg tables.

### 8. Load Data into Iceberg in Spark Shell
```sh
SOURCE /mnt/project/scripts/bootstrap.sql
```
This will create the necessary Iceberg tables and load the `.csv` TPC-H data in `/mnt/project/seed` into the Iceberg tables.

---

## Running dbt Models
### 1. Run dbt Models

```sh
cd dbt
dbt run --select <model_1_name> <model_2_name> ...
```
Replace `<model_1_name>`, `<model_2_name>`, etc. with the names of the dbt models you want to run. This will execute the dbt models defined in the `dbt/models` directory.

You can also run the entire layer by specifying the layer name, such as `dbt run --select staging` to run all models in the `staging` layer.

To run all models, omit the `--select` option and arguments.

### 2. Run dbt Snapshots

```sh
dbt snapshot
```

### 3. Run dbt Tests

```sh
dbt test --select <model_1_name> <model_2_name> ...
```

Similar to running models, replace `<model_1_name>`, `<model_2_name>`, etc. with the names of the dbt models you want to test. This will execute the tests defined in the `dbt/tests` directory. You can also run all tests by omitting the `--select` option.

---

## Generating TPC-H CSV Data 

To generate TPC-H data, you can refer to:
- [electrum/tpch-dbgen GitHub Repository](https://github.com/electrum/tpch-dbgen) (generated data is in `.tbl`, you need to convert them to `.csv`), or
- [duckdb is the best TPC data generator](https://xuanwo.io/links/2025/02/duckdb-is-the-best-tpc-data-generator/)  (you can replace `(FORMAT PARQUET)` with `(FORMAT CSV, HEADER FALSE)`)