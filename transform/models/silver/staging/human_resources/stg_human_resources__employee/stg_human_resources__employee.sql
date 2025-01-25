with
   employee_source as (
        select
            {{ dbt_utils.generate_surrogate_key(['businessentityid']) }} as employee_uid
            , cast(nationalidnumber as int) as national_number
            , cast(jobtitle as varchar) as job_title
            , cast(birthdate as date) as birth_date
            , case
                when maritalstatus = 'S' then 'single'
                else 'married'
            end as maritial_status
            , case
                when gender = 'F' then 'female'
                else 'male'
            end as gender
            , cast(hiredate as date) as hire_date
        from {{ source("aw_humanresources", "employee") }}
    )

select *
from employee_source