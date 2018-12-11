# ModernAVPlayer
[![Build Status](https://travis-ci.org/noreasonprojects/ModernAVPlayer.svg?branch=develop)](https://travis-ci.org/noreasonprojects/ModernAVPlayer)
![CocoaPods](https://img.shields.io/cocoapods/v/ModernAVPlayer.svg)
![CocoaPods](https://img.shields.io/cocoapods/l/ModernAVPlayer.svg)

``ModernAVPlayer`` is an audio persistence ``AVPlayer`` wrapper

#### ++ Cool features ++
- Get 9 nice and revelant player states (playing, buffering, loading, loaded...)
- Persistence player to resume playback after bad network connection even in background mode
- Manage headphone interactions, call & siri interruptions, now playing informations
- Add your own plug-in to manage tracking, events...
- RxSwift compatible
- Loop mode
- Log available by domain
***

#### ** Swift 4.2 note **
AVAudioSession lost setCategory method on iOS 9. to be still compatible with iOS 9, the library is not convert for now
source: http://www.openradar.me/42382075
***

## Menu
- [Requirements](#requirements)
- [Installation](#installation)
- [Getting started](#getting-started)
- [Advanced](#advanced)
- [Todo](#todo)
- [Communication](#communication)

## Requirements

- iOS 10.0+
- Xcode 10.1+
- Swift 4.2+

> In order to support background mode, append the following to your ``Info.plist``:
```
<key>UIBackgroundModes</key>
<array>
    <string>audio</string>
</array>
```

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
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'ModernAVPlayer'
end
```

Then, run the following command:

```bash
$ pod install
```

## Getting started

> Create a media
```swift
let media = ModernAVPlayerMedia(url: url, type: .clip)
```
> Instanciate the wrapper
```swift
let player = ModernAVPlayer()
```
> Load and play the media
```swift
player.load(media: media, autostart: true)
```
> Track on repeat
```swift
player.loopMode = true
```

| ↓ State / Command → | loadMedia | play | pause | stop | seek |
|:---------|:---------:|:--------:|:--------:|:--------:|:--------:|
| Init  | O | X | O | O | X
| Loading  | O | X | O | O | X
| Loaded  | O | O | O | O | O
| Buffering  | O | X | O | O | O
| Playing  | O | X | O | O | O
| Paused  | O | O | X | O | O
| Stopped  | O | O | O | X | O
| WaitingNetwork  | O | X | O | O | X
| Failed  | O | O | X | X | X

## Advanced 

### Configuration

All player configuration are available from `ContextConfiguration` protocol.  
A default implementation `ModernAVPlayerConfig` is provided with documentation

### Plugin

Use `PlayerPlugin` protocol to create your own plugin system, like tracking Plugin.

### RxSwift

Instead of using delegate pattern, you can use rx to bind player attributes.

> Setup

Use `pod 'ModernAVPlayer/RxSwift'` in the Podfile

> Usage
```swift
let player = ModernAVPlayer()
let state: Observable<ModernAVPlayer.State> = player.rx.state
```

## Todo
- [ ] Make remote command center configurable
- [ ] Make a prettier audio and video example
- [ ] Separate background task to a service
- [ ] Make log message available to multiple domain

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.
