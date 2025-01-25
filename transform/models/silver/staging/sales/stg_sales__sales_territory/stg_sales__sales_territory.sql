with 
    sales_territory_source as (
        select
            {{ dbt_utils.generate_surrogate_key(['territoryid']) }} as territory_uid
            , {{ dbt_utils.generate_surrogate_key(['countryregioncode']) }} as country_region_uid
            , cast(territoryid as int) as territory_id
            , cast(countryregioncode as varchar) as country_region_code
            , cast(name as varchar) as territory_name
            , cast("GROUP" as varchar) as territory_group
        from {{ source('aw_sales', 'salesterritory') }}
    )

select *
from sales_territory_source