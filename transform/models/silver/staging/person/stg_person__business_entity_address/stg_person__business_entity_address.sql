with 
    business_entity_address_source as (
        select
            {{ dbt_utils.generate_surrogate_key(['businessentityid']) }} as entity_address_uid
            , {{ dbt_utils.generate_surrogate_key(['addressid']) }} as address_uid
            , cast(businessentityid as int) as entity_address_id
            , cast(coalesce(addressid, 0) as int) as address_id
            , cast(addresstypeid as int) as address_type_id
        from {{ source("aw_person", "businessentityaddress") }}
    )

select *
from business_entity_address_source