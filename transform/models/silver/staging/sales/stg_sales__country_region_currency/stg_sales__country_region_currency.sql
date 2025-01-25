with
    country_region_currency_source as (
        select
            cast(countryregioncode as varchar) as pk_country_currency
            , cast(currencycode as varchar) as fk_currency
        from {{ source("aw_sales", "countryregioncurrency") }}
    )

select *
from country_region_currency_source