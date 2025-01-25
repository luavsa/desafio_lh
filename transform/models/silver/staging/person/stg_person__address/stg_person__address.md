{% docs stg_person__address__description %}
Tabela com informações de endereço residencial de funcionários, clientes e vendedores.
{% enddocs %}

{% docs stg_person__address__address_id %}
Chave primária para registros de endereço.
{% enddocs %}

{% docs stg_person__address__state_province_id %}
Número de identificação único para estado ou província de cada endereço. Este id é usado como Chave estrangeira na tabela state_province.
{% enddocs %}

{% docs stg_person__address__city_name %}
Nome da cidade em que o endereço está situado.
{% enddocs %}