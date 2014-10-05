# CartJS.Cart
# Wraps a normal cart JSON object to provide additional functionality.
# ---------------------

class Cart

  # Update the cart object in a way that doesn't destroy existing values.
  #
  # Implemented like this instead of a direct assignment to prevent interference with any data bindings.
  update: (cart) =>
    for key, value of cart
      unless key == 'items'
        @[key] = value
    @items = (new Item(item) for item in cart.items)
