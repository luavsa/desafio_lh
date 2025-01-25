with
    seller as (
        select * 
        from {{ ref('dim_seller') }}
    )

    , sales as (
        select *
        from {{ ref('fct_sales') }}
    )

    , agregated as (
        select
            seller.seller_uid
            , seller.seller_name
            , seller.job_title
            , count(distinct sales.order_uid) as total_orders
            , sum(sales.total_value) as total_value
        from sales
        inner join seller on seller.seller_uid = sales.seller_uid
        group by 1, 2, 3
    )

select *
from agregated