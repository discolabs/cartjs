If you're using Cart.js and Rivets with module loaders like Webpack, you'll
need to make a couple of minor tweaks to ensure things work smoothly. 

Ensure you're pulling in jQuery and Rivets in your `webpack.config.js` or
equivalent:

{% raw %}
```js
new webpack.ProvidePlugin({ $: "jquery", rivets: "rivets", }),
```
{% endraw %}

and also make sure that Rivets is available globally in your entrypoint file:

{% raw %}
```js
global.rivets = rivets;
```
{% endraw %}