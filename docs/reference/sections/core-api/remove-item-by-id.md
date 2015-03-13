`CartJS.removeItemById(id, options = {})`

Remove the line item with the specified variant `id` from the cart.
If multiple line items exist for the specified variant, all of them will be removed.

```js
// Get rid of all blue socks (variant #12345678) from our order.
CartJS.removeItemById(12345678);
```

See [addItem](#core-api-add-item) for details on the `options` hash.
