# ModernAVPlayer
[![Build Status](https://travis-ci.org/noreasonprojects/ModernAVPlayer.svg?branch=develop)](https://travis-ci.org/noreasonprojects/ModernAVPlayer)

``ModernAVPlayer`` is an audio persistence ``AVPlayer`` wrapper

## Requirements

- iOS 10.0+
- Xcode 9.2+
- Swift 4.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

> CocoaPods 1.3+ is required to build ModernAVPlayer.

To integrate ``ModernAVPlayer`` into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'ModernAVPlayer'
end
```

Then, run the following command:

```bash
$ pod install
```

### Prerequisites

* In order to support background mode, append the following to your ``Info.plist``:

```
<key>UIBackgroundModes</key>
<array>
    <string>audio</string>
</array>
```

### Getting started

* Play your first audio source:

> Create a media
```swift
let media = ConcretePlayerMedia(url: liveUrl, type: .stream, isLive: true)
```
> Instanciate the wrapper
```swift
let player = ModernAVPlayer()
```
> Load and play the media
```swift
player.loadMedia(media: media, shouldPlaying: shouldPlaying)
```

### Available Commands
| ↓ State / Command → | loadMedia | play | pause | stop | seek |
|:---------|:---------:|:--------:|:--------:|:--------:|:--------:|
| Init  | O | X | O | O | X
| Loading  | O | X | O | O | X
| Loaded  | O | O | O | O | O
| Buffering  | O | X | O | O | O
| Playing  | O | X | O | O | O
| Paused  | O | O | X | O | O
| Stopped  | O | O | O | X | O
| Failed  | O | X | O | O | X

### RxSwift

Instead of using delegate pattern, you can use rx to bind player attributes.
> Setup
Use ``pod 'ModernAVPlayer/RxSwift'`` in the Podfile
> Usage
```swift
let context = ConcretePlayerContext(config: PlayerContextConfiguration())
let state = context.rx.state
```
`state` is now an `observable<PlayerState>`

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.
