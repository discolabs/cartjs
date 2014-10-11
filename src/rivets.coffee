# CartJS.Rivets
# Adds Rivets.js functionality to CartJS if Rivets.js is available.
# -----------------------------------------------------------------

if 'rivets' of window

  # Rivets.js has been loaded, so declare the CartJS.Rivets module.
  CartJS.Rivets =

    # Maintain a list of all bound Rivets.js views so that we can unbind later if needed.
    views: []

    # Initialise the Rivets module.
    init: () ->
      CartJS.Rivets.bindViews()

    # Tear down the Rivets module.
    destroy: () ->
      CartJS.Rivets.unbindViews()

    # Bind all Rivets.js view elements that are currently present on the page.
    bindViews: () ->
      # Unbind any currently bound views.
      CartJS.Rivets.unbindViews()

      # Merge a new models object with any specified in the settings.
      models = CartJS.Utils.extend({
        cart: CartJS.cart
      }, CartJS.settings.rivetsModels)

      # Iterate through and bind all elements marked as Rivets.js views via the [data-cart-view] attribute.
      jQuery('[data-cart-view]').each () ->
        CartJS.Rivets.views.push(rivets.bind(this, models))

    # Unbind all currently bound Rivets.js views.
    unbindViews: () ->
      for view in CartJS.Rivets.views
        view.unbind()
      CartJS.Rivets.views = []

  # Add useful general-purpose formatters for Rivets.js
  rivets.formatters.eq = (a, b) ->
    a == b

  rivets.formatters.lt = (a, b) ->
    a < b

  rivets.formatters.gt = (a, b) ->
    a > b

  rivets.formatters.not = (a) ->
    !a

  rivets.formatters.empty = (a) ->
    !a.length

  rivets.formatters.plus = (a, b) ->
    parseInt(a) + parseInt(b)

  rivets.formatters.minus = (a, b) ->
    parseInt(a) - parseInt(b)

  # Add Shopify-specific formatters for Rivets.js.
  rivets.formatters.money = (value) ->
    CartJS.Utils.formatMoney(value, CartJS.settings.moneyFormat)

  rivets.formatters.money_with_currency = (value) ->
    CartJS.Utils.formatMoney(value, CartJS.settings.moneyWithCurrencyFormat)

  rivets.formatters.productImageSize = (src, size) ->
    CartJS.Utils.getSizedImageUrl(src, size)

else

  # Rivets.js has not been loaded, so just declare a no-operation CartJS.Rivets module.
  CartJS.Rivets =

    init: () ->

    destroy: () ->
