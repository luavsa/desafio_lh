with 
    sales_person_source as (
        select 
            {{ dbt_utils.generate_surrogate_key(['businessentityid']) }} as sales_person_uid
            , {{ dbt_utils.generate_surrogate_key(['territoryid']) }} as territory_uid
        from {{ source('aw_sales', 'salesperson') }}
    )

select *
from sales_person_source