with 
    sales_reason_source as (
        select 
            {{ dbt_utils.generate_surrogate_key(['salesreasonid']) }} as sales_reason_uid
            , cast(salesreasonid as varchar) as sales_reason_id
            , cast(name as varchar) as sales_reason_name
            , cast(reasontype as varchar) as sales_reason_type
        from {{ source('aw_sales', 'salesreason') }}
    )

select *
from sales_reason_source