```html
<button data-cart-update="1" data-cart-quantity="5">Change to 5</button>
```

On a `click` event, update the line number given by `data-cart-update` in the cart.
You can use the `data-cart-quantity` attribute to specify the new quantity.

Line numbers are one-indexed; that is, the first line item has a line number of `1`.
