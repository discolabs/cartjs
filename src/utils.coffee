# CartJS.Utils
# Utility methods.
# ----------------

CartJS.Utils =

  # Returns the given object with each key wrapped with the text specified by
  # the 'type' parameter and square brackets, suitable for passing as a POST
  # variable to Shopify. 'type' defaults to 'properties'.
  #
  # For example, {"size": "xs"} becomes {"properties[size]": "xs"}.
  #
  # If 'override' is provided, the actual values in obj will be ignored and
  # all values will be set to that of the override. This is primarily useful
  # when wanting to reset values by setting them to an empty string. Note
  # null values for override will be ignored.
  wrapKeys: (obj, type = 'properties', override) ->
    wrapped = {}
    for key, value of obj
      wrapped["#{type}[#{key}]"] = if override? then override else value
    wrapped

  # Perform the opposite function to wrapKeys above.
  #
  # For example, {"properties[size]": "xs"} becomes {"size": "xs"}.
  unwrapKeys: (obj, type = 'properties', override) ->
    unwrapped = {}
    for key, value of obj
      unwrappedKey = key.replace("#{type}[", "").replace("]", "")
      unwrapped[unwrappedKey] = if override? then override else value
    unwrapped

  # Extend a source object with the properties of another object.
  #
  # Can be used to shallow copy an object like so:
  #   copy = extend({}, original)
  extend: (object, properties) ->
    for key, val of properties
      object[key] = val
    object

  # Clone a source object (deep copy).
  clone: (object) ->
    if not object? or typeof object isnt 'object'
      return object
    newInstance = new object.constructor()
    for key of object
      newInstance[key] = clone object[key]
    return newInstance

  # Format a monetary amount using Shopify's formatMoney if available.
  #
  # If it's not available, just return the value.
  formatMoney: (value, format) ->
    if window.Shopify?.formatMoney? then Shopify.formatMoney(value, format)  else value

  # Return a resized image URL using Shopify's getSizedImageUrl if available.
  #
  # If it's not available, just return the original URL.
  getSizedImageUrl: (src, size) ->
    if window.Shopify?.Image?.getSizedImageUrl? then Shopify.Image.getSizedImageUrl(src, size) else src

