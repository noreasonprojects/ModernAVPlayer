# Changelog

All changes to SwiftyMocky project will be documented in this file.

-----

## __3.3.4__ / 2019

#### Fixed:
* Fixed problem with not printable ASCI characters by @TimeDelta
* Fixed problem with missing generic constraints by @demalex

-----

## __3.3.3__ / 2019

#### Fixed:
* Swift 5.0 issue with custom assertions not compiling

-----

## __3.3.2__ / 2019

#### Fixed:
* Fixed problems with multiple mocks being part of same target (@davidmtamas)

-----

## __3.3.1__ / 2019

#### Fixed:
* Removed leftover swift version setting to 5.0 from SwiftyPrototype target, causing problems for Carthage setup

-----

## __3.3.0__ / 2019

#### Added:
* Added SwiftyMocky CLI, simplifying setup and providing `doctor` feature
* Added support for Swift Package Manager (SPM)
* New configuration file for working with multiple targets - `Mockfile`
* Fixed redundant constraints for methods with stripped generics (@tarbayev)
* Added Argument captor (@timedelta)
#### Removed:
* dropped Swift 4.0, SwiftyMocky now requires Swift 4.1+
* dropped MockyCustom subspec, new subspec is Prototyping, for Carthage SwiftyPrototype

-----

## __3.2.0__ / 2019

#### Added:
* Fixed issues with naming, as internal name `Product` tend to conflict with Mocked classes
* Swift 5.0 support, fixes for optional types casting
* Integrated Sourcery 0.16.0, fixed issues resulting in breaking with newest Sourcery

#### Removed:
* __No more support for Swift 3.x__
* All Given methods, that were marked as `deprecated` in SwiftyMocky 3.x, are now __unavailable)).

-----

## __3.1.0__ / 2019

#### Added:
* Parameter convenience constructing as `.notNil`, when Parameter wraps an optional type
* Convenience `Count.once` as syntactic sugar for `1` for `Verify`
* Proper integration with projects that already use Sourcery (@laxmorek)

#### Fixed:
* Fixed generating mocks for methods that are throwing, and returning Self in the same time
* Fixed associated types protocols generation, when methods generic constrained

-----

## __3.0.0__ / 2018

#### Added:
* Parameters handling values expressible by literals, are now also expressible by literals
* Gracefully fail when return value is not stubbed
* Support for subscripts
* Stubbing policy, and support for recording sequence of return values
* Sequencing policy, which allows to change order in which stubs are processed
* Given for properties

#### Deprecated:
* deprecated VerifyProperty
* deprecated setters for readonly properties
* deprecated Given constructors not matching method signature (argument labels fix)

#### Fixed:
* multiple generation issues, like unnamed method parameters and esaping paramters names
* fixed issues with generics handling, when some attributes was not recognized as genric
* fixed issues with names collisions for methods different only in argument labels

-----

## __2.1.0__ / 2018

#### Fixed:
* handling @escaping when converting to Any (XCode10)
* minor improvements for XCode10 and Swift 4.2
* updated documentation

-----

## __2.0.1__ / 2018

#### Fixed:
* methods generation when differ only in return types
* moved lint rules to top (Lammert Westerhoff)
* updated minimal iOS deployment version (Igor Bulaya)

-----

## __2.0.0__ / 2018

#### Added:
* Support `Verify` for properties
* `Count` object, for easier specification of expected `Verify` results
* `Parameter` case `.matching`, allowing to specify custom rules for matching
* Exclude sources documentation
* Protocol 'inheritance' test
* Support for `Self` requirements
* Dropped `XCTest` dependency
* Additional `Custom` subspec, for non XCTest depending cases

#### Fixed:
* handling `T.Type` generic parameters

-----

## __1.0.2__ / 2017

#### Added:
* Code of contribution
* Code of conduct
* Default Matcher cases for basic types

#### Fixed:
* Handling of different Swift versions, checked on:
    * Swift 3.1 Xcode 8.3 and Xcode 8.3.3
    * Swift 3.2 Xcode 9
    * Swift 4.0.x Xcode 9
* Fixed links for cocoapods.org expanded site

-----

## __1.0.1__ / 2017

#### Fixed:
* Missing Parameter case for ValueType both Sequence and Equatable, causing compile error under Swift 3.x in XCode 9
* Images not showing in expanded description on cocoapods.org
* Documentation link based on tag, not commit

-----

## __1.0.0__ / 2017

#### Added:
* Support for generics
* Support for static members
* Different Swift versions support
* Matcher convenience registrations
* More extensive documentation

#### Updated:
* Simplified Mock template
* Generated code simplified and beautified
* Renamed ...Proxy to `Given`,`Verify`,`Perform`
* Reduced generation time

#### Fixed:
* Comparing parameters
* Matcher comparing issues

-----

## __0.9.0__ / 2017

#### Added:
* basic generation flow
* basic documentation
* readme
* template
* basic swift 3.1 support

#### Updated:
* Wrapping methods into `Proxy`
* Example tests

-----

## 0.1.0 - 0.4.0 / 2017

* Initial commit
* Foundation of __SwiftyMocky__ project
* Tests and CI setup
