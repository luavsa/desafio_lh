with 
    country_region_source as (
        select
            {{ dbt_utils.generate_surrogate_key([
                'countryregioncode'
            ]) }} as country_region_uid
            , cast(countryregioncode as varchar) as country_region_code
            , cast(name as varchar) as country_region_name
        from {{ source("aw_person", "countryregion") }}
    )

select *
from country_region_source