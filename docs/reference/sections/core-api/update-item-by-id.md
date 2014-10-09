`CartJS.updateItemById(id, quantity = 1, properties = {})`

Update the quantity and properties of the line item with the specified variant `id` in the cart.
If multiple line items exist for the specified variant, all of them will be updated.

```js
// Make sure we have six pairs of blue socks (variant #12345678).
CartJS.updateItemById(12345678, 6);
```
