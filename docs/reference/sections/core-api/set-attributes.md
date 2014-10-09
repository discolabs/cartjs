`CartJS.setAttributes(attributes = {})`

Set multiple cart attributes at once by passing an `attributes` hash.

```js
// Flag that the cart has a gift note, and set the content of that note.
CartJS.setAttributes({
    "Has Gift Note": true,
    "Gift Note": "Happy Birthday!"
});
```
