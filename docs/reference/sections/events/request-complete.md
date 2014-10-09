Triggered whenever Cart.js completes processing the current request queue.

Note that if you make multiple Ajax-triggered calls to Cart.js (say, two calls to `addItem` in a row), this event will still only fire once at the end after processing all requests.


```js
$(document).on('cart.requestComplete', function(event, cart) {
    // Event handling here.
});
```
