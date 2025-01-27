from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'luavsa',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

with DAG(
    dag_id='transform',
    default_args=default_args,
    description='Orquestrar dbt no Snowflake usando Airflow',
    schedule_interval='@daily',
    start_date=datetime(2025, 1, 1),
    catchup=False,
) as dag:

    dbt_run = BashOperator(
        task_id='dbt_run',
        bash_command=(
            "source /home/luavsa/desafio_lh/transform/.venv/bin/activate && "
            "dbt run --project-dir /home/luavsa/desafio_lh/transform "
            "--profiles-dir /home/luavsa/desafio_lh/transform"
        ),
    )

    dbt_test = BashOperator(
        task_id='dbt_test',
        bash_command=(
            "source /home/luavsa/desafio_lh/transform/.venv/bin/activate && "
            "dbt test --project-dir /home/luavsa/desafio_lh/transform "
            "--profiles-dir /home/luavsa/desafio_lh/transform"
        ),
    )

    dbt_run >> dbt_test