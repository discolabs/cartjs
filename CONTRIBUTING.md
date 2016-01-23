# Contributing to Cart.js
We love to accept pull requests from anyone interested in helping out with the
Cart.js project. Note that by participating in this project, you agree to both:

- abide by Disco's [Open Source Code of Conduct];
- license your contribution under the [MIT License].

[Open Source Code of Conduct]: https://www.discolabs.com/open-source-code-of-conduct/
[MIT License]: LICENSE


## Submitting a Pull Request
Fork, then clone the repo:

    git clone git@github.com:your-username/cartjs.git

Install all dependencies for building and running tests:

    npm install

Make sure the tests pass:

    npm test

Make your change. Add tests for your change. Make the tests pass:

    npm test

Push to your fork and [submit a pull request].

[submit a pull request]: https://github.com/discolabs/cartjs/compare/

**Please ask first** before embarking on any significant pull request to avoid
spending lots of time working on something we may not wish to merge.


## Cart.js Development Philosophy
The overarching goal of Cart.js is to make common dynamic Javascript
functionality as easy as possible for Shopify developers to implement. To help
achieve that goal, we try to stick to the following philosophical guidelines:
 
- **User-Friendly**: A junior web developer new to Shopify development should be
  able to pick up and find the library useful within a couple of hours. There
  shouldn't be any complex configuration or code required to use Cart.js. Docs
  should be as comprehensive as possible and easy to follow.
- **Real-World Code**: Features should only be added when they've proven useful
  on real-world Shopify stores. Issues and feature requests made in a vacuum
  should be rejected until a concrete case can be made for them.
- **Opinionated**: Pick a sensible way of doing things that works for 90% of use
  cases and make that the default, instead of allowing many different
  configurations.  
