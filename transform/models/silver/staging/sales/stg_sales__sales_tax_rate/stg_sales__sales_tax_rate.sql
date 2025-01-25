with
    sales_tax_rate_source as (
        select
            cast(salestaxrateid as int) as pk_sales_tax_rate
            , cast(stateprovinceid as int) as fk_state_province
            , cast(taxtype as int) as tax_type
            , cast(taxrate as float) as tax_rate
            , cast(name as varchar) as nm_tax
        from {{ source("aw_sales", "salestaxrate") }}
    )

select *
from sales_tax_rate_source