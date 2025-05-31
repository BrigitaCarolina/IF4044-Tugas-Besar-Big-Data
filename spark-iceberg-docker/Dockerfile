FROM openjdk:11-jdk

RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-venv wget curl && \
    apt-get clean

ENV SPARK_VERSION=3.5.0
ENV HADOOP_VERSION=3

RUN wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    tar xzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C /opt && \
    rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

ENV SPARK_HOME=/opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}
ENV PATH=$SPARK_HOME/bin:$PATH

COPY requirements.txt /mnt/project/requirements.txt
RUN pip3 install -r /mnt/project/requirements.txt
ENV PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.9.9-src.zip:$PYTHONPATH

WORKDIR /mnt/project
