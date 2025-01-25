{% docs stg_sales__country_region_currency__description %}
Tabela de referência cruzada mapeando códigos de moeda ISO para um país ou região.
{% enddocs %}

{% docs stg_sales__country_region_currency__pk_country_currency %}
Código ISO para países e regiões. Chave estrangeira para CountryRegion.CountryRegionCode.
{% enddocs %}

{% docs stg_sales__country_region_currency__fk_currency %}
Código de moeda padrão ISO. Chave estrangeira para Currency.CurrencyCode.
{% enddocs %}
