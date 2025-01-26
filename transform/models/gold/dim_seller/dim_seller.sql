with
    sales_person as (
        select
            sales_person_uid
            , territory_uid
        from {{ ref('stg_sales__sales_person') }}

    )

    , person as (
        select
            person_uid
            , person_name
        from {{ ref('stg_person__person') }}
    )

    , employee as (
        select
            employee_uid
            , job_title
            , hire_date
        from {{ ref('stg_human_resources__employee') }}
    )

    , joined as (
        select
            sales_person.sales_person_uid as seller_uid
            , person.person_name as seller_name
            , employee.job_title
            , employee.hire_date
        from sales_person
        left join person on sales_person.sales_person_uid = person.person_uid
        left join employee on sales_person.sales_person_uid = employee.employee_uid
    )

select *
from joined