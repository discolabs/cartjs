# Cart.js

Cart.js is a Javascript library that makes it easy to add dynamic cart features to Shopify themes.

It abstracts away the difficult parts of working with Shopify's AJAX API and provides a simple, consistent interface to manipulating a customer's cart.
Without having to worry about the quirks in Shopify's endpoints or about making all of your requests synchronous, you can just write code like this:

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

Cart.js bundles two powerful optional modules that make it even easier to build dynamic carts into your themes:


### Data API Module

Lets you use simple `data-*` markup attributes to hook in to Cart.js methods, without having to write *any* Javascript yourself.

For example, to create a button that added a particular product to your cart, all that's required is:

```html
<button data-cart-add="12345678">Add Product</button>
```


### DOM Binding Module

In combination with [Rivets.js][], the DOM Binding module lets you write HTML templates in your `.liquid` files that are re-rendered dynamically when the contents of your cart change, like this:

```html
<div data-cart-view>
    You currently have {cart.total_items} item(s) in your cart, for a total of {cart.total_price | money_with_currency}.
</div>
```


## Getting Started and Documentation

Documentation and examples are available on the [home page][].

[home page]: http://cartjs.org?utm_source=github&utm_medium=readme&utm_campaign=cartjs


## Dependencies

Cart.js currently depends on [jQuery][] for its AJAX helpers, custom event bindings and utility methods.
This usually isn't a problem as most Shopify themes ship with jQuery.

[Rivets.js] is required if you want to use the DOM Binding module.

[Rivets.js]: http://rivetsjs.com
[jQuery]: http://jquery.com


## Release History
Refer to the [change log](https://github.com/discolabs/cartjs/blob/master/CHANGELOG.md) for a full list of changes.

---

#### About the Author

[Gavin Ballard][] is a developer at [Disco][], specialising in Shopify development.
Related projects:

- [Shopify Theme Settings Grunt Plugin][]
- [Shopify Theme Scaffold][]
- [Bootstrap for Shopify][]
- [Mastering Shopify Themes][]

[Shopify Theme Settings Grunt Plugin]: https://github.com/discolabs/grunt-shopify-theme-settings
[Shopify Theme Scaffold]: https://github.com/discolabs/shopify-theme-scaffold
[Bootstrap for Shopify]: http://bootstrapforshopify.com/?utm_source=github&utm_medium=readme&utm_campaign=cartjs
[Mastering Shopify Themes]: http://gavinballard.com/mastering-shopify-themes/?utm_source=github&utm_medium=readme&utm_campaign=cartjs
[Gavin Ballard]: http://gavinballard.com/?utm_source=github&utm_medium=readme&utm_campaign=cartjs
[Disco]: http://discolabs.com/?utm_source=github&utm_medium=readme&utm_campaign=cartjs
