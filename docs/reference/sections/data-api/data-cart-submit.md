```html
<form action="/cart/add" method="post" data-cart-submit>
    <input type="hidden" name="id" value="12345678" />

    <button type="submit">Add to Cart</button>
</form>
```

On a form's `submit` event, intercept the form submission and POST it via Ajax instead.

Note that this doesn't currently work with forms containing file uploads.
