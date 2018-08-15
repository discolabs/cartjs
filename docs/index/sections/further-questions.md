## Further Questions

### Is it stable?
Cart.js is still in beta, although it's been in development for over a year and 
the API is quite stable. It's being used in production by a number of large
Shopify stores, including our own clients.

We're committed to supporting Cart.js now and in the future and always make the
effort to respond to bug reports and feature requests in a timely manner as we
move towards a 1.0 release.

If you're interested in using Cart.js, we'll be happy to answer any questions 
you have or help you get up and running.

### Who's using it?
Aside from our own clients (some of whom are running very sizable Shopify
stores), a number of other sites are using Cart.js in the wild. Check out the
[Built with Cart.js][] page for a list (don't forget to [add your own site][]
once you've built something using the library).

### What's the browser support like?
Pretty good! Because the core Cart.js libraries use jQuery for Ajax requests
and DOM manipulation, the only limiting factor is the version of jQuery you
decide to use. This means that themes using a `1.x` version of jQuery with
Cart.js will be able to support IE6+, Chrome, Firefox, Safari 5.1+ and up.

If you're using the DOM binding functionality, there are some potential issues
with older browser that don't support the ES5 Javascript standard (in practice,
this means Internet Explorer 8 and below). See [Browser Support][] in the Guide
for more detail.

### I have a bug report / feature request.
Please add it to the [issues tracker][] on GitHub.

### Can I contribute?
Absolutely!
Just head to the [GitHub][] page, fork the repository and manage development 
through issues and pull requests.

If you're keen to help but don't know where to start, contact me
[on Twitter][].

---

[Built with Cart.js]: /pages/built-with-cart-js
[add your own site]: https://github.com/discolabs/cartjs/issues/new?title=New%20site%20for%20%22Built%20With%22%20Page:%20http://
[Browser Support]: /pages/guide#getting-started-browser-support
[issues tracker]: https://github.com/discolabs/cartjs/issues
[GitHub]: https://github.com/discolabs/cartjs
[on Twitter]: https://twitter.com/gavinballard
