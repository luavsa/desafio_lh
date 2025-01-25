with
    territory as (
        select
            territory_uid
            , territory_id
            , territory_group
            , territory_name
            , country_region_code
        from {{ ref('stg_sales__sales_territory') }}
    )

    , final as (
        select distinct
            territory_uid
            , territory_id
            , territory_group
            , territory_name
            , country_region_code
        from territory
    )

select *
from final