# [docker-airflow-datascience](https://github.com/iKunalChhabra/docker-airflow-datascience)

[Docker image](https://hub.docker.com/r/ikunalchhabra/airflow-datascience) with airflow and data science tools.

This image is for development purpose only, not to be used in production.

### Steps to run:

#### Docker Compose:

- `git clone https://github.com/iKunalChhabra/docker-airflow-datascience.git`
- `cd docker-airflow-datascience`
- `mkdir dags`
- `docker compose up -d` to run the container
- `docker compose down` to stop the container

#### Docker command line:

`docker container run -d --rm --name airflow-datascience -p 8080:8080 -p 8888:8888 -v $(pwd)/dags:/airflow/dags -v $(pwd)/notebooks:/airflow/notebooks ikunalchhabra/airflow-datascience:latest`

### Base Image

`continuumio/anaconda3`

### Default Ports:

- `8080` for airflow webserver
- `8888` for jupyter lab

### Volumes :

- `/airflow/dags`

### Environment variables

- `AIRFLOW_HOME` `[default=/airflow]`
- `SHELL` `[default=/bin/bash]`
- `AIRFLOW_USER` `[default=admin]`
- `AIRFLOW_USER_FIRSTNAME` `[default=admin]`
- `AIRFLOW_USER_LASTNAME` `[default=admin]`
- `AIRFLOW_USER_EMAIL` `[default=admin@admin.com]`
- `AIRFLOW_PASSWORD` `[default=admin]`
- `AIRFLOW_WEB_PORT` `[default=8080]`
- `JUPYTER_PORT` `[default=8888]`

Pull requests currently are not accepted.
Please create an issue if required.

Feel free to reach out to me over email incase of any questions.
