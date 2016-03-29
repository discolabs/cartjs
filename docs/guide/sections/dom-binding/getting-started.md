To get started with the DOM Binding module, first add a `data-cart-view` attribute to a parent element of any content you'd like to be automatically updated when the cart changes. You can then use one a number of `rv-*` attributes to describe how HTML should be rendered from your cart data.

<div class="callout callout-success">
  <p style="margin-bottom: 0;">
  The core syntax for templates involves providing a reference to a model that has been bound to Rivet.js - Cart.js binds the `cart` data model by default, however you can pass in other data models as the [rivetsModels][] Cart.js initialisation option.
  </p>
</div>

[rivetsModels]: /pages/reference/#options-rivets-models