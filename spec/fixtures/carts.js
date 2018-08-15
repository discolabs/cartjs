window.Fixtures = (function(Fixtures, $) {

  var _carts = {};

  // Empty cart fixture.
  _carts.empty = {
    "token": null,
    "note": null,
    "attributes": {},
    "total_price": 0,
    "total_discount": 0,
    "total_weight": 0,
    "item_count": 0,
    "items": [],
    "requires_shipping": false
  };

  Fixtures.getCart = function(name) {
    return $.extend(true, {}, _carts[name]);
  };

  return Fixtures;

})(window.Fixtures || {}, jQuery);
