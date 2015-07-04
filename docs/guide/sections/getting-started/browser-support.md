If you're using only the Core and Data functionality of Cart.js (that is,
you're using the `cart.js` or `cart.min.js` library in your theme), then the
range of browsers your theme will support is limited purely by the version of
jQuery you're using. That means that using a `1.x` version of jQuery will allow
you to support IE6+, Chrome, Firefox, Safari 5.1+ and up.

If you're using the DOM Binding functionality (that is, you're using the
`rivets-cart.min.js` library in your theme), then you may see problems on
browsers that don't support the ES5 Javascript standard (namely, Internet 
Explorer 8 and below). If you need to support these browsers, then Cart.js
providers an alternate version of the library that bundles Rivets, Cart.js
and a number of shims and polyfills to make things work (named
`rivets-cart-compatibility.min.js`).

Because the shims and polyfills are redundant on most browsers, you should make
sure that you're only serving this alternate version to the browsers that need
it. The following shows how to serve the compatible version of the library to
IE8 and below, while providing the standard version to all other browsers:

{% raw %}
```html
  <!-- Include Cart.js, conditionally loading Compatible version on older browsers -->
  <!--[if lt IE 9]>
  {{ 'rivets-cart-compatibility.min.js' | asset_url | script_tag }}
  <![endif]-->
  <!--[if gt IE 8]> <!-- -->
  {{ 'rivets-cart.min.js' | asset_url | script_tag }}
  <!-- <![endif]-->  
```
{% endraw %}
 
If you're already using Modernizr or a similar feature-detection library,
you may wish to use that to detect whether the user's browser supports ES5 and
load the appropriate script file, instead of using the conditional comment
approach outlined above. 

<div class="callout callout-success">
    <h4>What's the issue with older browsers?</h4>
    
    <p>
        Non-ES5 browsers (namely, IE8) don't support EcmaScript 5's
        `Object.defineProperty()` method, which Rivets.js uses to observe
        changes on data models and trigger DOM updates.
    </p>
    
    <p>
        The compatible version of Cart.js provides a workaround for this, by
        bundling a number of ES5 shims and polyfills into the library, as well
        as forcibly binding and re-binding Rivets views whenever a charge to
        the cart occurs.
    </p>
        
    <p>
        As a result of this workaround, if the cart model is being updated
        outside of Cart.js's regular methods, a `CartJS.getCart()` call should
        be made to force a re-render on non-ES5 browsers.
    </p>        
</div>
