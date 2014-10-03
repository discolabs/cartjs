The Cart.js distribution comes packaged with three versions of the library:

- `cart.js` is the unminified source code, containing the Core and Data API.
- `cart.min.js` is the minified version of `cart.js`.
- `rivets-cart.min.js` is a minified version of both Cart.js and the Rivets.js library, used for DOM binding functionality.

Once you've selected the version you'd like to use, add the relevant file to your theme's `/assets` directory.

You then just need to include the script on your page and call `CartJS.init()`.
The best place to do this is at the bottom of your theme's `theme.liquid` file, so that Cart.js functionality is available across your whole site.

Because Cart.js depends on jQuery, you should load it after you've included the jQuery library.

{% raw %}
```html
        ... contents of your theme.liquid ...

        <!-- Include jQuery from Google's CDN (your theme may already include jQuery, if so, skip this line) -->
        {{ '//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' | script_tag }}

        <!-- Include Cart.js -->
        {{ 'cart.min.js' | asset_url | script_tag }}

        <!-- Initialise Cart.js once the page has loaded -->
        <script type="text/javascript">
            jQuery(function() {
                CartJS.init({{ cart | json }});
            });
        </script>

    </body>
</html>
```
{% endraw %}

Note that the call to `CartJS.init()` requires that {% raw %}`{{ cart | json }}`{% endraw %} is passed as an argument.
This tells Liquid to render the initial cart state as a JSON object and pass it to Cart.js.
