# CartJS.Rivets
# Adds Rivets.js functionality to CartJS if rivets is available.
# --------------------------------------------------------------

if 'rivets' of window

  # Add the
  CartJS.Rivets =

    views: []

    bindElements: (models) ->
      CartJS.Rivets.unbindElements()
      jQuery('[data-cart-view]').each () ->
        CartJS.Rivets.views.push(rivets.bind(this, models))

    unbindElements: () ->
      for view in CartJS.Rivets.views
        view.unbind()
      CartJS.Rivets.views = []

  # Add useful formatters to Rivets.js
  rivets.formatters.lt = (a, b) ->
    a < b

  rivets.formatters.gt = (a, b) ->
    a > b

  # If Shopify money formatter is available, add formatters to Rivets.js
  if 'Shopify' of window
    if 'formatMoney' of window.Shopify
      rivets.formatters.money = (value) ->
        Shopify.formatMoney(value, CartJS.settings.money_format)

      rivets.formatters.money_with_currency = (value) ->
        Shopify.formatMoney(value, CartJS.settings.money_with_currency_format)

else

  CartJS.Rivets =

    bindElements: () ->

    unbindElements: () ->