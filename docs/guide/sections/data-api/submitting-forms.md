If you've already got a working Shopify theme, you'll already have a couple of `<form>` elements around the place that you use to add items to the cart - for example, in your `product.liquid` template.

You can convert these existing forms to use Cart.js simply by adding a `data-cart-submit` attribute to the `<form>` element:

{% raw %}
```html
<form action="/cart/add" method="post" data-cart-submit>
    <select name="id">
        {% for variant in product.variants %}
          <option value="{{ variant.id }}">{{ variant.title }} - {{ variant.price | money }}</option>
        {% endfor %}
    </select>

    <button type="submit">Buy Now</button>
</form>
```
{% endraw %}

When the customer clicks "Buy Now", Cart.js will intercept the form submission and convert it to an Ajax request.
All of the usual inputs - `id` to specify the variant ID, `quantity` to specify the quantity, and `properties[]` to specify line item properties - are supported.

<div class="callout callout-danger">
    <h4>Form submission doesn't work with files</h4>
    <p>
        Because Ajax requests don't support `POST` requests with `enctype="multipart/form-data"`, Cart.js won't be able to submit your form if it contains `<input type="file">` elements.
    </p>
    <p>
        This is something that we hope to auto-detect in future, but for now you should avoid using `data-cart-submit` on forms that need to upload files.
    </p>
</div>
