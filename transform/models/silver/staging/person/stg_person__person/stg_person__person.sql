with 
    person_source as (     
        select
            cast(businessentityid as int) as person_id
            , cast(persontype as varchar) as person_type
            , cast(coalesce(firstname, '') as varchar) as first_name
            , cast(coalesce(middlename, '') as varchar) as middle_name
            , cast(coalesce(lastname, '') as varchar) as last_name
        from {{ source("aw_person", "person") }}
    )

    , person as (
        select 
            {{ dbt_utils.generate_surrogate_key(['person_id']) }} as person_uid
            , case person_type
                when 'sc' then 'store contact'
                when 'in' then 'individual customer'
                when 'sp' then 'sales person'
                when 'em' then 'employee'
                when 'vc' then 'vendor contact'
                when 'gc' then 'general contact'
            end as person_type
            , trim(concat(first_name, ' ', middle_name, ' ', last_name)) as person_name
        from person_source
    )

select *
from person
