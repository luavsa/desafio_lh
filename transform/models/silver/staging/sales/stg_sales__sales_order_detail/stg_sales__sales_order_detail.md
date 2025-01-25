{% docs stg_sales__sales_order_detail__description %}
Produtos individuais associados a um pedido de vendas específico. 
{% enddocs %}

{% docs stg_sales__sales_order_detail__pk_sales_order_detail %}
Chave primária. Um número único incremental por produto vendido.
{% enddocs %}

{% docs stg_sales__sales_order_detail__fk_sales_order %}
Chave estrangeira para sales_order_header.
{% enddocs %}

{% docs stg_sales__sales_order_detail__carrier_tracking_number %}
Número de rastreamento da remessa fornecido pelo remetente.
{% enddocs %}

{% docs stg_sales__sales_order_detail__order_quantity %}
Quantidade pedida por produto.
{% enddocs %}

{% docs stg_sales__sales_order_detail__fk_product %}
Produto vendido ao cliente. Chave estrangeira para product
{% enddocs %}

{% docs stg_sales__sales_order_detail__fk_special_offer %}
Código promocional. Chave estrangeira para SpecialOffer.
{% enddocs %}

{% docs stg_sales__sales_order_detail__unit_price %}
Preço de venda de um único produto.
{% enddocs %}

{% docs stg_sales__sales_order_detail__unit_price_discount %}
Valor do desconto.
{% enddocs %}
