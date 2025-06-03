FROM openjdk:11-jdk

RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-venv wget curl && \
    apt-get clean

ENV SPARK_VERSION=3.5.0
ENV HADOOP_VERSION=3

RUN wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
    tar xzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C /opt && \
    rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

RUN wget https://archive.apache.org/dist/hive/hive-3.1.2/apache-hive-3.1.2-bin.tar.gz && \
    tar xzf apache-hive-3.1.2-bin.tar.gz -C /opt && \
    rm apache-hive-3.1.2-bin.tar.gz

RUN wget https://downloads.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz && \
    tar xzf hadoop-3.3.6.tar.gz -C /opt && \
    rm hadoop-3.3.6.tar.gz

RUN mv /opt/hadoop-3.3.6 /opt/hadoop
RUN mv /opt/apache-hive-3.1.2-bin /opt/hive

ENV SPARK_HOME=/opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}
ENV PATH=$SPARK_HOME/bin:$PATH
ENV HIVE_HOME=/opt/hive
ENV PATH=$PATH:$HIVE_HOME/bin
ENV HADOOP_HOME=/opt/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
ENV HADOOP_VERSION=3.3.6

COPY requirements.txt /mnt/project/requirements.txt
RUN pip3 install -r /mnt/project/requirements.txt
ENV PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.9.9-src.zip:$PYTHONPATH

WORKDIR /mnt/project