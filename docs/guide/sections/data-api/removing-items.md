To create an element that removes a line item from the cart on a `click` event, use `data-cart-remove` or `data-cart-remove-id`.

The difference between these two is that `data-cart-remove` expects the index of the line item you'd like to remove from the cart, while `data-cart-remove-id` expects a variant ID.

See [Updating Items][] in the Core API section for an explanation of why this distinction is required.

```html
<button data-cart-remove-variant="12345678">Remove Widgets from Cart</button>
```

[Updating Items]: #core-api-updating-items
