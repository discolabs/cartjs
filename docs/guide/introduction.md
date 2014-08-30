Cart.js is a Javascript library that makes it easy to add dynamic cart features to Shopify themes.

It abstracts away some of the difficulties of working with Shopify's AJAX API (such as the limited nature of some of the API endpoints and the need to make API calls synchronously) and provides a simple, consistent interface to manipulating a customer's cart.


## Getting Started

First, get the latest stable release of `cart.js` [here](https://github.com/discolabs/cartjs/blob/master/dist/cart.js) (You can get a pre-minified version, `cart.min.js` from [here](https://github.com/discolabs/cartjs/blob/master/dist/cart.min.js) if you'd prefer).

Add the chosen `.js` file to your theme's `assets` directory, then include the script on your page and initialise Cart.js.
The best place to do this is at the bottom of your theme's `theme.liquid` file, so that Cart.js functionality is available across your whole site.
Because Cart.js depends on jQuery, you should load it after you've include the jQuery library.

```liquid
        ... contents of your theme's theme.liquid ...

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
