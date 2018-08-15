*String (default: `null`)*

Specifies the formatting to be used when rendering money amounts through elements marked up with `data-cart-render` or via the DOM Bindings.

You can use Liquid to render the appropriate format from the shop's settings, for example:

{% raw %}
```html
<script type="text/javascript">
    $(function() {
        CartJS.init({{ cart | json }}, {
            "moneyFormat": "{{ shop.money_format }}",
            "moneyWithCurrencyFormat": "{{ shop.money_with_currency_format }}"
        });
    });
</script>
```
{% endraw %}

When using money formatting options, don't forget to include Shopify's `option_selection.js` on all pages.
See the note "[Dependency when formatting monetary values][]" in the Guide for more detail.

[Dependency when formatting monetary values]: https://cartjs.org/pages/guide#getting-started-setup
