# CartJS.Data
# Data API for CartJS.
# --------------------

CartJS.Data =

  bind: () ->
    jQuery(document).on('click', '[data-cart-add]', CartJS.Data.add);
    jQuery(document).on('click', '[data-cart-remove]', CartJS.Data.remove);

  unbind: () ->
    return

  add: (e) ->
    e.preventDefault()
    id = jQuery(e.target).attr('data-cart-add')
    CartJS.Core.addItem(id)

  remove: (e) ->
    e.preventDefault()
    line = jQuery(e.target).attr('data-cart-remove')
    CartJS.Core.removeItem(line)