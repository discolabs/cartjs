# CartJS.Item
# Wraps a normal cart item JSON object to provide additional functionality.
# ---------------------


class CartJS.Item

  constructor: (item) ->
    @update(item)

  update: (item) =>
    for key, value of item
        @[key] = value