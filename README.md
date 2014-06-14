# Cart.js

Cart.js is a Javascript library that makes it easy to add dynamic cart features to Shopify themes.

It abstracts away some of the difficulties of working with Shopify's AJAX API (such as the limited nature of some of the
API endpoints and the need to make API calls synchronously) and provides a simple, consistent interface to manipulating
a customer's cart.

Beyond that, Cart.js provides some additional nifty functionality via two optional modules:


### Data API Module

Lets you use simple `data-*` markup attributes in your `.liquid` templates to manipulate the cart via AJAX. This module
utilises jQuery's `.on()` event binder, and is off by default. Enable it by setting `dataAPI: true` when initialising
Cart.js.


### DOM Binding Module

Provides adapters, formatters and bindings for the excellent [Rivets.js](http://rivetsjs.com) DOM data-binding library,
allowing you to write HTML templates in your `.liquid` files that are re-rendered dynamically when the contents of your
cart change.

You don't need to set anything to enable this module - Cart.js will only initialise the DOM binding if the Rivets.js
library has been included on the page.


## Getting Started and Documentation

Documentation and examples are available on the [home page](http://cart-js.myshopify.com).


## Dependencies

Cart.js currently depends on [jQuery](http://jquery.com) for its AJAX helpers, custom event bindings and utility
methods. This usually isn't a problem as most Shopify themes ship with jQuery.

Rivets.js is required if you want to use the DOM Binding module.