# Change Log
All notable changes to this project will be documented in this file.

## Unreleased
No unreleased changes.

## 0.4.1 - 2016-08-16
### Added
- New Rivets formatters: `times`, `divided_by`, `modulo`

### Changed
- Fix issue with unnecessary line item properties being added with form submit

## 0.4.0 - 2016-02-11
### Added
- New Rivets formatter: `array_element`, `array_first`, `array_last`
- CONTRIBUTING.md
- Simple Mocha-based test framework
- `pluralize` formatter
- `slice` formatter

### Changed
- Fixed jQuery dependency from load-time to run-time

### Removed
- IE8 Compatibility mode

## 0.3.9 - 2015-11-11
### Added
- Two new Rivets formatters: `includes` and `match`  

## 0.3.8 - 2015-10-27
### Added
- `cart.ready` event, fired after initialisation finishes.

## 0.3.7 - 2015-10-26
### Changed
- `getImageSizedUrl` filter now handles empty product images.

## 0.3.6 - 2015-10-24
### Added
- New weight formatters `weight` and `weight_with_unit`, with corresponding
  settings `weightUnit` and `weightPrecision`.

## 0.3.5 - 2015-08-04
### Added
- Include non-minified version of `rivets-cart.js` in `dist`

## 0.3.4 - 2015-07-16
### Added
- Minor `console.log` compatibility fix for IE8 and IE9 browser support

## 0.3.3 - 2015-07-04
### Added
- Compatible version of `rivets-cart.min.js` for non-ES5 browser support

## 0.3.2 - 2015-07-03
### Added
- Made `getCart` a public method to allow force cart refreshes 

### Changed
- Fix for missing `removeItemById` public method 

## 0.3.1 - 2015-06-28
### Changed
- Fix for undefined Currency issue if not using Currency plugin.

## 0.3.0 - 2015-06-27
### Added
- Support for dynamically rendering currency changes through money filters

### Changed
- Upgraded Rivets.js library to v0.8.1

## 0.2.7 - 2015-05-18
### Added
- Add `debug` setting for outputting of useful information to the console

## 0.2.6 - 2015-04-02
### Changed
- Fixed incorrect method call when un-checking a checkbox using `data-cart-toggle`

## 0.2.5 - 2015-04-01
### Added
- Add `prepend` and `append` formatters to Rivets

## 0.2.4 - 2015-03-13
### Added
- Ability to specify callbacks through an `options` hash argument in Core API

## 0.2.3 - 2015-02-25
### Changed
- Fixed potential issue using .data() instead of .attr() to access `data-` attributes
- Added quantity adjustment example to advanced code example

## 0.2.2 - 2015-01-25
### Added
- New `updateItemQuantitiesById` Core API method

## 0.2.1 - 2014-11-27
### Added
- This new-format CHANGELOG, based on http://keepachangelog.com

### Changed
- Further improvements to documentation, including better code examples

## 0.2.0 - 2014-10-11
### Added
- New Data API methods for updating and clearing items
- New `data-cart-render` methods for simple DOM updating

### Changed
- Major improvements to documentation

### Removed
- `getCart()` method no longer publicly exported

## 0.1.0 - 2014-10-09
### Added
- Initial implementation; first "official" release
- Core API
- Data API
- Rivets.js DOM bindings
