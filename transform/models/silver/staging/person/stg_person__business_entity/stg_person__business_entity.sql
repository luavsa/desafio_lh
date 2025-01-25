with 
    business_entity_source as (
        select 
            {{ dbt_utils.generate_surrogate_key(['businessentityid']) }} as business_entity_uid
            , cast(businessentityid as int) as business_entity_id
        from {{ source("aw_person", "businessentity") }}
    )

select *
from business_entity_source
