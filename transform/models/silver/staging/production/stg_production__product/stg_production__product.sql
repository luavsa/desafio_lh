with 
    product_source as (
        select
            {{ dbt_utils.generate_surrogate_key(['productid']) }} as product_uid
            , cast(productid as int) as product_id
            , cast(productmodelid as int) as product_model_id
            , cast(productsubcategoryid as int) as product_subcategory_id
            , cast(name as varchar) as product_name
            , cast(productnumber as varchar) as product_number
            , cast(productline as varchar) as product_line
        from {{ source("aw_production", "product") }}        
    )

select *
from product_source