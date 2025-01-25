with
    territory as (
        select *
        from {{ ref('dim_territory') }}
    )

    , sales as (
        select *
        from {{ ref('fct_sales') }}
    )

    , agregated as (
        select
            territory.territory_uid
            , territory.territory_name
            , territory.territory_group
            , count(distinct sales.order_uid) as total_orders
            , sum(sales.total_value) as total_value
        from sales
        left join territory on sales.territory_uid = territory.territory_uid
        group by 1, 2, 3
    )

select *
from agregated