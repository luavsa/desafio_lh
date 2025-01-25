with 
  credit_card_source as (
    select 
      {{ dbt_utils.generate_surrogate_key(['creditcardid']) }} as credit_card_uid
      , cast(creditcardid as int) as credit_card_id
      , cast(cardtype as varchar) as credit_card_type
    from {{ source('aw_sales', 'creditcard') }}
  )
  
select *
from credit_card_source