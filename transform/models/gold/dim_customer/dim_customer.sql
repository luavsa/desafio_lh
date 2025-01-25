with 
    customer as (
        select
            customer_uid
            , person_uid
            , store_uid
            , person_id
            , store_id
        from {{ ref('stg_sales__customer') }}
    )

    , person as (
        select
            person_uid
            , person_type
            , person_name
        from {{ ref('stg_person__person') }}
    )

    , store as (
        select 
            store_uid
            , sales_person_uid
            , store_name
        from {{ ref('stg_sales__store') }}
    )

    , address as (
        select
            entity_address_uid
            , city_name
            , state_province_name
            , country_region_name
        from {{ ref('pivoted_entity_address') }}
    )

    , joined as (
        select
            customer.customer_uid
            , case 
                when customer.store_id is not null then 'store'
                when customer.person_id is not null then 'individual customer'        
              end as customer_type
            , coalesce(store.store_name, person.person_name) as customer_name
            , coalesce(person_address.city_name, store_address.city_name) as city_name
            , coalesce(person_address.state_province_name, store_address.state_province_name) as state_province_name
            , coalesce(person_address.country_region_name, store_address.country_region_name) as country_region_name
        from customer
        left join person on customer.person_uid = person.person_uid
        left join address as person_address on person.person_uid = person_address.entity_address_uid
        left join store on customer.store_uid = store.store_uid
        left join address as store_address on store.store_uid = store_address.entity_address_uid
    )

select *
from joined