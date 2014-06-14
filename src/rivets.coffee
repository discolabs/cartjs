# CartJS.Rivets
# Adds Rivets.js functionality to CartJS if rivets is available.
# --------------------------------------------------------------

if 'rivets' of window

  CartJS.Rivets =

    views: []

    bindElements: (models) ->
      CartJS.Rivets.unbindElements()
      jQuery('[data-cart-view]').each () ->
        CartJS.Rivets.views.push(rivets.bind(this, models))

    unbindElements: () ->
      for view in CartJS.Rivets.views
        view.unbind()
      CartJS.Rivets.views = []

else

  CartJS.Rivets =

    bindElements: () ->

    unbindElements: () ->