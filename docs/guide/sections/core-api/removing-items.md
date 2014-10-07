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
