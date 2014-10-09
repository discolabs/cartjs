Triggered whenever Cart.js begins to process the request queue.

Note that if you make multiple Ajax-triggered calls to Cart.js (say, two calls to `addItem` in a row), this event will still only fire once.


```js
$(document).on('cart.requestStarted', function(event, cart) {
    // Event handling here.
});
```
