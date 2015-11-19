`model.property | includes 'value'`

Returns `true` if the `value` is present within the `property`.

```html
  <div rv-show="item.title | includes 'Shirt'">
    //...
  </div>
```

This also works with arrays:

```html
  <div rv-show="item.variant_options | includes 'Blue'">
    //...
  </div>
```

<div class="callout callout-warning">
  <p style="margin-bottom: 0;">
    The `includes` formatter is case-sensitive. For a case-insensitive option, see [match]
  </p>
</div>

[match]: #dom-binding-match