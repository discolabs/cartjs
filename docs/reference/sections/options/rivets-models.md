*Object (default: `{}`)*

If you're using Rivets.js for DOM bindings, this setting allows you to pass additional data models that can be used in your rendered views.

{% raw %}
```html
<div data-cart-view>
    Your name is {customer.name}.
</div>

<script type="text/javascript">
    $(function() {
        CartJS.init({{ cart | json }}, {
            rivetsModels: {
                "customer": {{ customer | json }}
            }
        });
    });
</script>
```
{% endraw %}
