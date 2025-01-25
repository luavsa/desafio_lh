with 
    product_model_source as (
        select
            cast(productmodelid as int) as product_model_id
            , cast(name as varchar) as product_model_name
        from {{ source("aw_production", "productmodel") }}    
    )

select *
from product_model_source