# The CartJS namespace.
# ---------------------

CartJS =
  # Default settings, publicly accessible on `module.settings`.
  settings:
    debug: false
    dataAPI: true
    requestBodyClass: null
    rivetsModels: {}
    currency: null
    moneyFormat: null
    moneyWithCurrencyFormat: null
    weightUnit: 'g'
    weightPrecision: 0


  # Our extended cart model.
  cart: new Cart()

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

  # Note that we are initialising the library.
  CartJS.Utils.log('Initialising CartJS.')

  # Update the cart model with the initial cart objects.
  CartJS.cart.update(cart)

  # Initialise the Data API if enabled.
  if CartJS.settings.dataAPI
    CartJS.Utils.log('"dataAPI" setting is true, initialising Data API.')
    CartJS.Data.init()

  # Set up toggling of CSS class on body during requests if provided.
  if CartJS.settings.requestBodyClass
    CartJS.Utils.log('"requestBodyClass" set, adding event listeners.')
    jQuery(document).on 'cart.requestStarted', () -> jQuery('body').addClass(CartJS.settings.requestBodyClass)
    jQuery(document).on 'cart.requestComplete', () -> jQuery('body').removeClass(CartJS.settings.requestBodyClass)

  # Initialise DOM Binding through Rivets module.
  # Performs a no-op if Rivets.js isn't present.
  CartJS.Rivets.init()

  jQuery(document).trigger('cart.ready', [CartJS.cart]);

# Configure CartJS with the given settings object.
CartJS.configure = (settings = {}) ->
  CartJS.Utils.extend(CartJS.settings, settings)

# Add a stubbed out console.log method for browsers that don't implement it.
# Omitting this method can lead to Javascript failures in some browsers.
# See: http://stackoverflow.com/questions/7742781/why-javascript-only-works-after-opening-developer-tools-in-ie-once
unless window.console?
  window.console = {}
  window.console.log = () ->
