# The CartJS namespace.
# ---------------------

CartJS =
  # Default settings, publicly accessible on `module.settings`.
  settings:
    autoCommit: true

  # Our extended cart model.
  cart: null

CartJS.init = (cart, settings = {}) ->
  CartJS.configure(settings)
  CartJS.cart = new CartJS.Cart(cart)
  CartJS.Rivets.bindElements {
    cart: CartJS.cart
  }

CartJS.configure = (settings = {}) ->
  for setting, value of settings
    CartJS.settings[setting] = value
  return