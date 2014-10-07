To make it easy to respond to changes in the customer's cart, Cart.js fires a number of custom jQuery events that you can bind listeners to.

All events are triggered on the `document`, are prefixed with a `cart` namespace, and pass the current cart object as the first custom event argument.

For example, if we wanted to update a `<span>` element with the number of items in the cart after a request, we could listen for the `cart.requestComplete` event like so:

{% raw %}
```html
You have <span id="counter">{{ cart.item_count }}</span> items in your cart.

<script type="text/javscript">
    $(document).on('cart.requestComplete', function(event, cart) {
        $('#counter').html(cart.item_count);
    });
</script>
```
{% endraw %}

A complete list of the events triggered by Cart.js is available in the [Event Reference][].

[Event Reference]: /pages/reference#events
