FROM continuumio/anaconda3


LABEL maintainer="Kunal Chhabra" \
      version="1.0.0" \
      description="Docker image with airflow and data science tools"

ENV AIRFLOW_HOME=/airflow \
    SHELL=/bin/bash \
    AIRFLOW_USER=admin \
    AIRFLOW_USER_FIRSTNAME=admin \
    AIRFLOW_USER_LASTNAME=admin \
    AIRFLOW_USER_EMAIL=admin@admin.com \
    AIRFLOW_PASSWORD=admin \
    AIRFLOW_WEB_PORT=8080 \
    JUPYTER_PORT=8888

EXPOSE ${JUPYTER_PORT} ${AIRFLOW_WEB_PORT}

WORKDIR ${AIRFLOW_HOME}

RUN apt-get update \
    && apt-get install --no-install-recommends -y vim \
    && mkdir notebooks dags logs logs/scheduler logs/webserver \
    && pip install apache-airflow==2.5.0

VOLUME ${AIRFLOW_HOME}/dags ${AIRFLOW_HOME}/notebooks

COPY run.sh healthcheck.sh ./

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=1 CMD bash healthcheck.sh

CMD ["bash", "run.sh"]

