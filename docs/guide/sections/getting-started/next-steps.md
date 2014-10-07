Now that you gotten Cart.js set up with your theme, you're ready to start using the library.

The recommended (and easiest) way to interact with Cart.js is via the Data API.
All this requires is adding some additional markup to your HTML and Cart.js will take care of the rest - you don't need to write any additional Javascript.

If you want to do something that's not supported by the Data API, or use Cart.js from within your own custom Javascript, then you can use the Core API to call methods on the `CartJS` object directly.
Of course, these two approaches aren't mutually exclusive - you can always use the Data API for the majority of your cart functionality, drop down to the Core API only when needed.

<div class="callout callout-success">
    <p>
        The Core API is covered first in the documentation below, as it provides the foundation for the Data API.
    </p>

    <p>
        However, if you just want to get stuck in to using Cart.js, feel free to go straight to the coverage of the <a href="#data-api">Data API</a>.
    </p>
</div>

Once you've gotten the hang of the Core and Data APIs, you might be interested in using Cart.js in conjunction with Rivets.js to create HTML templates that are automatically updated along with your cart.
That's covered in the [DOM Binding][] section later on.

[DOM Binding]: #dom-binding
