`model.property | weight_with_unit`

Returns the property converted to the `weightUnit` set in the CartJS initializer (see [Options: weightUnit][]), with that unit appended onto the output (e.g. **0.5kg**)

```html
  <div rv-text="item.price | weight">
    <!-- Item weight converted to set unit, including unit -->
  </div>
```

<div class="callout callout-warning">
  <p style="margin-bottom: 0;">
    If using the `weight` formatter, make sure that you have set the relevant options when initialising Cart.JS to provide your store's weight unit (see [Options: weightUnit][]), and required precision (see [Options: weightPrecision][]).
  </p>
</div>
[Options: weightUnit]: #options-weight-unit
[Options: weightPrecision]: #options-weight-precision