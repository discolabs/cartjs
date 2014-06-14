# Methods related to setting and getting cart attributes.
# -------------------------------------------------------

Cart.getAttribute = (attributeName, defaultValue) ->
  if attributeName of Cart.cart.attributes then Cart.cart.attributes[attributeName] else defaultValue

Cart.setAttribute = (attributeName, value) ->
  Cart.cart.attributes[attributeName] = value
  return

Cart.getAttributes = () ->
  Cart.cart.attributes

Cart.setAttributes = (attributes = {}) ->
  for attributeName, value of attributes
    Cart.setAttribute(attributeName, value)
  return