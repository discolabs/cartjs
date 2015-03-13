`CartJS.updateItem(line_number, quantity, properties = {}, options = {})`

Update the quantity and properties of the line item with the specified `line_number` in the cart.
Line numbers are one-indexed; that is, the first line item has a `line_number` of `1`.

Setting `quantity` to `0` will remove the item from the cart.
Leaving `quantity` as `undefined` will leave the quantity of the item as-is.

```js
// Let's have 6 of the first item in the cart.
CartJS.updateItem(1, 6);
```

See [addItem](#core-api-add-item) for details on the `options` hash.
