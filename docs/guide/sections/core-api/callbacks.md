All Core API methods that result in an Ajax request being made to the server allow you to specify one or more callback functions, just like a regular jQuery `$.ajax()` request.
Callbacks are specified through an `options` hash, passed as the final optional argument to the core methods.

To take a common example, we'll often want to provide callback methods to handle possible results when we try to add an item to our cart.
We want to inform the user of the success or failure of their action, and potentially take some other action.

```html
<button id="button">Add to Cart</button>

<div id="message"></div>

<script type="text/javascript">
    $('#button').click(function() {
    
        // Call the addItem() method.
        // Note the empty object as the third argument, representing no line item properties.  
        CartJS.addItem(12345678, 1, {}, {
        
            // Define a success callback to display a success message.
            "success": function(data, textStatus, jqXHR) {
                $('#message').addClass('message-success');
                $('#message').html('Successfully added to cart.');
            },
            
            // Define an error callback to display an error message.
            "error": function(jqXHR, textStatus, errorThrown) {
                $('#message').addClass('message-error');
                $('#message').html('There was a problem adding to the cart!');
            }
            
        });
    });
</script>
```
