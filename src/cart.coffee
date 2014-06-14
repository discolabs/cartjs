# CartJS.Cart
# Wraps a normal cart JSON object to provide additional functionality.
# ---------------------

class CartJS.Cart

  constructor: (cart) ->
    @update(cart)

  update: (cart) =>
    for key, value of cart
      unless key == 'items'
        @[key] = value
    @items = (new CartJS.Item(item) for item in cart.items)