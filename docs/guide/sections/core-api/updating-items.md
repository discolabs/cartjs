Updating the quantities or properties of line items is just as simple as adding them -- we just make a call to the `updateItem()` method.

Let's continue from our example above, and say we want to have a button that doubles the number of widgets in our order.

```html
<button id="button-double">Double my Order!</button>

<script type="text/javascript">
    $('#button-double').click(function() {
        var newQuantity = CartJS.cart.items[0].quantity * 2;
        CartJS.updateItem(1, newQuantity);
    });
</script>
```

<div class="callout callout-warning">
    <h4>Existing items referenced by index, not variant ID</h4>

    <p>
        One important thing to note is that the `updateItem()` method takes the ***line number*** (the "index") of the item in the cart you'd like to update, not the variant ID.
        This is because it's possible (and quite common) to have multiple items in the cart with the same variant ID but with different properties.
    </p>

    <p>
        Shopify uses a 1-based index for line items, so the index of the first line item in a cart is `1`, not `0` as is common in many programming languages.
    </p>

    <p>
        If you'd like to update an item using just the variant ID, you can use `updateItemById()`, which operates the same way as `updateItem()` but takes the variant ID as the first parameter.
    </p>
</div>
