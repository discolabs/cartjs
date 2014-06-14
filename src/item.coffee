# CartJS.Item
# Wraps a normal cart item JSON object to provide additional functionality.
# ---------------------


class CartJS.Item

  constructor: (item) ->
    @update(item)

  update: (item) =>
    for key, value of item
        @[key] = value

  # Returns the properties of this item as an array of objects with name/value
  # properties. Useful when you'd like to iterate properties without knowing
  # in advance what they'll be.
  propertyArray: () =>
    ({ name: name, value: value } for name, value of @properties)