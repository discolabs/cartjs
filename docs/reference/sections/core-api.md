The "Core" API for Cart.js includes all the methods you need to dynamically manipulate the cart.

All of these methods are available on the global `CartJS` object.
They can be called from anywhere - an event handler, your startup code, event in an `onclick=""` attribute if you're feeling old school.

#### `getCart()`
Fetch the current cart status from the server.

#### `addItem(id, quantity = 1, properties = {})`
Add a product variant with the given `id` to the cart.
