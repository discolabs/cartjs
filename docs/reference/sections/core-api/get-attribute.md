`CartJS.getAttribute(attributeName, defaultValue = undefined)`

Get the cart attribute specified by `attributeName`.
If the specified attribute isn't set, `defaultValue` will be returned (defaults to `undefined`).

```js
// See if the cart has a gift note (by default it doesn't).
var hasGiftNote = CartJS.getAttribute('Has Gift Note', false);
if(hasGiftNote) {
    var giftMessage = prompt('Please enter your gift note:');
}
```
