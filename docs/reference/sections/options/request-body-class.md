*String (default: `null`)*

If provided, Cart.js will automatically apply this class to the `body` element while an Ajax request is ongoing.

Useful for displaying a loading animation while an Ajax request is waiting to complete - for example:

{% raw %}
```html
<style>
    .show-when-loading {
        display: none;
    }

    body.loading .show-when-loading {
        display: inline-block;
    }
</style>
<body>
    <button data-cart-add="12345678">Add a Product</button>
    <img src="{{ 'loader.gif' | asset_url }}" class="" width="16" height="16" alt="Loading..." />
</body>
```
{% endraw %}
