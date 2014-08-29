# The CartJS namespace.
# ---------------------

CartJS =
  # Default settings, publicly accessible on `module.settings`.
  settings:
    autoCommit: true
    dataAPI: false
    requestBodyClass: null
    rivetsModels: {}

  # Our extended cart model.
  cart: null

# Initialisation method. Should be called at the bottom of the page template (usually at the bottom of theme.liquid),
# being passed a JSON representation of the current cart plus an option settings objects. For example:
#
#   <script type="text/javascript">
#     CartJS.init({{ cart | json }}, {
#       dataAPI: true
#     });
#   </script>
#
CartJS.init = (cart, settings = {}) ->
  # Configure settings from any passed settings hash.
  CartJS.configure(settings)

  # Instantiate the new cart object.
  CartJS.cart = new CartJS.Cart(cart)

  # Set up data-cart-* API if enabled.
  if CartJS.settings.dataAPI
    CartJS.Data.bind()

  # Set up toggling of CSS class on body during requests if provided.
  if CartJS.settings.requestBodyClass
    $(document).on 'cart.requestStarted', () -> $('body').addClass(CartJS.settings.requestBodyClass)
    $(document).on 'cart.requestComplete', () -> $('body').removeClass(CartJS.settings.requestBodyClass)

  # Set up Rivets.js views. Won't do anything if Rivets.js is unavailable.
  CartJS.Rivets.bindElements()

# Configure CartJS with the given settings object.
CartJS.configure = (settings = {}) ->
  CartJS.Utils.extend(CartJS.settings, settings)
