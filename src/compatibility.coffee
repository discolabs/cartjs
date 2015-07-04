# CartJS.Compatibility
# Compatibility mode code for non-ES5 browsers.
#
# Non-ES5 browsers (namely, IE8) don't support Object.defineProperty(), which
# Rivets.js uses to observe changes on data models and trigger DOM updates.
# This means that by default, users with non-ES5 browsers won't see their pages
# dynamically updating as changes are made to the cart.
#
# This compatibility module provides a workaround for this, and is bundled into
# an alternate version of Cart.js along with ES5 shims. It works by forcibly
# unbinding and rebinding all Rivets views when a Cart.js request completes.
#
# As a result of this workaround, if the cart model is being updated outside of
# Cart.js's regular methods, a CartJS.getCart() call should be made to force a
# re-render on non-ES5 browsers.
# ----------------------------------------

if 'rivets' of window

  CartJS.Compatibility =

    # Initialise non-ES5 compatibility.
    init: () ->
      CartJS.Utils.log('Initialising compatibility module.')
      jQuery(document).on 'cart.requestComplete', CartJS.Compatibility.rebindViews

    # Tear down non-ES5 compatibility.
    destroy: () ->
      CartJS.Utils.log('Tearing down compatibility module.')
      jQuery(document).off 'cart.requestComplete', CartJS.Compatibility.rebindViews

    # Rebind all Rivets.js views to force an update in non-ES5 browsers. It
    # seems odd that we need to unbind(), update(), sync(), bind(), update()
    # and sync() yet again, but that seems to be what's required based on
    # testing.
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
  CartJS.Compatibility =

    init: () ->

    destroy: () ->
