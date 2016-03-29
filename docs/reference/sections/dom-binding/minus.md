`model.property | minus value`

Returns the result of `parseInt(model.property) - parseInt(value)`.

```html
  <div rv-text="item.quantity | minus 1">
    <!-- The value of the item's quantity, minus 1 -->
  </div>
```

<div class="callout callout-warning">
  <p style="margin-bottom: 0;">
    The `minus` formatter casts both values to integers before performing the subtraction, so this is only suitable where both values will only be integers.
        The `minus` formatter will cast the provided value to an integer; therefore, it is important that a float is not used as the value.
  </p>
</div>