FROM continuumio/anaconda3

WORKDIR /airflow

ENV AIRFLOW_HOME /airflow
ENV SHELL /bin/bash
ENV AIRFLOW_USER admin
ENV AIRFLOW_USER_FIRSTNAME admin
ENV AIRFLOW_USER_LASTNAME admin
ENV AIRFLOW_USER_EMAIL admin@admin.com
ENV AIRFLOW_PASSWORD admin
ENV AIRFLOW_WEB_PORT 8080
ENV JUPYTER_PORT 8888

RUN apt-get update \
    && apt-get install -y vim \
    && mkdir notebooks dags logs logs/scheduler logs/webserver\
    && pip install apache-airflow==2.4.0

EXPOSE ${JUPYTER_PORT}
EXPOSE ${AIRFLOW_WEB_PORT}

VOLUME /airflow/dags

COPY run.sh .

CMD ["bash", "run.sh"]

