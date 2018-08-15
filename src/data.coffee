# CartJS.Data
# Data API for CartJS.
# --------------------

# Reference to the document element.
$document = null

CartJS.Data =

  # Initialise the Data API.
  init: () ->
    $document = jQuery(document)
    CartJS.Data.setEventListeners('on')
    CartJS.Data.render(null, CartJS.cart)

  # Tear down the Data API.
  destroy: () ->
    CartJS.Data.setEventListeners('off')

  # Bind or unbind listeners for Data API events.
  setEventListeners: (method) ->
    # Attach or remove event listeners for data-cart-* events.
    $document[method]('click', '[data-cart-add]', CartJS.Data.add)
    $document[method]('click', '[data-cart-remove]', CartJS.Data.remove)
    $document[method]('click', '[data-cart-remove-id]', CartJS.Data.removeById)
    $document[method]('click', '[data-cart-update]', CartJS.Data.update)
    $document[method]('click', '[data-cart-update-id]', CartJS.Data.updateById)
    $document[method]('click', '[data-cart-clear]', CartJS.Data.clear)
    $document[method]('change', '[data-cart-toggle]', CartJS.Data.toggle)
    $document[method]('change', '[data-cart-toggle-attribute]', CartJS.Data.toggleAttribute)
    $document[method]('submit', '[data-cart-submit]', CartJS.Data.submit)

    # Attach or remove event listeners for data-cart-render events.
    $document[method]('cart.requestComplete', CartJS.Data.render);

  # Handler for [data-cart-add] click events.
  add: (e) ->
    e.preventDefault()
    $this = jQuery(this)
    CartJS.Core.addItem $this.attr('data-cart-add'), $this.attr('data-cart-quantity')

  # Handler for [data-cart-remove] click events.
  remove: (e) ->
    e.preventDefault()
    $this = jQuery(this)
    CartJS.Core.removeItem $this.attr('data-cart-remove')

  # Handler for [data-cart-remove-id] click events.
  removeById: (e) ->
    e.preventDefault()
    $this = jQuery(this)
    CartJS.Core.removeItemById $this.attr('data-cart-remove-id')

  # Handler for [data-cart-update] click events.
  update: (e) ->
    e.preventDefault()
    $this = jQuery(this)
    CartJS.Core.updateItem $this.attr('data-cart-update'), $this.attr('data-cart-quantity')

  # Handler for [data-cart-update-id] click events.
  updateById: (e) ->
    e.preventDefault()
    $this = jQuery(this)
    CartJS.Core.updateItemById $this.attr('data-cart-update-id'), $this.attr('data-cart-quantity')

  # Handler for [data-cart-clear] click events.
  clear: (e) ->
    e.preventDefault()
    CartJS.Core.clear()

  # Handler for [data-cart-toggle] change events.
  toggle: (e) ->
    $input = jQuery(this)
    id = $input.attr('data-cart-toggle')
    if $input.is(':checked')
      CartJS.Core.addItem(id)
    else
      CartJS.Core.removeItemById(id)

  # Handler for [data-cart-toggle-attribute] change events.
  toggleAttribute: (e) ->
    $input = jQuery(this)
    attribute = $input.attr('data-cart-toggle-attribute')
    CartJS.Core.setAttribute(attribute, if $input.is(':checked') then 'Yes' else '')

  # Handle for [data-cart-submit] submit events.
  submit: (e) ->
    e.preventDefault()

    dataArray = jQuery(this).serializeArray()

    id = undefined
    quantity = undefined
    properties = {}
    jQuery.each dataArray, (i, item) ->
      if item.name == 'id'
        id = item.value
      else if item.name == 'quantity'
        quantity = item.value
      else if item.name.match /^properties\[\w+\]$/
        properties[item.name] = item.value

    CartJS.Core.addItem(id, quantity, CartJS.Utils.unwrapKeys(properties))

  # Handler for rendering simple cart properties to bound elements.
  render: (e, cart) ->
    # Build a hash of render context.
    context = {
      'item_count': cart.item_count,
      'total_price': cart.total_price,
      'total_price_money': CartJS.Utils.formatMoney(cart.total_price, CartJS.settings.moneyFormat, 'money_format', if Currency?.currentCurrency? then Currency.currentCurrency),
      'total_price_money_with_currency': CartJS.Utils.formatMoney(cart.total_price, CartJS.settings.moneyWithCurrencyFormat, 'money_with_currency_format', if Currency?.currentCurrency? then Currency.currentCurrency),
    }

    # Render the context to elements as needed.
    jQuery('[data-cart-render]').each ()->
      $this = jQuery(this)
      $this.html context[$this.attr('data-cart-render')]
