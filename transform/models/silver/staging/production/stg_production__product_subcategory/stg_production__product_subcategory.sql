with 
    product_subcategory_source as (
        select
            {{ dbt_utils.generate_surrogate_key(['productsubcategoryid']) }} as product_subcategory_uid
            , {{ dbt_utils.generate_surrogate_key(['productcategoryid']) }} as product_category_uid
            , cast(productsubcategoryid as int) as product_subcategory_id
            , cast(productcategoryid as int) as product_category_id
            , cast(name as varchar) as product_subcategory_name
        from {{ source("aw_production", "productsubcategory") }}
    )

select *
from product_subcategory_source