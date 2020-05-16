`CartJS.addItems(items, options = {})`

Adds the provided `items` to the cart. You can specify multiple lines, each with their own custom properties.

```js
// Add 3x 12345678 items and 2x 87654321 items.
CartJS.addItems([
  {
    id: 12345678,
    quantity: 3,
    properties: {
      "size": "XL"
    }
  },
  {
    id: 87654321,
    quantity: 2
  }
]);
```

See [addItem](#core-api-add-item) for details on the `options` hash.