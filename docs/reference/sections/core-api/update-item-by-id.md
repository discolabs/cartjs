`CartJS.updateItemById(id, quantity, properties = {}, options = {})`

Update the quantity and properties of the line item with the specified variant `id` in the cart.
If multiple line items exist for the specified variant, all of them will be updated.

Setting `quantity` to `0` will remove all items with the specified variant `id` from the cart.
Leaving `quantity` as `undefined` will leave the quantity of the items as-is.

```js
// Make sure we have six pairs of blue socks (variant #12345678).
CartJS.updateItemById(12345678, 6);
```

See [addItem](#core-api-add-item) for details on the `options` hash.
