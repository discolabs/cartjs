Cart.js ships with support for [Rivets.js][], which allows you to describe in your markup how your data should be rendered, and then automatically handles updating the DOM when that model data changes. This allows us to describe a template for our cart that will be automatically updated whenever the cart changes.

For example, the following simplified template will be populated and updated by Cart.js on page load, and whenever the cart changes:

```html
<section class="cart" data-cart-view="data-cart-view">
  <div rv-each-item="cart.items">
    <div rv-text="item.title">
    <div rv-text="item.quantity"></div>
    <div rv-html="item.price | money Currency.currentCurrency"></div>
    <a href="#" rv-data-cart-remove="index | plus 1">&times;</a>
  </div>
  
  <div rv-show="cart.item_count | eq 0">
    You don't have any items in your cart.
  </div>
  
  <div rv-html="cart.total_price | money Currency.currentCurrency"></div>
</section>
```

You can see a fully featured interactive example of this in action [at the end of this section].


### Getting Started
To get started with the DOM Binding module, first add a `data-cart-view` attribute to a parent element of any content you'd like to be automatically updated when the cart changes. You can then use one a number of `rv-*` attributes to describe how HTML should be rendered from your cart data.

<div class="callout callout-success">
  <p style="margin-bottom: 0;">
  The core syntax for templates involves providing a reference to a model that has been bound to Rivet.js - Cart.js binds the `cart` data model by default, however you can pass in other data models as the [rivetsModels] Cart.js initialisation option.
  </p>
</div>
 
### Rivets Binders
Binders are the core of Rivets' power, and provide for both rendering content into the template, and applying conditional logic to the content.

For example, if we wanted to keep a `<p>` element updated with the number of items in the cart, we could add the `rv-text="cart.item_count"` attribute like so:

```html
<div data-cart-view="data-cart-view">  
  <p rv-text="cart.item_count"></p>
</div>  
```

This would set the contents of the `<p>` element to the current value of `cart.item_count`, and update this content whenever `cart` changes.
If you need to render html instead of plaintext, you can use `rv-html` instead of `rv-text`.


Rivets also provides an alternative to `rv-text` that enables interpolating content into an element, using a syntax of single curly-braces (not to be confused with Liquid's {% raw %}`{{`{% endraw %}) - the previous example could also be stated as:
 
```html
<div data-cart-view="data-cart-view">  
 <p>{ cart.item_count }</p>
</div>  
``` 

-----

Along with using Rivets to render content, there are also control flow and loop iterator `rv-*` tags available.

For example, the following will:
* iterate over each item in the cart and render a `<div>`
* each line item `<div>` will have its class set to the `product_type`
* each line item will contain an element `<a href="#" data-cart-remove="index">&times;</a>`, where `index` is the iterator loop-index plus 1
* conditionally show a message at the end if the cart total is greater than 50

```html
<div data-cart-view="data-cart-view"> 
  <div rv-each-item="cart.items" rv-class="item.product_type">
    <div rv-text="item.title">
    <div rv-text="item.quantity"></div>
    <div rv-html="item.price | money Currency.currentCurrency"></div>
    <a href="#" rv-data-cart-remove="index | plus 1">&times;</a>
  </div>
  
  <div rf-if="cart.total_price | gt 50">Your cart qualifies for free shipping!</div>
</div>
```

A full breakdown of Rivets' available binders can be found under the Rivets docs [Binder Reference][].

### Formatters
Rivets provides a range of formatters, that are analogous to filters in Liquid (though the syntax is slightly different). These are extensible, and so there are some Shopify-specific formatters included with Cart.js.

Formatters look similar to Liquid filters, but have two key differences. 

* Where in Liquid a filter should be appended with a colon before passing arguments (e.g. {% raw %}`{{ 'Title' | prepend: 'A ' }}`{% endraw %}), in Rivets you should not include the colon (e.g. `{ 'Title' | prepend 'A ' }`)
* Formatters can also be used for evaluation and return a boolean result - e.g. `{ cart.item_count | eq 0 }` will return true if the cart is empty.

A full list of included formatters can be found in the [DOM Binding Reference][].

-----

You may also need to create additional formatters to meet the requirements of a specific project. With Rivets, this is very straightforward - a global `rivets` object is available once Cart.js has finished loading, and additional formatters can be extended onto the `rivets` object with the following syntax (where `formatter_name` is the newly defined formatter's name):
 
```js
rivets.formatters.formatter_name = function(value) {
  // Do something to value
  return value;
};
```
 
To learn more about creating additional formatters, check out the Rivets Guide on [Formatters][].

-----

<h3 id="rivets-example">DOM Binding Live Example</h3>

[front page]: /
[Rivets.js documentation]: http://rivetsjs.com/
[Rivets.js]: http://rivetsjs.com/
[at the end of this section]: #rivets-example
[Binder Reference]: http://rivetsjs.com/docs/reference/
[rivetsModels]: /pages/reference/#options-rivets-models
[DOM Binding Reference]: /pages/reference/#dom-binding
[Formatters]: http://rivetsjs.com/docs/guide/#formatters