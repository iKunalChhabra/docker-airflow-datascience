# Initialize the database
airflow db init

# Create the user
airflow users create --username $AIRFLOW_USER \
                     --firstname $AIRFLOW_USER_FIRSTNAME \
                     --lastname $AIRFLOW_USER_LASTNAME \
                     --role Admin \
                     --email $AIRFLOW_USER_EMAIL \
                     --password $AIRFLOW_PASSWORD

# Start the scheduler
airflow scheduler -D \
    -l $AIRFLOW_HOME/logs/scheduler/airflow-scheduler.log \
    --pid $AIRFLOW_HOME/logs/scheduler/airflow-scheduler.pid \
    --stderr $AIRFLOW_HOME/logs/scheduler/airflow-scheduler.stderr \
    --stdout $AIRFLOW_HOME/logs/scheduler/airflow-scheduler.stdout &

# Start the webserver on port 8080
airflow webserver -D \
    --port $AIRFLOW_WEB_PORT \
    -A $AIRFLOW_HOME/logs/webserver/airflow-webserver.out \
    -E $AIRFLOW_HOME/logs/webserver/airflow-webserver.err \
    -l $AIRFLOW_HOME/logs/webserver/airflow-webserver.log \
    --pid $AIRFLOW_HOME/logs/webserver/airflow-webserver.pid \
    --stderr $AIRFLOW_HOME/logs/webserver/airflow-webserver.stderr \
    --stdout $AIRFLOW_HOME/logs/webserver/airflow-webserver.stdout &

# Start jupyter lab on port 8888
jupyter lab --port $JUPYTER_PORT \
            --no-browser \
            --notebook-dir=/airflow/notebooks \
            --allow-root \
            --ip=* \
            --NotebookApp.token='' \
            --NotebookApp.password=''
