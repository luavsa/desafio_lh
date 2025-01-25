with 
    store_source as (
        select 
            {{ dbt_utils.generate_surrogate_key(['businessentityid']) }} as store_uid
            , {{ dbt_utils.generate_surrogate_key(['salespersonid']) }} as sales_person_uid
            , cast(businessentityid as int) as store_id
            , cast(salespersonid as int) as sales_person_id
            , cast(name as string) as store_name        
        from {{ source('aw_sales', 'store') }}
    )

select *
from store_source