# Export the Cart module.
# -----------------------

# Cart.js module factory.
Cart.factory = (exports) ->
  # Exposes the full Cart namespace. This is mainly used for isolated testing.
  exports._ = Cart

  # Exposes the settings object.
  exports.settings = Cart.settings

  # Merges an object literal onto the setting object.
  exports.configure = (settings = {}) ->
    for setting, value of settings
      Cart.settings[setting] = value
    return

  # Initialises Cart.js
  exports.init = (cart, settings = {}) ->
    Cart.cart = cart
    exports.configure(settings)
    return

  # General methods.
  exports.commit = commit;

  # Item manipulation methods.
  exports.addItem = addItem
  exports.removeItem = removeItem
  exports.updateItem = updateItem
  exports.clearItems = clearItems

  # Attribute methods.
  exports.getAttribute = getAttribute
  exports.setAttribute = setAttribute
  exports.getAttributes = getAttributes
  exports.setAttributes = setAttributes
  exports.getNote = getNote
  exports.setNote = setNote

# Exports Cart.js for CommonJS, AMD and the browser.
if typeof exports == 'object'
  Cart.factory(exports)
else if typeof define == 'function' && define.amd
  define ['exports'], (exports) ->
    Cart.factory(@Cart = exports)
    return exports
else
  Cart.factory(@Cart = {})