with 
    sales_order_header_sales_reason_source as (
       select 
           {{ dbt_utils.generate_surrogate_key(['salesorderid']) }} as sales_order_uid
           , {{ dbt_utils.generate_surrogate_key(['salesreasonid']) }} as sales_reason_uid
       from {{ source('aw_sales', 'salesorderheadersalesreason') }}
   )

select *
from sales_order_header_sales_reason_source