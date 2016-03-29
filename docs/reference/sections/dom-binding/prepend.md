`model.property | prepend 'value'`

Returns the result of prepending the value to the property.

```html
  <div rv-text="item.title | prepend 'Title: ">
    <!-- Title: { item.title } -->
  </div>
```