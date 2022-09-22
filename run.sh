airflow db init
airflow users create --username admin --firstname admin --lastname admin --role Admin --email admin@admin.com --password admin
airflow scheduler &
airflow webserver -p 8080 &
jupyter lab --port 8888 --no-browser --notebook-dir=/airflow/notebooks --allow-root --ip=* --NotebookApp.token='' --NotebookApp.password=''
