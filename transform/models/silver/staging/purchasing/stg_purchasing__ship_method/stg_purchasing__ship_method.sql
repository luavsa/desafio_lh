with
   ship_method_source as (
        select
            cast(shipmethodid as int) as pk_ship_method
            , cast(name as varchar) as nm_ship_method
            , cast(shipbase as float) as ship_base
            , cast(shiprate as float) as ship_rate
        from {{ source("aw_purchasing", "shipmethod") }}
    )

select *
from ship_method_source