// Cart.js
// version: 0.0.1
// author: Gavin Ballard
// license: MIT
(function() {
  var CartJS, processing, queue,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  CartJS = {
    settings: {
      autoCommit: true
    },
    cart: null
  };

  CartJS.init = function(cart, settings) {
    if (settings == null) {
      settings = {};
    }
    CartJS.configure(settings);
    CartJS.cart = new CartJS.Cart(cart);
    return CartJS.Rivets.bindElements({
      cart: CartJS.cart
    });
  };

  CartJS.configure = function(settings) {
    var setting, value;
    if (settings == null) {
      settings = {};
    }
    for (setting in settings) {
      value = settings[setting];
      CartJS.settings[setting] = value;
    }
  };

  CartJS.Utils = {
    wrapKeys: function(obj, type) {
      var key, value, wrapped;
      if (type == null) {
        type = 'properties';
      }
      wrapped = {};
      for (key in obj) {
        value = obj[key];
        wrapped["" + type + "[" + key + "]"] = value;
      }
      return wrapped;
    }
  };

  queue = [];

  processing = false;

  CartJS.Queue = {
    add: function(url, data, callback, type, dataType) {
      if (type == null) {
        type = 'POST';
      }
      if (dataType == null) {
        dataType = 'json';
      }
      queue.push({
        url: url,
        data: data,
        success: callback,
        type: type,
        dataType: dataType
      });
      if (processing) {
        return;
      }
      jQuery(document).trigger('cart.requestStarted');
      return CartJS.Queue.process();
    },
    process: function() {
      var params;
      if (!queue.length) {
        processing = false;
        jQuery(document).trigger('cart.requestComplete');
        return;
      }
      processing = true;
      params = queue.shift();
      params.complete = CartJS.Queue.process;
      return jQuery.ajax(params);
    }
  };

  CartJS.Cart = (function() {
    function Cart(cart) {
      this.update = __bind(this.update, this);
      this.update(cart);
    }

    Cart.prototype.update = function(cart) {
      var item, key, value;
      for (key in cart) {
        value = cart[key];
        if (key !== 'items') {
          this[key] = value;
        }
      }
      return this.items = (function() {
        var _i, _len, _ref, _results;
        _ref = cart.items;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          item = _ref[_i];
          _results.push(new CartJS.Item(item));
        }
        return _results;
      })();
    };

    return Cart;

  })();

  CartJS.Item = (function() {
    function Item(item) {
      this.update = __bind(this.update, this);
      this.update(item);
    }

    Item.prototype.update = function(item) {
      var key, value, _results;
      _results = [];
      for (key in item) {
        value = item[key];
        _results.push(this[key] = value);
      }
      return _results;
    };

    return Item;

  })();

  CartJS.Core = {
    getCart: function() {
      return CartJS.Queue.add('/cart.js', {}, CartJS.cart.update, 'GET');
    },
    addItem: function(id, quantity, properties) {
      var data;
      if (quantity == null) {
        quantity = 1;
      }
      if (properties == null) {
        properties = {};
      }
      data = CartJS.Utils.wrapKeys(properties);
      data.id = id;
      data.quantity = quantity;
      CartJS.Queue.add('/cart/add.js', data);
      return CartJS.Core.getCart();
    },
    updateItem: function(line, quantity, properties) {
      var data;
      if (quantity == null) {
        quantity = 1;
      }
      if (properties == null) {
        properties = {};
      }
      data = CartJS.Utils.wrapKeys(properties);
      data.line = line;
      data.quantity = quantity;
      return CartJS.Queue.add('/cart/change.js', data, CartJS.cart.update);
    },
    removeItem: function(line) {
      return CartJS.Core.updateItem(line, 0);
    },
    clear: function() {
      return CartJS.Queue.add('/cart/clear.js', {}, CartJS.cart.update);
    },
    getAttribute: function(attributeName, defaultValue) {
      if (attributeName in CartJS.cart.attributes) {
        return CartJS.cart.attributes[attributeName];
      } else {
        return defaultValue;
      }
    },
    setAttribute: function(attributeName, value) {
      var attributes;
      attributes = {};
      attributes[attributeName] = value;
      return setAttributes(attributes);
    },
    getAttributes: function() {
      return CartJS.cart.attributes;
    },
    setAttributes: function(attributes) {
      if (attributes == null) {
        attributes = {};
      }
      return CartJS.Queue.add('/cart/update.js', CartJS.Utils.wrapKeys(attributes, 'attributes'), CartJS.cart.update);
    },
    getNote: function() {
      return CartJS.cart.note;
    },
    setNote: function(note) {
      return CartJS.Queue.add('/cart/update.js', {
        note: note
      }, CartJS.cart.update);
    }
  };

  if ('rivets' in window) {
    CartJS.Rivets = {
      views: [],
      bindElements: function(models) {
        CartJS.Rivets.unbindElements();
        return jQuery('[data-cart-view]').each(function() {
          return CartJS.Rivets.views.push(rivets.bind(this, models));
        });
      },
      unbindElements: function() {
        var view, _i, _len, _ref;
        _ref = CartJS.Rivets.views;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          view = _ref[_i];
          view.unbind();
        }
        return CartJS.Rivets.views = [];
      }
    };
    rivets.formatters.lt = function(a, b) {
      return a < b;
    };
    rivets.formatters.gt = function(a, b) {
      return a > b;
    };
    if ('Shopify' in window) {
      if ('formatMoney' in window.Shopify) {
        rivets.formatters.money = function(value) {
          return Shopify.formatMoney(value, CartJS.settings.money_format);
        };
        rivets.formatters.money_with_currency = function(value) {
          return Shopify.formatMoney(value, CartJS.settings.money_with_currency_format);
        };
      }
    }
  } else {
    CartJS.Rivets = {
      bindElements: function() {},
      unbindElements: function() {}
    };
  }

  CartJS.factory = function(exports) {
    exports._ = CartJS;
    exports.init = CartJS.init;
    exports.configure = CartJS.configure;
    exports.settings = CartJS.settings;
    exports.getCart = CartJS.Core.getCart;
    exports.addItem = CartJS.Core.addItem;
    exports.updateItem = CartJS.Core.updateItem;
    exports.removeItem = CartJS.Core.removeItem;
    exports.clear = CartJS.Core.clear;
    exports.getAttribute = CartJS.Core.getAttribute;
    exports.setAttribute = CartJS.Core.setAttribute;
    exports.getAttributes = CartJS.Core.getAttributes;
    exports.setAttributes = CartJS.Core.setAttributes;
    exports.getNote = CartJS.Core.getNote;
    return exports.setNote = CartJS.Core.setNote;
  };

  if (typeof exports === 'object') {
    CartJS.factory(exports);
  } else if (typeof define === 'function' && define.amd) {
    define(['exports'], function(exports) {
      CartJS.factory(this.CartJS = exports);
      return exports;
    });
  } else {
    CartJS.factory(this.CartJS = {});
  }

}).call(this);
