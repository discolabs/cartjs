The Core API consists of methods you call on the global `CartJS` object to manipulate your cart.



For example, you might use jQuery to add an event handler to a button's `click` event:

```html
<button id="button">Add a Bagel to Cart</button>

<script type="text/javascript">
    $('#button').click(function() {
        CartJS.addItem(12345678);
    });
</script>
```
