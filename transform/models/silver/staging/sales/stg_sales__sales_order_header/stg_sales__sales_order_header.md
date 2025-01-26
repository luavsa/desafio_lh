{% docs stg_sales__sales_order_header__description %}
Tabela com informações gerais sobre pedidos de vendas.
{% enddocs %}

{% docs stg_sales__sales_order_header__sales_order_uid %}
Identificador universal do pedido de venda.
{% enddocs %}

{% docs stg_sales__sales_order_header__sales_person_uid %}
Identificador universal do vendedor.
{% enddocs %}

{% docs stg_sales__sales_order_header__territory_uid %}
Identificador universal do território.
{% enddocs %}

{% docs stg_sales__sales_order_header__customer_uid %}
Identificador universal do cliente.
{% enddocs %}

{% docs stg_sales__sales_order_header__bill_address_uid %}
Identificador universal do endereço de faturamento.
{% enddocs %}

{% docs stg_sales__sales_order_header__ship_address_uid %}
Identificador universal do endereço de entrega.
{% enddocs %}

{% docs stg_sales__sales_order_header__ship_method_uid %}
Identificador universal do método de entrega do pedido.
{% enddocs %}

{% docs stg_sales__sales_order_header__credit_card_uid %}
Identificador universal do cartão de crédito.
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

{% docs stg_sales__sales_order_header__status_code %}
Código do status do pedido. 1 = Em processamento; 2 = Aprovado; 3 = Em espera; 4 = Rejeitado; 5 = Enviado; 6 = Cancelado
{% enddocs %}

{% docs stg_sales__sales_order_header__online_order_flag %}
0 = Pedido feito pelo vendedor. 1 = Pedido feito on-line pelo cliente.
{% enddocs %}

{% docs stg_sales__sales_order_header__purchase_order_number %}
Número de identificação exclusivo do pedido de venda.
{% enddocs %}

{% docs stg_sales__sales_order_header__order_subtotal %}
Vendas subtotais.
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