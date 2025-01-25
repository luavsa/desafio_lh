with 
    currency_rate_source as (
        select 
            cast(currencyrateid as int) as pk_currency_rate_id
            , cast(currencyratedate as varchar) as currency_rate_dt
            , cast(fromcurrencycode as varchar) as from_currency_code
            , cast(tocurrencycode as varchar) as to_currency_code
            , cast(averagerate as float) as average_rate
            , cast(endofdayrate as float) as end_of_day_rate
            , cast(modifieddate as varchar) as currency_rate_modified_dt
        from {{ source('aw_sales', 'currencyrate') }}
    )

select *
from currency_rate_source