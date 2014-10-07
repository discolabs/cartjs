To create an element that adds an item to the cart on a `click` event, just mark up an element with a `data-cart-add` attribute, and set the value of the attribute to the ID of the variant you'd like to add:

```html
<button data-cart-add="12345678">Add a Widget</button>
```

Of course, you can always use Liquid to render these elements dynamically in your templates:

{% raw %}
```html
{% for variant in product.variants %}
    <button data-cart-add="{{ variant.id }}">Add a {{ variant.title }}</button>
{% endfor %}
```
{% endraw %}
