# import the libraries

from datetime import timedelta
# The DAG object; we'll need this to instantiate a DAG
from airflow import DAG
# Operators; we need this to write tasks!
from airflow.operators.bash_operator import BashOperator
# This makes scheduling easy
from airflow.utils.dates import days_ago


#defining DAG arguments

default_args = {
	'owner': 'Rash Hour',
	'start_date': days_ago(0),
	'email': ['rashhour@gmail.com'],
	'email_on_failure': False,
	'email_on_retry': False,
	'retries': 1,
	'retry_delay': timedelta(minutes=5),
}

# define the DAG
dag = DAG(
	'process_web_log',
	default_args=default_args,
	description='DAG for daily log data',
	schedule_interval=timedelta(days=1),
)

# define the tasks

# define the first task named extract
extract_data = BashOperator(
    task_id='extract_data',
    bash_command='cut -f1 -d" " /home/project/airflow/dags/capstone/accesslog.txt > extracted_data.txt',
    dag=dag,
)

# define the second task named transform
transform_data = BashOperator(
    task_id='transform_data',
    bash_command='grep -o "198.46.149.143" /home/project/airflow/dags/capstone/extracted_data.txt > transformed_data.txt',
    dag=dag,
)

# define the third task named load
load_data = BashOperator(
    task_id='load_data',
    bash_command='tar -cvf weblog.tar /home/project/airflow/dags/capstone/transformed_data.txt',
    dag=dag,
)

# task pipeline

extract_data >> transform_data >> load_data



