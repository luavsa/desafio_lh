with 
    sales_order_header_source as (
        select 
            {{ dbt_utils.generate_surrogate_key(['salesorderid']) }} as sales_order_uid
            , {{ dbt_utils.generate_surrogate_key(['salespersonid']) }} as sales_person_uid
            , {{ dbt_utils.generate_surrogate_key(['territoryid']) }} as territory_uid
            , {{ dbt_utils.generate_surrogate_key(['customerid']) }} as customer_uid
            , {{ dbt_utils.generate_surrogate_key(['billtoaddressid']) }} as bill_address_uid
            , {{ dbt_utils.generate_surrogate_key(['shiptoaddressid']) }} as ship_address_uid
            , {{ dbt_utils.generate_surrogate_key(['shipmethodid']) }} as ship_method_uid
            , {{ dbt_utils.generate_surrogate_key(['creditcardid']) }} as credit_card_uid
            , {{ dbt_utils.generate_surrogate_key(['currencyrateid']) }} as currency_rate_uid
            , cast(salesorderid as int) as sales_order_id
            , cast(salespersonid as int) as sales_person_id
            , cast(territoryid as int) as territory_id
            , cast(customerid as int) as customer_id
            , cast(billtoaddressid as int) as bill_address_id
            , cast(shiptoaddressid as int) as ship_address_id
            , cast(shipmethodid as int) as ship_method_id
            , cast(creditcardid as int) as credit_card_id
            , cast(currencyrateid as varchar) as currency_rate_id
            , cast(revisionnumber as int) as revision_number
            , cast(orderdate as date) as order_date
            , cast(duedate as date) as due_date
            , cast(shipdate as date) as ship_date
            , cast(status as int) as status
            , cast(onlineorderflag as boolean) as online_order_flag
            , cast(purchaseordernumber as varchar) as purchase_order_number
            , cast(subtotal as float) as order_subtotal
            , cast(taxamt as float) as order_tax_mt
            , cast(freight as float) as order_freight
            , cast(totaldue as float) as order_total_due
        from {{ source('aw_sales', 'salesorderheader') }}
    )

select *
from sales_order_header_source