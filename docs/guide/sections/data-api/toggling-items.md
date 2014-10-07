If you want to give your customers the ability to "toggle" items in or out of their cart, you can use a `data-cart-toggle` attribute on an element that fires a `change` event (like a checkbox or radio input).

A common use case for this is having an "added extra" on the cart page before the customer checks out - for example, a gift card.

Let's say we have a selection of gift cards a customer can choose from, and that we've created a collection containing them:

{% raw %}
```html
{% for gift_card_product in collections.gift-cards.products %}
<label>
    <input type="checkbox" data-cart-toggle="{{ gift_card_product.variants.first.id }}" />
    Add {{ gift_card_product.title | escape }} to my order (+{{ gift_card_product.variants.first.price | money_with_currency }})
</label>
{% endfor %}
```
{% endraw %}

This code will render a checkbox that a customer can turn on or off to add or remove the desired gift card from their card.
