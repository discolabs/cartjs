# CartJS.Item
# Wraps a normal cart item JSON object to provide additional functionality.
# ---------------------


class Item

  constructor: (item) ->
    @update(item)

  # Update this item in a way that doesn't destroy existing values.
  #
  # Implemented like this instead of a direct assignment to prevent interference with any data bindings.
  update: (item) =>
    for key, value of item
      unless key == 'properties'
        @[key] = value
    @properties = CartJS.Utils.extend {}, item.properties

  # Returns the properties of this item as an array of objects with name/value
  # properties. Useful when you'd like to iterate properties without knowing
  # in advance what they'll be.
  propertyArray: () =>
    ({ name: name, value: value } for name, value of @properties)
