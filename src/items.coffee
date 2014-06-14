# Item manipulation methods.
# --------------------------

addItem = (id, quantity = 1, properties = {}) ->
  data = wrapKeys(properties, 'properties')
  data.id = id
  data.quantity = quantity
  enqueue '/cart/add.js', data
  return

updateItem = (line, quantity = 1, properties = {}) ->
  data = wrapKeys(properties, 'properties')
  data.line = line
  data.quantity = quantity
  enqueue '/cart/change.js', data
  return

removeItem = (line) ->
  updateItem line, 0
  return

clearItems = () ->
  enqueue '/cart/clear.js'
  return