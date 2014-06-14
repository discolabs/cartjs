# Methods related to setting and getting cart attributes.
# -------------------------------------------------------

getAttribute = (attributeName, defaultValue) ->
  if attributeName of Cart.cart.attributes then Cart.cart.attributes[attributeName] else defaultValue

setAttribute = (attributeName, value) ->
  attributes = {}
  attributes[attributeName] = value
  setAttributes(attributes)
  return

getAttributes = () ->
  Cart.cart.attributes

setAttributes = (attributes = {}) ->
  wrappedAttributes = wrapKeys attributes
  enqueue '/cart/update.js', wrappedAttributes
  return

getNote = () ->
  Cart.cart.note

setNote = (note) ->
  enqueue '/cart/update.js', { note: note }
  return