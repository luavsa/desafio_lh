with 
    state_province_source as (
        select
            {{ dbt_utils.generate_surrogate_key(['stateprovinceid']) }} as state_province_uid
            , {{ dbt_utils.generate_surrogate_key(['territoryid']) }} as territory_uid
            , {{ dbt_utils.generate_surrogate_key(['countryregioncode']) }} as country_region_uid
            , cast(stateprovinceid as int) as state_province_id
            , cast(territoryid as int) as territory_id
            , cast(stateprovincecode as varchar) as state_province_code
            , cast(name as varchar) as state_province_name
        from {{ source("aw_person", "stateprovince") }}
    )

select *
from state_province_source