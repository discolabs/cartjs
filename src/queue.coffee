# CartJS.Queue
# Queue management for synchronous AJAX requests.
# -----------------------------------------------

queue = []
processing = false

CartJS.Queue =

  # Add a new request to the queue. Starts processing the queue if we're not
  # already doing so.
  add: (url, data, callback, type = 'POST', dataType = 'json') ->
    queue.push({
      url: url,
      data: data,
      success: callback,
      type: type,
      dataType: dataType
    })

    # Don't need to start processing if we're already doing it.
    return if processing

    # Start processing.
    jQuery(document).trigger('cart.requestStarted');
    CartJS.Queue.process()

  # Process the next item in the queue, if there is one.
  process: () ->
    if not queue.length
      processing = false
      jQuery(document).trigger('cart.requestComplete');
      return

    processing = true
    params = queue.shift()
    params.complete = CartJS.Queue.process
    jQuery.ajax(params)