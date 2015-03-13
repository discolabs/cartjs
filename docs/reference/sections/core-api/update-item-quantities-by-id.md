`CartJS.updateItemQuantitiesById(updates = {}, options = {})`

Update the quantities of many line items in the cart at once, using a mapping of variant IDs
to the desired quantity. Line items with variants IDs omitted from the `updates` hash will
not have their quantities changed.

```js
// Make sure we have 6x blue socks (variant #12345678) and 0x red socks (variant #12345680).
CartJS.updateItemQuantitiesById({12345678: 6, 12345680: 0});
```

See [addItem](#core-api-add-item) for details on the `options` hash.
