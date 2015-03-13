`CartJS.setAttribute(attributeName, value, options = {})`

Set the attribute specified by `attributeName` to the specified `value`.

```js
// If there's a giftable item in our order, flag that we need a gift note.
if(hasGiftableItem) {
    CartJS.setAttribute('Has Gift Note', true);
}
```

See [addItem](#core-api-add-item) for details on the `options` hash.
