# CartJS.Data
# Data API for CartJS.
# --------------------

# Reference to the document element.
$document = jQuery(document)

CartJS.Data =

  # Bind the document to listen for data-* API events.
  bind: () ->
    CartJS.Data.bindOrUnbind('on')

  # Unbind listeners for data-* API events.
  unbind: () ->
    CartJS.Data.bindOrUnbind('off')

  # Bind or unbind listeners for Data API events.
  bindOrUnbind: (method) ->
    $document[method]('click', '[data-cart-add]', CartJS.Data.add)
    $document[method]('click', '[data-cart-remove]', CartJS.Data.remove)
    $document[method]('click', '[data-cart-remove-id]', CartJS.Data.removeById)
    $document[method]('click', '[data-cart-update]', CartJS.Data.update)
    $document[method]('click', '[data-cart-update-id]', CartJS.Data.updateById)
    $document[method]('change', '[data-cart-toggle]', CartJS.Data.toggle)
    $document[method]('change', '[data-cart-toggle-attribute]', CartJS.Data.toggleAttribute)
    $document[method]('submit', '[data-cart-submit]', CartJS.Data.submit)

  # Handler for [data-cart-add] click events.
  add: (e) ->
    e.preventDefault()
    $element = jQuery(e.target)
    CartJS.Core.addItem $element.data('cartAdd'), $element.data('cartQuantity')

  # Handler for [data-cart-remove] click events.
  remove: (e) ->
    e.preventDefault()
    $element = jQuery(e.target)
    CartJS.Core.removeItem $element.data('cartRemove')

  # Handler for [data-cart-remove-id] click events.
  removeById: (e) ->
    e.preventDefault()
    $element = jQuery(e.target)
    CartJS.Core.removeItemById $element.data('cartRemoveId')

  # Handler for [data-cart-update] click events.
  update: (e) ->
    e.preventDefault()
    $element = jQuery(e.target)
    CartJS.Core.updateItem $element.data('cartUpdate'), $element.data('cartQuantity')

  # Handler for [data-cart-update-id] click events.
  updateById: (e) ->
    e.preventDefault()
    $element = jQuery(e.target)
    CartJS.Core.updateItemById $element.data('cartUpdateId'), $element.data('cartQuantity')

  # Handler for [data-cart-toggle] change events.
  toggle: (e) ->
    $input = jQuery(e.target)
    id = $input.data('cartToggle')
    if $input.is(':checked')
      CartJS.Core.addItem(id)
    else
      CartJS.Core.removeAll(id)

  # Handler for [data-cart-toggle-attribute] change events.
  toggleAttribute: (e) ->
    $input = jQuery(e.target)
    attribute = $input.data('cartToggleAttribute')
    CartJS.Core.setAttribute(attribute, if $input.is(':checked') then 'Yes' else '')

  # Handle for [data-cart-submit] submit events.
  submit: (e) ->
    e.preventDefault()

    dataArray = jQuery(e.target).serializeArray()

    id = undefined
    quantity = undefined
    properties = {}
    jQuery.each dataArray, (i, item) ->
      if item.name == 'id'
        id = item.value
      else if item.name == 'quantity'
        quantity = item.value
      else
        properties[item.name] = item.value

    CartJS.Core.addItem(id, quantity, CartJS.Utils.unwrapKeys(properties))
