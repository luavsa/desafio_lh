with 
    sales_person_source as (
        select 
            {{ dbt_utils.generate_surrogate_key(['businessentityid']) }} as sales_person_uid
            , cast(territoryid as int) as fk_territory
            , cast(salesquota as int) as sales_quota
            , cast(bonus as int) as bonus
            , cast(commissionpct as float) as comission_pct
            , cast(salesytd as float) as sales_ytd
            , cast(saleslastyear as float) as sales_last_year
        from {{ source('aw_sales', 'salesperson') }}
    )

select *
from sales_person_source