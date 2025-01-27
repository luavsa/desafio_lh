# Projeto de Dados Adventure Works

## Resumo do Projeto
Este projeto tem como objetivo otimizar a capacidade analítica da Adventure Works, implementando uma plataforma de dados alinhada à metodologia do **Modern Data Stack**. Utilizamos ferramentas modernas para extrair, transformar e carregar dados, além de criar modelos analíticos e preditivos que apoiam a tomada de decisões estratégicas e operacionais.

## Ferramentas Utilizadas
- **Snowflake**: [Data Warehouse](UPWZUSV-KGA83012.snowflakecomputing.com/)
- **Power BI**: [Dashboard Publicado](https://powerbi.microsoft.com/)

## Documentação completa do projeto:
- **Google Docs**: [Documentação Oficial do Projeto](https://docs.google.com/document/d/1kCUOuAsw38e6qdeVEnur4Jd5EfS6kBnRlHRVm5C4u7A/edit?usp=sharing/)

## Outros links úteis
- **Meltano**: [Documentação](https://docs.meltano.com/)
- **dbt (Data Build Tool)**: [Documentação](https://docs.getdbt.com/)
- **Apache Airflow**: [Documentação](https://airflow.apache.org/docs/)
- **Statsmodels e StatsForecast** (para análises preditivas no Snowflake): [Statsmodels](https://www.statsmodels.org/) | [StatsForecast](https://nixtla.github.io/statsforecast/)


## Passo a Passo para Iniciar o Projeto
1. **Clone o repositório**:
   ```bash
   git clone <url-do-repositorio>
   cd <nome-do-repositorio>
   ```

2. **Configure o Ambiente Virtual**:
   
   Na pasta `extract`, crie e ative um ambiente virtual para o Meltano:

     ```bash
     python -m venv .venv-meltano
     source .venv-meltano/bin/activate
     pip install meltano
     meltano init
     ```

   Na pasta `transform`, crie e ative um ambiente virtual para o dbt, faça o mesmo na pasta orchestrate, criando uma venv separada para o Airflow.


3. **Configure Variáveis de Ambiente**: adicione as credenciais no arquivo `.env` local, contendo configurações para Snowflake e PostgreSQL. Em seguida, execute o comando source .env

4. **Instale os Conectores Meltano**:
   ```bash
   meltano add extractor tap-postgres
   meltano add loader target-snowflake
   ```

5. **Valide as Conexões**

    - **PostgreSQL**:
    ```bash
    meltano run tap-postgres
    ```
    
    - **Snowflake**:
    ```bash
    meltano run target-snowflake
    ```

     - **dbt**:
    ```bash
    dbt debug
    ```

6. **Inicie o Apache Airflow**
    - Configure e execute o servidor Airflow localmente:
    ```bash
    airflow standalone
    ```

7. **Acesse os Dashboards no Power BI**
    - Conecte-se ao Snowflake para acessar relatórios e insights.

## Boas Práticas Aplicadas
- **Uso de variáveis de ambiente no arquivo `.env`** para garantir segurança e flexibilidade.

- **Documentação automatizada de modelos no dbt** e persistência no Snowflake com `persist_docs`.

- **Testes de qualidade no dbt** (schema, valores nulos e duplicados) para garantir a integridade dos dados.

- **Organização modular do código**, separando as camadas de modelagem em Bronze, Silver e Gold.

- **Rastreamento de versões e métricas de modelos preditivos** com MLflow.

- **Filtros interativos nos dashboards** para personalização das análises.