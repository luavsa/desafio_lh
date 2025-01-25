with 
    card as (
        select *
        from {{ ref('stg_sales__credit_card') }}
    )

    , joined as (
        select
            card.credit_card_uid
            , card.credit_card_id
            , card.credit_card_type
        from card
    )

select *
from joined
