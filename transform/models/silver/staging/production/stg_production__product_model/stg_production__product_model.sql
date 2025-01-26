with 
    product_model_source as (
        select
            {{ dbt_utils.generate_surrogate_key(['productmodelid']) }} as product_model_uid
            , cast(productmodelid as int) as product_model_id
            , cast(name as varchar) as product_model_name
        from {{ source("aw_production", "productmodel") }}    
    )

select *
from product_model_source