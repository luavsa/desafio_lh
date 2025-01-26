with 
    product_category_source as (
        select
            {{ dbt_utils.generate_surrogate_key(['productcategoryid']) }} as product_category_uid
            , cast(productcategoryid as varchar) as product_category_id
            , cast(name as varchar) as product_category_name
        from {{ source("aw_production", "productcategory") }}      
    )

select *
from product_category_source