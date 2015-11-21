The Cart.js distribution comes packaged with three versions of the library:

<div class="callout callout-success">
    <p>
        `cart.js` is the unminified source code, containing the Core and Data APIs.
    </p>

    <p>
        `cart.min.js` is a minified version of the library, and also contains the Core and Data APIs.
    </p>

    <p>
        `rivets-cart.min.js` is a minified version of Cart.js that also bundles the Rivets.js library.
        Together, they provide support for the DOM Binding functionality.
    </p>   
</div>

Once you've selected the version you'd like to use, add the relevant file to your theme's `/assets` directory.

You then just need to include the script on your page and call `CartJS.init()`.
The best place to do this is at the bottom of your theme's `theme.liquid` file, so that Cart.js functionality is available across your whole site.

Because Cart.js depends on jQuery, you should load it after you've included the jQuery library.

{% raw %}
```html
        ... contents of your theme.liquid ...

        <!-- Include jQuery from Google's CDN. -->
        <!-- Your theme may already include jQuery - if so, you can skip this line. -->
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

<div class="callout callout-warning">
    <h4>Dependency when formatting monetary values</h4>

    <p>
        If you're using any of the money-formatting features of Cart.js (such as the `| money` filter in the DOM Binding
        module or the `data-cart-render` attributes of the Data API), you'll need to make sure that Shopify's currency
        Javascript library is loaded.
    </p>
    
    <p>
        Do this simply by ensuring that the `option_selection.js` library is loaded on all of your theme's pages, using
        a line something like `{% raw %}{{ 'option_selection.js' | shopify_asset_url | script_tag }}{% endraw %}` in your `theme.liquid`.
    </p>
</div>
