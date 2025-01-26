with 
    business_entity_address as (
        select
            entity_address_uid
            , entity_address_id
            , address_uid
            , address_type_id
            , address_type_id as address_type
        from {{ ref('stg_person__business_entity_address') }}
    )

    , person_address as (
        select
            address_uid
            , state_province_uid
            , city_name
        from {{ ref('stg_person__address') }}
    )

    , state_province as (
        select
            country_region_uid
            , state_province_uid
            , state_province_name
        from {{ ref('stg_person__state_province') }}
    )

    , country as (
        select
            country_region_uid
            , country_region_name
        from {{ ref('stg_person__country_region') }}
    )

    , entity_address as (
        select
            entity_address_uid
            , entity_address_id
            , address_type_id
            , "1" as billing_address_uid
            , "2" as home_address_uid
            , "3" as office_address_uid
            , "4" as primary_address_uid
            , "5" as shipping_address_uid
            , "6" as archive_address_uid
        from business_entity_address
        pivot (max(address_uid) for address_type in (1, 2, 3, 4, 5, 6))
    )

    , first_address AS (
        select
            entity_address_uid
            , min(address_type_id) as address_type_id
        from business_entity_address
        group by 1
    )

    , full_address as (
        select
            person_address.address_uid
            , person_address.city_name
            , state_province.state_province_name
            , country.country_region_name
        from person_address 
        left join state_province on person_address.state_province_uid = state_province.state_province_uid
        left join country on state_province.country_region_uid = country.country_region_uid
    )

    , joined as (
        select distinct
            entity_address.entity_address_uid
            , entity_address.entity_address_id
            , entity_address.address_type_id
            , coalesce(home.city_name, office.city_name, shipping.city_name) as city_name
            , coalesce(home.state_province_name, office.state_province_name, shipping.state_province_name) as state_province_name
            , coalesce(home.country_region_name, office.country_region_name, shipping.country_region_name) as country_region_name
        from entity_address
        inner join first_address on
            entity_address.entity_address_uid = first_address.entity_address_uid
            and entity_address.address_type_id = first_address.address_type_id
        left join full_address as home on entity_address.home_address_uid = home.address_uid
        left join full_address as office on entity_address.office_address_uid = office.address_uid
        left join full_address as shipping on entity_address.shipping_address_uid = shipping.address_uid
    )

select *
from joined
