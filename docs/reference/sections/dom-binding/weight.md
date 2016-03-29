`model.property | weight`

Returns the property converted to the `weightUnit` set in the CartJS initializer (see [Options: weightUnit][]).

```html
  <div rv-text="item.price | weight">
    <!-- Item weight converted to set unit -->
  </div>
```

<div class="callout callout-warning">
  <p style="margin-bottom: 0;">
    If using the `weight` formatter, make sure that you have set the relevant options when initialising Cart.JS to provide your store's weight unit (see [Options: weightUnit][]), and required precision (see [Options: weightPrecision][]).
  </p>
</div>
[Options: weightUnit]: #options-weight-unit
[Options: weightPrecision]: #options-weight-precision