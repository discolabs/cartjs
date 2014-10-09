`CartJS.addItem(id, quantity = 1, properties = {})`

Add the variant with the given `id` to the cart, optionally specifying a `quantity` (default `1`) and a hash of custom line item `properties`.

```js
// Add five items with the variant id 12345678 to the cart, with a custom size property.
CartJS.addItem(12345678, 5, {
    "size": "XL"
});
```
