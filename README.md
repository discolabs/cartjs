[![Build Status](https://api.travis-ci.org/discolabs/cartjs.svg?branch=master)](http://travis-ci.org/discolabs/cartjs)
[![npm version](https://badge.fury.io/js/shopify-cartjs.svg)](https://badge.fury.io/js/shopify-cartjs)
[![Bower version](https://badge.fury.io/bo/shopify-cartjs.svg)](https://badge.fury.io/bo/shopify-cartjs)

# Cart.js
Cart.js is a Javascript library that makes it easy to add dynamic cart features
to Shopify themes.

It abstracts away the difficult parts of working with Shopify's AJAX API and
provides a simple, consistent interface to manipulating a customer's cart.
Without having to worry about the quirks in Shopify's endpoints or about making
all of your requests synchronous, you can just write code like this:

```js
function example() {
  // Clear the existing cart.
  CartJS.clear();

  // Add 3x "12345678" items, with a custom "size" property of "XL".
  CartJS.addItem(12345678, 3, {
    "size": "XL"
  });

  // Set a custom cart note.
  CartJS.setNote('This is a custom cart note.');
}
```

Neat, huh? But that's just the beginning.

Cart.js bundles two powerful optional modules that make it even easier to build
dynamic carts into your themes:


### Data API Module
Lets you use simple `data-*` markup attributes to hook in to Cart.js methods,
without having to write *any* Javascript yourself.

For example, to create a button that added a particular product to your cart,
all that's required is:

```html
<button data-cart-add="12345678">Add Product</button>
```


### DOM Binding Module
In combination with [Rivets.js][], the DOM Binding module lets you write HTML
templates in your `.liquid` files that are re-rendered dynamically when the
contents of your cart change, like this:

```html
<div data-cart-view>
    You currently have {cart.total_items} item(s) in your cart, for a total of {cart.total_price | money_with_currency}.
</div>
```


## Getting Started and Documentation
Documentation and examples are available on the [home page][].

You can check out a list of who's using Cart.js in production on the
[Built with Cart.js][] page.

[home page]: https://cartjs.org?utm_source=github&utm_medium=readme&utm_campaign=cartjs
[Built with Cart.js]: https://cartjs.org/pages/built-with-cart-js


## Dependencies
Cart.js currently depends on [jQuery][] for its AJAX helpers, custom event
bindings and utility methods. This usually isn't a problem as most Shopify
themes ship with jQuery.

[Rivets.js] is required if you want to use the DOM Binding module. The
distribution of Cart.js includes a minified asset (`rivets-cart.min.js`) which
contains both the Cart.js library and a bundled version of Rivets.js.

[Rivets.js]: http://rivetsjs.com
[jQuery]: http://jquery.com


## Release History
Refer to the [change log](https://github.com/discolabs/cartjs/blob/master/CHANGELOG.md)
for a full list of changes.


## Contributions
Contributions are very much welcome! Read our [contribution guidelines][] for
details on submitting pull requests that will be accepted.

[contribution guidelines]: https://github.com/discolabs/cartjs/blob/master/CONTRIBUTING.md

---

#### About the Author
[Gavin Ballard][] is a developer at [Disco][], specialising in Shopify
development. Related projects:

- [Mastering Shopify Themes][]
- [Mastering Shopify Apps][]
- [Shopify Theme Scaffold][]
- [Bootstrap for Shopify][]

[Gavin Ballard]: http://gavinballard.com/?utm_source=github&utm_medium=readme&utm_campaign=cartjs
[Disco]: https://www.discolabs.com/?utm_source=github&utm_medium=readme&utm_campaign=cartjs
[Mastering Shopify Themes]: http://gavinballard.com/mastering-shopify-themes/?utm_source=github&utm_medium=readme&utm_campaign=cartjs
[Mastering Shopify Apps]: http://gavinballard.com/mastering-shopify-apps/?utm_source=github&utm_medium=readme&utm_campaign=cartjs
[Shopify Theme Scaffold]: https://github.com/discolabs/shopify-theme-scaffold
[Bootstrap for Shopify]: http://bootstrapforshopify.com/?utm_source=github&utm_medium=readme&utm_campaign=cartjs
