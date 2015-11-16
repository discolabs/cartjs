If you're using only the Core and Data functionality of Cart.js (that is,
you're using the `cart.js` or `cart.min.js` library in your theme), then the
range of browsers your theme will support is limited purely by the version of
jQuery you're using. That means that using a `1.x` version of jQuery will allow
you to support IE6+, Chrome, Firefox, Safari 5.1+ and up.

If you're using the DOM Binding functionality (that is, you're using the
`rivets-cart.min.js` library in your theme), then you may see problems on
browsers that don't support the ES5 Javascript standard (namely, Internet 
Explorer 8 and below).

As of November 2015, Shopify no longer requires themes submitted to the theme
store to support Internet Explorer 8, so as long as you don't have a special use
case that requires supporting these older browsers, you can happily use the DOM
Binding library in your themes. 
 
<div class="callout callout-success">
    <h4>What's the issue with older browsers?</h4>
    
    <p>
        Non-ES5 browsers (namely, IE8) don't support EcmaScript 5's
        `Object.defineProperty()` method, which Rivets.js uses to observe
        changes on data models and trigger DOM updates.
    </p>
    
    <p>
        Earlier versions of Cart.js provided a workaround for this by bundling
        a number of ES5 shims and polyfills into the library, as well as
        forcibly binding and re-binding Rivets views whenever a charge to the
        cart occurred. This "compatibility mode" was dropped once Shopify
        changed their theme guidelines to only require support for Internet
        Explorer 9+.
    </p>    
</div>
