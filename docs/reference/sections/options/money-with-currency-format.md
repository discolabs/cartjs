*String (default: `null`)*

Specifies the formatting to be used when rendering money amounts with currencies through elements marked up with `data-cart-render` or via the DOM Bindings.

You can use Liquid to render the appropriate format from the shop's settings, for example:

{% raw %}
```html
<script type="text/javascript">
    $(function() {
        CartJS.init({{ cart | json }}, {
            "moneyFormat": {{ shop.money_format }},
            "moneyWithCurrencyFormat": {{ shop.money_with_currency_format }}
        });
    });
</script>
```
{% endraw %}
