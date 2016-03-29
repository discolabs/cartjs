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

[Binder Reference]: http://rivetsjs.com/docs/reference/