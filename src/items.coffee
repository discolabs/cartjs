# Item manipulation methods.
# --------------------------

Cart.addItem = (id, quantity = 1, properties = {}) ->
  data = Cart.wrapKeys(properties, 'properties')
  data.id = id
  data.quantity = quantity
  enqueue '/cart/add.js', data

Cart.updateItem = (line, quantity = 1, properties = {}) ->
  data = Cart.wrapKeys(properties, 'properties')
  data.line = line
  data.quantity = quantity
  enqueue '/cart/change.js', data

Cart.removeItem = (line) ->
  Cart.updateItem line, 0

Cart.clearItems = () ->
  enqueue '/cart/clear.js'