# The CartJS namespace.
# ---------------------

CartJS =
  # Default settings, publicly accessible on `module.settings`.
  settings:
    autoCommit: true
    dataAPI: false

  # Our extended cart model.
  cart: null

CartJS.init = (cart, settings = {}) ->
  # Configure settings from any passed settings hash.
  CartJS.configure(settings)

  # Instantiate the new cart object.
  CartJS.cart = new CartJS.Cart(cart)

  # Set up data-cart-* API if enabled.
  if CartJS.settings.dataAPI
    CartJS.Data.bind()

  # Set up Rivets.js views. Won't do anything if Rivets.js is unavailable.
  CartJS.Rivets.bindElements {
    cart: CartJS.cart
  }

CartJS.configure = (settings = {}) ->
  for setting, value of settings
    CartJS.settings[setting] = value
  return