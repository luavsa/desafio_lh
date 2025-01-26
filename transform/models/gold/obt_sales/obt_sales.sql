with sales as (
        select
            order_uid
            , sales_order_detail_uid
            , customer_uid
            , seller_uid
            , territory_uid
            , credit_card_uid
            , product_uid
            , order_date
            , due_date
            , ship_date
            , sales_reason_name
            , order_quantity
            , unit_price
            , unit_price_discount
            , total_value
        from {{ ref('fct_sales') }}   
    )

    , customer as (
        select
            customer_uid	
            , customer_type	
            , customer_name
        from {{ ref('dim_customer') }}
    )

    , territory as (
        select
            territory_uid
            , territory_group
            , territory_name
            , country_region_code
        from {{ ref('dim_territory') }}
    )
    , seller as (
        select
            seller_uid
            , seller_name
            , job_title
            , hire_date
        from {{ ref('dim_seller') }}
    )
    , product as (
        select
            product_uid
            , product_name
            , product_number
            , product_line
            , product_category
            , product_subcategory
            , product_model
        from {{ ref('dim_product') }}

    )
    , payment as (
        select
            credit_card_uid
            , credit_card_type
        from {{ ref('dim_credit_card') }}
    )

    , final as (
        select
            sales.order_uid
            , sales.sales_order_detail_uid
            , sales.order_date
            , sales.due_date
            , sales.ship_date
            , sales.sales_reason_name
            , sales.order_quantity
            , sales.unit_price
            , sales.unit_price_discount
            , sales.total_value
            , customer.customer_type	
            , customer.customer_name
            , territory.territory_group
            , territory.territory_name
            , territory.country_region_code
            , seller.seller_name
            , seller.job_title
            , seller.hire_date
            , product.product_name
            , product.product_number
            , product.product_line
            , product.product_category
            , product.product_subcategory
            , product.product_model
            , payment.credit_card_type
        from sales
        left join customer on sales.customer_uid = customer.customer_uid
        left join territory on sales.territory_uid = territory.territory_uid
        left join seller on sales.seller_uid = seller.seller_uid
        left join product on sales.product_uid = product.product_uid
        left join payment on sales.credit_card_uid = payment.credit_card_uid
    )

select *
from final