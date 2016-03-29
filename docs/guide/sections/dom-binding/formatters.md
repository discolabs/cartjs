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

[DOM Binding Reference]: /pages/reference/#dom-binding
[Formatters]: http://rivetsjs.com/docs/guide/#formatters