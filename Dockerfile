FROM continuumio/anaconda3

WORKDIR /airflow

RUN apt-get update \
    && apt-get install -y vim \
    && mkdir notebooks dags\
    && pip install apache-airflow==2.4.0

ENV AIRFLOW_HOME /airflow

COPY run.sh .

EXPOSE 8888
EXPOSE 8080

VOLUME /airflow/dags

CMD ["bash", "run.sh"]

