## Further Questions


### Is it stable?

Cart.js is still in beta, although it's been in development on and off for over 6 months and the API is pretty stable.
I'm hoping to get feedback from the developer community on bugs and feature as soon as possible to start moving towards a 1.0 release.

Cart.js is running in production right now on Shopify sites that do 7 figures of revenue annually, so I have a high degree of confidence in it!
If you're interested in using Cart.js, I'll be happy to answer any questions you have or help you get up and running.


### What's the browser support like?

Pretty good!
Because Cart.js uses jQuery for Ajax requests and DOM manipulation, the only limiting factor is the version of jQuery you decide to use.
This means that themes using a `1.x` version of jQuery with Cart.js will be able to support IE6+, Chrome, Firefox, Safari 5.1+ and up.

If you're using the DOM Bindings, there are some [caveats][] with Rivets.js and Internet Explorer 6-8 that may affect you.
As DOM binding is pretty handy and Shopify themes often need wide browser support, I'm working on this to ensure IE6+ support across the board.


### I have a bug report / feature request.

Please add it to the [issues tracker][] on GitHub.


### Can I contribute?

Absolutely!
Just head to the [GitHub][] page, fork the repository and manage development through issues and pull requests.

If you're keen to help but don't know where to start, contact me [on Twitter][].

---

[caveats]: http://rivetsjs.com/docs/guide/#adapters-default
[issues tracker]: https://github.com/discolabs/cartjs/issues
[GitHub]: https://github.com/discolabs/cartjs
[on Twitter]: http://twitter.com/gavinballard
