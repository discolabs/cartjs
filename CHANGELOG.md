# Change Log
All notable changes to this project will be documented in this file.

## Unreleased
- No unreleased changes

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
