// Cart.js
// version: 0.0.1
// author: Gavin Ballard
// license: MIT
(function() {
  var Cart, pendingQueue, processing, processingQueue;

  Cart = {
    settings: {
      autoCommit: false
    },
    cart: null
  };

  pendingQueue = [];

  processingQueue = [];

  processing = false;

  Cart.enqueue = function(url, data, callback, type, dataType) {
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
      return Cart.commit();
    }
  };

  Cart.commit = function() {
    if (processing) {
      return;
    }
    processing = true;
    [].push.apply(processingQueue, pendingQueue.splice(0, pendingQueue.length));
    return Cart.process();
  };

  Cart.process = function() {
    var params;
    if (!processingQueue.length) {
      processing = false;
      return;
    }
    params = processingQueue.shift();
    params.complete = process;
    return jQuery.ajax(params);
  };

  Cart.addItem = function(id, quantity, properties) {
    var data;
    if (quantity == null) {
      quantity = 1;
    }
    if (properties == null) {
      properties = {};
    }
    data = Cart.wrapKeys(properties, 'properties');
    data.id = id;
    data.quantity = quantity;
    return enqueue('/cart/add.js', data);
  };

  Cart.updateItem = function(line, quantity, properties) {
    var data;
    if (quantity == null) {
      quantity = 1;
    }
    if (properties == null) {
      properties = {};
    }
    data = Cart.wrapKeys(properties, 'properties');
    data.line = line;
    data.quantity = quantity;
    return enqueue('/cart/change.js', data);
  };

  Cart.removeItem = function(line) {
    return Cart.updateItem(line, 0);
  };

  Cart.clearItems = function() {
    return enqueue('/cart/clear.js');
  };

  Cart.getAttribute = function(attributeName, defaultValue) {
    if (attributeName in Cart.cart.attributes) {
      return Cart.cart.attributes[attributeName];
    } else {
      return defaultValue;
    }
  };

  Cart.setAttribute = function(attributeName, value) {
    Cart.cart.attributes[attributeName] = value;
  };

  Cart.getAttributes = function() {
    return Cart.cart.attributes;
  };

  Cart.setAttributes = function(attributes) {
    var attributeName, value;
    if (attributes == null) {
      attributes = {};
    }
    for (attributeName in attributes) {
      value = attributes[attributeName];
      Cart.setAttribute(attributeName, value);
    }
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
    exports.commit = Cart.commit;
    exports.addItem = Cart.addItem;
    exports.removeItem = Cart.removeItem;
    exports.updateItem = Cart.updateItem;
    exports.clearItems = Cart.clearItems;
    exports.getAttribute = Cart.getAttribute;
    exports.setAttribute = Cart.setAttribute;
    exports.getAttributes = Cart.getAttributes;
    return exports.setAttributes = Cart.setAttributes;
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
