{% docs stg_sales__sales_order_header__description %}
Tabela com informações gerais sobre pedidos de vendas.
{% enddocs %}

{% docs stg_sales__sales_order_header__pk_sales_order %}
Chave primária para registros de pedidos de venda. Usada como chave estrangeira para relacionar registros na tabela order_detail.
{% enddocs %}

{% docs stg_sales__sales_order_header__fk_territory %}
Código do território em que a venda foi feita. Chave estrangeira que referencia a tabela territory.
{% enddocs %}

{% docs stg_sales__sales_order_header__fk_customer %}
Número de identificação do cliente. Chave estrangeira que referencia a tabela customer.
{% enddocs %}

{% docs stg_sales__sales_order_header__fk_bill_address %}
Código para o endereço de cobrança do cliente. Chave estrangeira que referencia a tabela address.
{% enddocs %}

{% docs stg_sales__sales_order_header__fk_ship_address %}
Código para o endereço de entregs do pedido. Chave estrangeira que referencia a tabela address.
{% enddocs %}

{% docs stg_sales__sales_order_header__fk_ship_method %}
Código para o método de entrega do pedido. Chave estrangeira que referencia a tabela ship_method.
{% enddocs %}

{% docs stg_sales__sales_order_header__fk_credit_card %}
Número de identificação do cartão de crédito. Chave estrangeira que referencia a tabela credit_card.
{% enddocs %}

{% docs stg_sales__sales_order_header__fk_currency_rate %}
Taxa de câmbio usada. Chave estrangeira para currency_rate
{% enddocs %}

{% docs stg_sales__sales_order_header__revision_number %}
Número incremental para rastrear alterações no pedido de vendas ao longo do tempo.
{% enddocs %}

{% docs stg_sales__sales_order_header__order_date %}
Data em que o pedido de venda foi criado.
{% enddocs %}

{% docs stg_sales__sales_order_header__due_date %}
Data em que o pedido deve ser entregue ao cliente.
{% enddocs %}

{% docs stg_sales__sales_order_header__ship_date %}
Data em que o pedido foi enviado ao cliente.
{% enddocs %}

{% docs stg_sales__sales_order_header__status %}
Status atual do pedido. 1 = Em processamento; 2 = Aprovado; 3 = Em espera; 4 = Rejeitado; 5 = Enviado; 6 = Cancelado
{% enddocs %}

{% docs stg_sales__sales_order_header__online_order_flag %}
0 = Pedido feito pelo vendedor. 1 = Pedido feito on-line pelo cliente.
{% enddocs %}

{% docs stg_sales__sales_order_header__purchase_order_number %}
Número de identificação exclusivo do pedido de venda.
{% enddocs %}

{% docs stg_sales__sales_order_header__order_subtotal %}
Vendas subtotais. Calculado como SUM(SalesOrderDetail.LineTotal)para o SalesOrderID apropriado.
{% enddocs %}

{% docs stg_sales__sales_order_header__order_tax_mt %}
Valor do imposto.
{% enddocs %}

{% docs stg_sales__sales_order_header__order_freight %}
Custo do envio.
{% enddocs %}

{% docs stg_sales__sales_order_header__order_total_due %}
Total devido pelo cliente. Calculado como Subtotal + TaxAmt + Frete.
{% enddocs %}