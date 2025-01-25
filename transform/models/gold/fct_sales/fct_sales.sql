with 
    sales as (
        select *
        from {{ ref('stg_sales__sales_order_header') }}
    )

    , sales_detail as (
        select *
        from {{ ref('stg_sales__sales_order_detail') }}
    )

    , sales_reason_header as (
        select *
        from {{ ref('stg_sales__sales_order_header_sales_reason') }}
    )

    , sales_reason as (
        select *
        from {{ ref('stg_sales__sales_reason') }}
    )
    
    , reason as (
        select
            sales_reason_header.sales_order_uid,
            array_agg(distinct sales_reason.sales_reason_type) AS sales_reason_type
        from sales_reason_header
        left join sales_reason on sales_reason_header.sales_reason_uid = sales_reason.sales_reason_uid
        group by 1
    )

    , joined as (
        select
            sales.sales_order_uid as order_uid
            , sales_detail.sales_order_detail_uid
            , sales.customer_uid
            , sales.sales_person_uid as seller_uid
            , sales.territory_uid
            , sales.credit_card_uid
            , sales_detail.product_uid
            , sales.order_date
            , sales.due_date
            , sales.ship_date
            , case
                when sales.status = 1 then 'in process'
                when sales.status = 2 then 'approved'
                when sales.status = 3 then 'backordered'
                when sales.status = 4 then 'rejected'
                when sales.status = 5 then 'shipped'
                when sales.status = 6 then 'cancelled'
              end as status
            , reason.sales_reason_type
            , sales_detail.order_quantity
            , sales_detail.unit_price
            , sales_detail.unit_price_discount
            , (sales_detail.order_quantity * (sales_detail.unit_price * (1 - sales_detail.unit_price_discount))) as total_value
        from sales
        left join sales_detail on sales.sales_order_uid = sales_detail.sales_order_uid
        left join reason on sales.sales_order_uid = reason.sales_order_uid
    )

select *
from joined