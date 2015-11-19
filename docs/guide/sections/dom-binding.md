Cart.js ships with support for [Rivets.js][], which allows for some powerful templating approaches with minimal effort. Rivets.js allows you to describe in your markup how your data should be rendered, and then handles automatically updating the DOM when that model data changes. With Cart.js, this allows us to describe a template for our cart that will be automatically updated whenever the cart changes.

You can see an example of this in action [at the end of this section].

### Getting Started
The Rivets module of Cart.js will bind to an element with the attribute `data-cart-view="data-cart-view"`, which needs to wrap all cart elements that need to be dynamically updated. The basic syntax for Rivets templates involves adding an `rv-` attribute to the element, and passing in a reference to the `cart` object that Cart.js has bound with Rivets. 

<div class="callout callout-success">
  <p style="margin-bottom: 0;">
    Cart.js binds the `cart` data model to Rivets by default, however you can pass in other data models as the [rivetsModels] Cart.js initialisation option.
  </p>
</div>
 
### Rivets Binders
Binders are core of Rivets' power, and provide for both rendering content into the template, and applying conditional logic to the content.

For example, if we wanted to keep a `<p>` element updated with the number of items in the cart, we could add the `rv-text="cart.item_count"` attribute like so:

```html
<div data-cart-view="data-cart-view">  
  <p rv-text="cart.item_count"></p>
</div>  
```

This would set the contents of the `<p>` element to the current value of `cart.item_count`, and update this content whenever `cart` changes.
See Rivets' [Binder Reference][] for a full breakdown of available `rv-` tags. 


Rivets also provides an alternative to `rv-text` that enables interpolating content into an element, using a syntax of single curly-braces (not to be confused with Liquid's {% raw %}`{{`{% endraw %}) - the previous example could also be stated as:
 
```html
<div data-cart-view="data-cart-view">  
 <p>{ cart.item_count }</p>
</div>  
``` 

A full breakdown of Rivets' available binders can be found under the Rivets docs [Binder Reference][].

### Formatters
Rivets provides a range of formatters, that are analogous to filters in Liquid (though the syntax is slightly different). These are extensible, and so there are some Shopify-specific formatters included with Cart.js.

Formatters look similar to Liquid filters, but have two key differences. 

* Where in Liquid a filter should be appended with a colon before passing arguments (e.g. {% raw %}`{{ 'Title' | prepend: 'A ' }}`{% endraw %}), in Rivets you should not include the colon (e.g. `{ 'Title' | prepend 'A ' }`)
* Formatters can also be used for evaluation and return a boolean result - e.g. `{ cart.item_count | eq 0 }` will return true if the cart is empty.

A full list of included formatters can be found in the [API Reference][].

-----

You may also need to create additional formatters to meet the requirements of a specific project. With Rivets, this is very straightforward - a global `rivets` object is available once Cart.js has finished loading, and additional formatters can be extended onto the `rivets` object with the following syntax (where `formatter_name` is the newly defined formatter's name):
 
```js
rivets.formatters.formatter_name = function(value) {
  // Do something to value
  return value;
};
```
 
To learn more about creating additional formatters, check out the Rivets Guide on [Formatters][].

<h3 id="rivets-example">DOM Binding Live Example</h3>

[front page]: /
[Rivets.js documentation]: http://rivetsjs.com/
[Rivets.js]: http://rivetsjs.com/
[at the end of this section]: #rivets-example
[Binder Reference]: http://rivetsjs.com/docs/reference/
[rivetsModels]: /pages/reference/#options-rivets-models
[API Reference]: /pages/reference/#dom-binding
[Formatters]: http://rivetsjs.com/docs/guide/#formatters