`CartJS.setAttribute(attributeName, value)`

Set the attribute specified by `attributeName` to the specified `value`.

```js
// If there's a giftable item in our order, flag that we need a gift note.
if(hasGiftableItem) {
    CartJS.setAttribute('Has Gift Note', true);
}
```
