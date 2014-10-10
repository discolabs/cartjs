```html
<button data-cart-update-id="12345678" data-cart-quantity="5">Change to 5</button>
```

On a `click` event, update the variant given by `data-cart-update-id` in the cart.
You can use the `data-cart-quantity` attribute to specify the new quantity.

If multiple line items exist for the specified variant, all of them will be updated.
