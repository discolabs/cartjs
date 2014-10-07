In addition to cart items, Shopify also provides support for cart attributes, which are used to store custom information about an order.
For example, a common use case for attributes is to store a flag indicating whether the customer would like their order gift wrapped.

Cart.js provides some conveniences around manipulating these attributes.
Let's take the gift wrap example and see how we could implement it with a simple checkbox:

```html
<label>
    <input id="gift-wrap-checkbox" type="checkbox" />
    Please gift wrap my order
</label>

<script type="text/javascript">
    // Update the 'Gift Wrap' cart attribute based on the state of the checkbox whenever it changes.
    $('#gift-wrap-checkbox').change(function() {
        CartJS.setAttribute('Gift Wrap', this.checked ? 'Yes': 'No' );
    });
</script>
```

Now, any time a customer checks or un-checks the options, CartJS will make an update request to the Shopify server.

Cart.js provides convenience methods for setting multiple attributes at once, clearing attributes, and setting the special-case `note` attribute.
For a full list of supported methods, see the [API Reference][].

[API Reference]: /pages/reference/#core-api
