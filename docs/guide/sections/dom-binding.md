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

[Rivets.js]: http://rivetsjs.com/
[at the end of this section]: #dom-binding-live-example