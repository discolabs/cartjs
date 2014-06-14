// Cart.js
// version: 0.0.1
// author: Gavin Ballard
// license: MIT
(function() {
  var Cart, addItem, clearItems, commit, enqueue, getAttribute, getAttributes, getNote, pendingQueue, process, processing, processingQueue, removeItem, setAttribute, setAttributes, setNote, updateItem;

  Cart = {
    settings: {
      autoCommit: false
    },
    cart: null
  };

  pendingQueue = [];

  processingQueue = [];

  processing = false;

  enqueue = function(url, data, callback, type, dataType) {
    var queue;
    if (type == null) {
      type = 'POST';
    }
    if (dataType == null) {
      dataType = 'json';
    }
    queue = pendingQueue;
    if (processing && Cart.settings.autoCommit) {
      queue = processingQueue;
    }
    queue.push({
      url: url,
      data: data,
      callback: callback,
      type: type,
      dataType: dataType
    });
    if (Cart.settings.autoCommit) {
      return commit();
    }
  };

  commit = function() {
    if (processing) {
      return;
    }
    processing = true;
    [].push.apply(processingQueue, pendingQueue.splice(0, pendingQueue.length));
    return process();
  };

  process = function() {
    var params;
    if (!processingQueue.length) {
      processing = false;
      return;
    }
    params = processingQueue.shift();
    params.complete = process;
    return jQuery.ajax(params);
  };

  addItem = function(id, quantity, properties) {
    var data;
    if (quantity == null) {
      quantity = 1;
    }
    if (properties == null) {
      properties = {};
    }
    data = wrapKeys(properties, 'properties');
    data.id = id;
    data.quantity = quantity;
    enqueue('/cart/add.js', data);
  };

  updateItem = function(line, quantity, properties) {
    var data;
    if (quantity == null) {
      quantity = 1;
    }
    if (properties == null) {
      properties = {};
    }
    data = wrapKeys(properties, 'properties');
    data.line = line;
    data.quantity = quantity;
    enqueue('/cart/change.js', data);
  };

  removeItem = function(line) {
    updateItem(line, 0);
  };

  clearItems = function() {
    enqueue('/cart/clear.js');
  };

  getAttribute = function(attributeName, defaultValue) {
    if (attributeName in Cart.cart.attributes) {
      return Cart.cart.attributes[attributeName];
    } else {
      return defaultValue;
    }
  };

  setAttribute = function(attributeName, value) {
    var attributes;
    attributes = {};
    attributes[attributeName] = value;
    setAttributes(attributes);
  };

  getAttributes = function() {
    return Cart.cart.attributes;
  };

  setAttributes = function(attributes) {
    var wrappedAttributes;
    if (attributes == null) {
      attributes = {};
    }
    wrappedAttributes = wrapKeys(attributes);
    enqueue('/cart/update.js', wrappedAttributes);
  };

  getNote = function() {
    return Cart.cart.note;
  };

  setNote = function(note) {
    enqueue('/cart/update.js', {
      note: note
    });
  };

  Cart.factory = function(exports) {
    exports._ = Cart;
    exports.settings = Cart.settings;
    exports.configure = function(settings) {
      var setting, value;
      if (settings == null) {
        settings = {};
      }
      for (setting in settings) {
        value = settings[setting];
        Cart.settings[setting] = value;
      }
    };
    exports.init = function(cart, settings) {
      if (settings == null) {
        settings = {};
      }
      Cart.cart = cart;
      exports.configure(settings);
    };
    exports.commit = commit;
    exports.addItem = addItem;
    exports.removeItem = removeItem;
    exports.updateItem = updateItem;
    exports.clearItems = clearItems;
    exports.getAttribute = getAttribute;
    exports.setAttribute = setAttribute;
    exports.getAttributes = getAttributes;
    exports.setAttributes = setAttributes;
    exports.getNote = getNote;
    return exports.setNote = setNote;
  };

  if (typeof exports === 'object') {
    Cart.factory(exports);
  } else if (typeof define === 'function' && define.amd) {
    define(['exports'], function(exports) {
      Cart.factory(this.Cart = exports);
      return exports;
    });
  } else {
    Cart.factory(this.Cart = {});
  }

}).call(this);
