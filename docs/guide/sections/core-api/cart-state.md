If we want to inspect the state of our cart at any time, we can access the `CartJS.cart` object.
You can read any of the standard cart properties (such as `item_count` or `requires_shipping`, for example), as well as a list of the current `items` in the cart.

While developing with Cart.js, it's often useful to open your browser's Javascript console and inspect the cart state, or test out Cart.js methods.
Here's an example from the developer console in Chrome:

<figure>
    <img src="{{ 'core-api-cart-state.png' | asset_url }}" alt="Screenshot of the Chrome developer console." />
</figure>

<div class="callout callout-warning">
    <h4>Don't write values via the cart object</h4>

    <p>
        You should only ever *read* values from `CartJS.cart`, and avoid altering the object directly.
    </p>

    <p>
        Assigning a value with code like `CartJS.cart.items[0].quantity = 5;` will make the change locally in the browser, but won't save it to the server.
        This means that the changes will be lost when the customer refreshes or navigates to a new page, or when Cart.js fetches an updated version of the cart from Shopify.
    </p>
</div>
