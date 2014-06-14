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
  exports.commit = Cart.commit;

  # Item manipulation methods.
  exports.addItem = Cart.addItem
  exports.removeItem = Cart.removeItem
  exports.updateItem = Cart.updateItem
  exports.clearItems = Cart.clearItems

  # Attribute methods.
  exports.getAttribute = Cart.getAttribute
  exports.setAttribute = Cart.setAttribute
  exports.getAttributes = Cart.getAttributes
  exports.setAttributes = Cart.setAttributes

# Exports Cart.js for CommonJS, AMD and the browser.
if typeof exports == 'object'
  Cart.factory(exports)
else if typeof define == 'function' && define.amd
  define ['exports'], (exports) ->
    Cart.factory(@Cart = exports)
    return exports
else
  Cart.factory(@Cart = {})