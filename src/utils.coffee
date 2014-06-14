# CartJS.Utils
# Utility methods.
# ----------------

CartJS.Utils =

  # Returns the given object with each key wrapped with the text specified by
  # the 'type' parameter and square brackets, suitable for passing as a POST
  # variable to Shopify. 'type' defaults to 'properties'.
  #
  # For example, {"size": "xs"} becomes {"properties[size]": "xs"}.
  wrapKeys: (obj, type = 'properties') ->
    wrapped = {}
    for key, value of obj
      wrapped["#{type}[#{key}]"] = value
    wrapped