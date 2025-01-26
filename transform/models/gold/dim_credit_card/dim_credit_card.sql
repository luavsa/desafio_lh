with 
    credit_card as (
        select *
        from {{ ref('stg_sales__credit_card') }}
    )

    , joined as (
        select
            credit_card_uid
            , credit_card_id
            , credit_card_type
        from credit_card
    )

select *
from joined
