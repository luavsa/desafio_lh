with 
    person_credit_card_source as (
        select 
            cast(businessentityid as int) as pk_business_entity
            , cast(creditcardid as int) as fk_credit_card
        from {{ source('aw_sales', 'personcreditcard') }}
    )

select *
from person_credit_card_source