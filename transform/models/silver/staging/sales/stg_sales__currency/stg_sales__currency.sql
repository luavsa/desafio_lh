with 
    currency_source as (
        select 
            cast(currencycode as varchar) as pk_currency
            , cast(name as varchar) as currency_name
        from {{ source('aw_sales', 'currency') }}
    )

select *
from currency_source