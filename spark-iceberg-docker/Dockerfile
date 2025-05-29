FROM bitnami/spark:3.5

USER root

ADD https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.5_2.12/1.5.0/iceberg-spark-runtime-3.5_2.12-1.5.0.jar \
    /opt/bitnami/spark/jars/

COPY spark-defaults.conf /opt/bitnami/spark/conf/

ENV HOME=/home/sparkuser
RUN useradd -ms /bin/bash sparkuser && \
    chown -R sparkuser /opt/bitnami/spark

USER sparkuser
WORKDIR /home/sparkuser
