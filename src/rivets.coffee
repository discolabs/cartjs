# CartJS.Rivets
# Adds Rivets.js functionality to CartJS if Rivets.js is available.
# -----------------------------------------------------------------

if 'rivets' of window

  # Rivets.js has been loaded, so declare the CartJS.Rivets module.
  CartJS.Rivets =

    # Maintain a reference to the base model object so that we can reference it later.
    model: null

    # Maintain a list of all bound Rivets.js views so that we can unbind later if needed.
    boundViews: []

    # Initialise the Rivets module.
    init: () ->
      CartJS.Rivets.bindViews()

    # Tear down the Rivets module.
    destroy: () ->
      CartJS.Rivets.unbindViews()

    # Bind all Rivets.js view elements that are currently present on the page.
    bindViews: () ->
      CartJS.Utils.log('Rivets.js is present, binding views.')

      # Unbind any currently bound views.
      CartJS.Rivets.unbindViews()

      # Merge a new models object with any specified in the settings.
      CartJS.Rivets.model = CartJS.Utils.extend({
        cart: CartJS.cart
      }, CartJS.settings.rivetsModels)

      # If Shopify's Currency global object is available, add it to the data model.
      # Done so that we can observer Currency.currentCurrency for changes.
      if window.Currency?
        CartJS.Rivets.model.Currency = window.Currency

      # Iterate through and bind all elements marked as Rivets.js views via the [data-cart-view] attribute.
      jQuery('[data-cart-view]').each () ->
        view = rivets.bind(jQuery(this), CartJS.Rivets.model)
        CartJS.Rivets.boundViews.push(view)

    # Unbind all currently bound Rivets.js views.
    unbindViews: () ->
      for view in CartJS.Rivets.boundViews
        view.unbind()
      CartJS.Rivets.boundViews = []

  # Add useful general-purpose formatters for Rivets.js
  rivets.formatters.eq = (a, b) ->
    a == b

  rivets.formatters.includes = (a, b) ->
    a.indexOf(b) >= 0

  rivets.formatters.match = (a, regexp, flags) ->
    a.match(new RegExp(regexp, flags))

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

  rivets.formatters.times = (a, b) ->
    a * b

  rivets.formatters.divided_by = (a, b) ->
    a / b

  rivets.formatters.modulo = (a, b) ->
    a % b

  rivets.formatters.prepend = (a, b) ->
    b + a

  rivets.formatters.append = (a, b) ->
    a + b

  rivets.formatters.slice = (value, start, end) ->
    value.slice(start, end)

  rivets.formatters.pluralize = (input, singular, plural = singular + 's') ->
    input = input.length if CartJS.Utils.isArray(input)
    if input == 1 then singular else plural

  rivets.formatters.array_element = (array, index) ->
    array[index];

  rivets.formatters.array_first = (array) ->
    array[0];

  rivets.formatters.array_last = (array) ->
    array[array.length - 1];

  # Add Shopify-specific formatters for Rivets.js.
  rivets.formatters.money = (value, currency) ->
    CartJS.Utils.formatMoney(value, CartJS.settings.moneyFormat, 'money_format', currency)

  rivets.formatters.money_with_currency = (value, currency) ->
    CartJS.Utils.formatMoney(value, CartJS.settings.moneyWithCurrencyFormat, 'money_with_currency_format', currency)

  rivets.formatters.weight = (grams) ->
    switch CartJS.settings.weightUnit
      when 'kg' then (grams / 1000).toFixed(CartJS.settings.weightPrecision)
      when 'oz' then (grams * 0.035274).toFixed(CartJS.settings.weightPrecision)
      when 'lb' then (grams * 0.00220462).toFixed(CartJS.settings.weightPrecision)
      else grams.toFixed(CartJS.settings.weightPrecision)

  rivets.formatters.weight_with_unit = (grams) ->
    rivets.formatters.weight(grams) + CartJS.settings.weightUnit

  rivets.formatters.product_image_size = (src, size) ->
    CartJS.Utils.getSizedImageUrl(src, size)

  # Add camelCase aliases for underscore formatters.
  rivets.formatters.moneyWithCurrency = rivets.formatters.money_with_currency
  rivets.formatters.weightWithUnit = rivets.formatters.weight_with_unit
  rivets.formatters.productImageSize = rivets.formatters.product_image_size

else

  # Rivets.js has not been loaded, so just declare a no-operation CartJS.Rivets module.
  CartJS.Rivets =

    init: () ->

    destroy: () ->
