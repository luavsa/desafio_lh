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

MELTANO_PROJECT_DIR = "/home/luavsa/desafio_lh/extract/aw_postgres"
MELTANO_VENV = "/home/luavsa/desafio_lh/extract/.venv-meltano/bin/activate"

with DAG(
    dag_id='extract',
    default_args=default_args,
    description='Extração dos dados no banco postgres e carregamento no schema raw do Snowflake',
    schedule_interval='@daily',
    start_date=datetime(2025, 1, 1),
    catchup=False,
) as dag:

    extract_task = BashOperator(
        task_id='meltano_extract',
        bash_command=f"""
        source {MELTANO_VENV} && \
        cd {MELTANO_PROJECT_DIR} && \
        meltano run tap-postgres target-snowflake
        """,
    )

    extract_task