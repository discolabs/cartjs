`model.property | match 'regexp' 'flags'`

Returns `true` if the `regexp` matches the given `property`. To pass a regexp through Rivets, we need to provide the regexp as a String (without wrapping in `/`), which will then be converted to a RegExp before evaluation. 

<div class="callout callout-success">
  <p style="margin-bottom: 0;">
    The formatter evaluates and returns the value of the JS expression `model.property.match(new RegExp(regexp, flags))`
  </p>
</div>

Basic example:

```html
  <div rv-show="item.title | includes 'shirt|shoe'">
    //...
  </div>
```

This also works with arrays:

```html
  <div rv-show="item.variant_options | includes 'Blue'">
    //...
  </div>
```

Flags
Any flag you would normally provide as part of a JS RegExp (such as `i` for case-insensitive), can be provided as part of an optional second argument.

```html
  <div rv-show="item.title | includes 'shirt|shoe' 'i'">
    //...
  </div>
```

[matches]: #matches