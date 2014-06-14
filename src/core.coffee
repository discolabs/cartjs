# CartJS.Core
# Core API methods for manipulating carts.
# ----------------------------------------

CartJS.Core =

  # Fetch updated cart object from API endpoint.
  getCart: () ->
    CartJS.Queue.add '/cart.js', {}, undefined, 'GET'

  # Add a new line item to the cart.
  addItem: (id, quantity = 1, properties = {}) ->
    data = CartJS.Utils.wrapKeys(properties)
    data.id = id
    data.quantity = quantity
    CartJS.Queue.add '/cart/add.js', data

  # Update an existing line item.
  updateItem: (line, quantity = 1, properties = {}) ->
    data = CartJS.Utils.wrapKeys(properties)
    data.line = line
    data.quantity = quantity
    CartJS.Queue.add '/cart/change.js', data

  # Remove an existing line item.
  removeItem: (line) ->
    CartJS.Core.updateItem line, 0

  # Clear all items from the cart.
  clear: () ->
    CartJS.Queue.add '/cart/clear.js'

  # Get a cart attribute.
  getAttribute: (attributeName, defaultValue) ->
    if attributeName of CartJS.cart.attributes then CartJS.cart.attributes[attributeName] else defaultValue

  # Set a cart attribute.
  setAttribute: (attributeName, value) ->
    attributes = {}
    attributes[attributeName] = value
    setAttributes(attributes)

  # Get all cart attributes as a hash.
  getAttributes: () ->
    CartJS.cart.attributes

  # Set multiple cart attributes using a hash.
  setAttributes: (attributes = {}) ->
    CartJS.Queue.add '/cart/update.js', CartJS.Utils.wrapKeys(attributes, 'attributes')

  # Get the cart note.
  getNote: () ->
    CartJS.cart.note

  # Set the cart note.
  setNote: (note) ->
    CartJS.Queue.add '/cart/update.js', { note: note }