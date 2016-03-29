`model.property | not`

Returns an inversion of the passed in property

```html
  <div rv-show="item.requires_shipping | not">
    <!-- Element will be shown if the item does not require shipping -->
  </div>
```

This is particularly useful when chaining formatters e.g.
 
 ```html
  <div rv-show="item.variant_options | includes 'Blue' | not">
    <!-- Element will be shown if the item's variant_options does not contain an element equalling 'Blue' -->
  </div>
 ```