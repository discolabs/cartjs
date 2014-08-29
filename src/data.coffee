# CartJS.Data
# Data API for CartJS.
# --------------------

CartJS.Data =

  # Bind the document to listen for data-* API events.
  bind: () ->
    jQuery(document).on('click', '[data-cart-add]', CartJS.Data.add)
    jQuery(document).on('click', '[data-cart-remove]', CartJS.Data.remove)
    jQuery(document).on('change', '[data-cart-toggle]', CartJS.Data.toggle)
    jQuery(document).on('change', '[data-cart-toggle-attribute]', CartJS.Data.toggleAttribute)
    jQuery(document).on('submit', '[data-cart-submit]', CartJS.Data.submit)

  # @TODO
  unbind: () ->
    return

  # Handler for [data-cart-add] click events.
  add: (e) ->
    e.preventDefault()
    id = jQuery(e.target).attr('data-cart-add')
    CartJS.Core.addItem(id)

  # Handler for [data-cart-remove] click events.
  remove: (e) ->
    e.preventDefault()
    line = jQuery(e.target).attr('data-cart-remove')
    CartJS.Core.removeItem(line)

  # Handler for [data-cart-toggle] change events.
  toggle: (e) ->
    $input = jQuery(e.target)
    id = $input.attr('data-cart-toggle')
    if $input.is(':checked')
      CartJS.Core.addItem(id)
    else
      CartJS.Core.removeAll(id)

  # Handler for [data-cart-toggle-attribute] change events.
  toggleAttribute: (e) ->
    $input = jQuery(e.target)
    attribute = $input.attr('data-cart-toggle-attribute')
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
