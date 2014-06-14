# Cart.js

Cart.js is a Javascript library that makes it easy to add dynamic cart features to Shopify themes.

It abstracts away some of the difficulties of working with Shopify's AJAX API (such as the limited nature of some of the
API endpoints and the need to make API calls synchronously) and provides a simple, consistent interface to manipulating
a customer's cart.

Beyond that, Cart.js provides some additional nifty functionality via two optional modules.


### Data API Module

Lets you use simple `data-*` markup attributes in your `.liquid` templates to manipulate the cart via AJAX.


### DOM Binding Module

Provides adapters, formatters and bindings for the excellent [Rivets.js](http://rivetsjs.com) DOM data-binding library,
allowing you to write HTML templates in your `.liquid` files that are re-rendered dynamically when the contents of your
cart change.


## Getting Started and Documentation

Documentation and examples are available on the [home page](http://cart-js.myshopify.com).

Cart.js currently depends on jQuery for its `$.ajax` and utility functions. This usually isn't a problem as most Shopify
themes ship with jQuery as a hard requirement.

Rivets.js is required if you want to use the DOM Binding module.