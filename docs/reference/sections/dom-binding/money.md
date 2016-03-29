`model.property | money 'value'`

Returns the property formatted with your store's currency formatting, allowing for an optional currency argument to be provided.

```html
  <div rv-text="item.price | money">
    <!-- Formatted item price -->
  </div>
```

<div class="callout callout-warning">
  <p>
    If using the `money` formatter, make sure that you have set the relevant options when initialising Cart.JS to provide your store's currency formatting (see [Options: moneyFormat][]).
  </p>
  <p style="margin-bottom: 0;">
    You will also need to include Shopify's `option_selection.js` on all pages - see the note "[Dependency when formatting monetary values][]" in the Guide for more detail.
  </p>
</div>
[Options: moneyFormat]: #options-money-format
[Dependency when formatting monetary values]: http://cartjs.org/pages/guide#getting-started-setup