# CartJS.IE8
# IE8 (non-ES5) specific code.
# ----------------------------------------

if 'rivets' of window

  CartJS.IE8 =

    # Initialise IE8 compatibility.
    init: () ->
      CartJS.Utils.log('Initialising IE8 compatibility module.')
      jQuery(document).on 'cart.requestComplete', CartJS.IE8.rebindViews

    # Tear down IE8 compatibility.
    destroy: () ->
      CartJS.Utils.log('Tearing down IE8 compatibility module.')
      jQuery(document).off 'cart.requestComplete', CartJS.IE8.rebindViews

    # Rebind all Rivets.js views to force an update in non-ES5 browsers.
    rebindViews: () ->
      for view in CartJS.Rivets.boundViews
        view.unbind()
        view.update(CartJS.Rivets.model)
        view.sync()
        view.bind()
        view.update(CartJS.Rivets.model)
        view.sync()

else

  # Rivets.js isn't loaded, so simply define no-ops.
  CartJS.IE8 =

    init: () ->

    destroy: () ->
