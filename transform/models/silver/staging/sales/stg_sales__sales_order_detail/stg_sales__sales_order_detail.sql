with 
    sales_order_detail_source as (
            select 
                {{ dbt_utils.generate_surrogate_key(['salesorderdetailid']) }} as sales_order_detail_uid
                , {{ dbt_utils.generate_surrogate_key(['salesorderid']) }} as sales_order_uid
                , {{ dbt_utils.generate_surrogate_key(['productid']) }} as product_uid
                , {{ dbt_utils.generate_surrogate_key(['specialofferid']) }} as special_offer_uid
                , cast(salesorderdetailid as int) as sales_order_detail_id
                , cast(carriertrackingnumber as varchar) as carrier_tracking_number
                , cast(orderqty as int) as order_quantity
                , cast(unitprice as float) as unit_price
                , cast(unitpricediscount as float) as unit_price_discount
            from {{ source('aw_sales', 'salesorderdetail') }}
        )

select *
from sales_order_detail_source