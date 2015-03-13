# CartJS.Queue
# Queue management for synchronous AJAX requests.
# -----------------------------------------------

queue = []
processing = false

CartJS.Queue =

  # Add a new request to the queue. Starts processing the queue if we're not already doing so.
  add: (url, data, options = {}) ->
    # Set up request from arguments and options.
    request =
      url: url
      data: data
      type: options.type || 'POST'
      dataType: options.dataType || 'json'
      success: CartJS.Utils.ensureArray(options.success)
      error: CartJS.Utils.ensureArray(options.error)
      complete: CartJS.Utils.ensureArray(options.complete)

    # Add the cart update method as a success callback if required.
    if options.updateCart
      request.success.push(CartJS.cart.update)

    # Add request to the queue.
    queue.push(request)

    # Don't need to start processing if we're already doing it.
    return if processing

    # Start processing.
    jQuery(document).trigger('cart.requestStarted', [CartJS.cart]);
    CartJS.Queue.process()

  # Process the next item in the queue, if there is one.
  process: () ->
    if not queue.length
      processing = false
      jQuery(document).trigger('cart.requestComplete', [CartJS.cart]);
      return

    processing = true
    params = queue.shift()
    params.complete = CartJS.Queue.process
    jQuery.ajax(params)
