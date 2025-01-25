with 
    product as (
        select 
            product_uid
            , product_id
            , product_model_id
            , product_subcategory_id
            , product_name
            , product_number
            , product_line
        from {{ ref('stg_production__product') }}
    )

    , model as (
        select
            product_model_id
            , product_model_name
        from {{ ref('stg_production__product_model') }}
    )

    , subcategory as (
        select
            product_subcategory_id
            , product_category_id
            , product_subcategory_name
        from {{ ref('stg_production__product_subcategory') }}
    )

    , category as (
        select
            product_category_id
            , product_category_name
        from {{ ref('stg_production__product_category') }}
    )

    , joined as (
        select
            product.product_uid
            , product.product_id
            , product.product_name
            , product.product_number
            , coalesce(product.product_line, 'unknown') as product_line
            , coalesce(category.product_category_name, 'unknown') as product_category
            , coalesce(subcategory.product_subcategory_name, 'unknown') as product_subcategory
            , coalesce(model.product_model_name, 'unknown') as product_model
        from product
        left join model on product.product_model_id = model.product_model_id
        left join subcategory on product.product_subcategory_id = subcategory.product_subcategory_id
        left join category on subcategory.product_category_id = category.product_category_id
    )

select *
from joined
