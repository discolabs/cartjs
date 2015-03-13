`CartJS.removeItem(line_number, options = {})`

Remove the line item with the specified `line_number` from the cart.
Line numbers are one-indexed; that is, the first line item has a `line_number` of `1`.

```js
// Remove the first line item from the cart.
CartJS.removeItem(1);
```

See [addItem](#core-api-add-item) for details on the `options` hash.
