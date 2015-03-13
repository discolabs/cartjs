`CartJS.addItem(id, quantity = 1, properties = {}, options = {})`

Add the variant with the given `id` to the cart, optionally specifying a `quantity` (default `1`) and a hash of custom line item `properties`.

```js
// Add five items with the variant id 12345678 to the cart, with a custom size property.
CartJS.addItem(12345678, 5, {
    "size": "XL"
});
```

The final optional `options` hash allows you to specify callback functions to trigger after the item has been added.
Available callbacks mirror those provided by jQuery's `$.ajax()` callbacks (`success`, `error` and `complete`), and are passed the same arguments.

```js
// Do the same as above, but handle the result of the call with either a success or error message.
CartJS.addItem(12345678, 5, {
    "size": "XL"
}, {
    "success": function(data, textStatus, jqXHR) {
        alert('Added!');
    },
    "error": function(jqXHR, textStatus, errorThrown) {
        alert('Error: ' + errorThrown + '!');
    }
});
```

As with jQuery callbacks, you can optionally provide an array of callback functions to execute.
