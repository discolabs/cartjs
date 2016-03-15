`model.property | plus value`

Returns the result of `parseInt(model.property) + parseInt(value)`.

```html
  <div>
    { item.quantity | plus 1 }
  </div>
```

<div class="callout callout-warning">
  <p style="margin-bottom: 0;">
    The `plus` formatter casts both values to integers before performing the addition, so this is only suitable where both values will only be integers.
  </p>
</div>