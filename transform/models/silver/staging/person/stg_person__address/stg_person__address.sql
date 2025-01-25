with 
    address_source as (
        select
            {{ dbt_utils.generate_surrogate_key(['addressid']) }} as address_uid
            , {{ dbt_utils.generate_surrogate_key(['stateprovinceid']) }} as state_province_uid
            , cast(addressid as int) as address_id
            , cast(stateprovinceid as int) as state_province_id
            , cast(city as varchar) as city_name
        from {{ source("aw_person", "address") }}
    )

select *
from address_source
