#### Adding Items

Adding items to your cart is as simple as calling `CartJS.addItem()`, and passing the ID of the variant you'd like to add as the first argument.

Assume we have a Shopify store that's selling widgets, and that one of those widgets has a variant with an ID of `12345678` that costs $9.99.
Let's create a button customers can click to add a widget to their cart, and then hook it up to some Javascript code via jQuery:

```html
<button id="button">Add a Widget</button>

<script type="text/javascript">
    $('#button').click(function() {
        CartJS.addItem(12345678);
    });
</script>
```

Now when a customer clicks our button, Cart.js will make an Ajax request and add a single Widget to the customer's cart.

When using the `addItem()` method, you can optionally specify the quantity to add and a hash of custom line item properties.
Let's update our code to add five widgets when we click the button, and to set a custom "added_by" property on the resulting line item:

```html
<button id="button">Add Five Widgets</button>

<script type="text/javascript">
    $('#button').click(function() {
        CartJS.addItem(12345678, 5, {
            "added_by": "Cart.js"
        });
    });
</script>
```

If we loaded this example, clicked "Add Five Widgets", then typed `CartJS.cart.items` in to our browser's Javascript console, we'd see something like this (simplified for this example):

```js
[
    {
        "handle": "widget-1",
        "id" 12345678,
        "price": 999,
        "line_price": 4995,
        "properties": {
            "added_by": "Cart.js"
        },
        "quantity": 5,
        "title": "Widget 1",
        "variant_id": 12345678
    }
]
```

That's it!
You can call `addItems()` as many times as you like in the same function, and Cart.js will queue up Ajax requests as needed.

<div class="callout callout-warning">
    <h4>Note on multiple line items with the same variant ID</h4>

    <p>
        Shopify will collate multiple line items for the same variant into one -- for example, if we clicked "Add Five Widgets" in the example above again, we'd end up with one line item with `"quantity": 10` instead of two line item with `"quantity: 5"`.
    </p>

    <p>
        However, this *doesn't* apply when you add the same variant with custom line item properties that differ -- if we changed the value of the `added_by` property and clicked the button, we'd end up with separate line items.
    </p>
</div>


#### Updating Items

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


#### Removing Items

Removing items works in a similar way to updating items -- just call the `removeItem()` method, passing the line number of the line item you'd like to remove.
As with the update method, if you'd like to remove all line items with a particular variant ID, you can use `removeItemById()` instead.

If you'd like to empty the cart completely, just call the `clear()` method:

```html
<button id="button-empty">Empty Cart</button>

<script type="text/javascript">
    $('#button-empty').click(function() {
        CartJS.clear();
    });
</script>
```
