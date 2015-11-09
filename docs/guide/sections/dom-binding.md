Full documentation for the DOM Binding module is coming soon.

In the meantime, you can check out the example on the [front page][] in combination with the [Rivets.js documentation][] to get an idea of how things work.

## Draft DOM Binding Guide
* Intro to Rivets Binding approach
* Bring `demo-advanced-code.md` into here to show intended functionality
* Getting Started, including mention of `data-cart-view="data-cart-view"` requirement on parent element, and usage of `cart` object within Rivets structure
* Table of suitable `rv-` tags (i.e. `rv-show`, `rv-html`, `rv-each` etc)
* Breakdown of usage of each `rv-` tag within context of cartjs, or links to original Rivets reference where appropriate
* Table of suitable filters, along with additional cartjs-specific filters
* Breakdown of usage of each filter

### Intro
Cart.js ships with support for [Rivets.js][], which allows for some powerful templating approaches with minimal effort. Rivets.js allows you to describe in your markup how your data should be rendered, and then handles automatically updating the DOM when that model data changes. With Cart.js, this allows us to describe a template for our cart that will be automatically updated whenever the cart changes.

You can see an example of this in action below:
`include ../index/sections/demo-advanced-code.md`

[front page]: /
[Rivets.js documentation]: http://rivetsjs.com/
[Rivets.js]: http://rivetsjs.com/
