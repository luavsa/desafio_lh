with 
    customer_source as (
        select 
            {{ dbt_utils.generate_surrogate_key(['customerid']) }} as customer_uid
            , {{ dbt_utils.generate_surrogate_key(['personid']) }} as person_uid
            , {{ dbt_utils.generate_surrogate_key(['storeid']) }} as store_uid
            , {{ dbt_utils.generate_surrogate_key(['territoryid']) }} as territory_uid
            , cast(customerid as int) as customer_id
            , cast(personid as int) as person_id
            , cast(storeid as int) as store_id
            , cast(territoryid as int) as territory_id
        from {{ source('aw_sales', 'customer') }}      
    )

select *
from customer_source