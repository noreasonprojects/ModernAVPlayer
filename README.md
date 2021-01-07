# ModernAVPlayer
![Swift 4.2](https://img.shields.io/badge/Swift-5-orange.svg)
[![Build Status](https://travis-ci.org/noreasonprojects/ModernAVPlayer.svg?branch=develop)](https://travis-ci.com/noreasonprojects/ModernAVPlayer)
![CocoaPods](https://img.shields.io/cocoapods/v/ModernAVPlayer.svg)
![CocoaPods](https://img.shields.io/cocoapods/l/ModernAVPlayer.svg)

``ModernAVPlayer`` is a persistence ``AVPlayer`` wrapper

#### ++ Cool features ++
- Get 9 nice and relevant player states (playing, buffering, loading, loaded...)
- Persistence player to resume playback after bad network connection ~~even in background mode~~  (bug from version 1.5.1)
- Manage headphone interactions, call & siri interruptions, now playing informations
- Add your own plug-in to manage tracking, events...
- RxSwift compatible
- Loop mode
- Log available by domain
***

### Known issue
From version 1.5.1, resume playback from background mode failed. If you have any suggestion, please help. 

``Use of  mixWithOther AVAudiosession CategoryOptions is not a solution.``
***

## Menu
- [Requirements](#requirements)
- [Installation](#installation)
- [Getting started](#getting-started)
- [Advanced](#advanced)
    - [Custom Configuration](#custom-configuration)
    - [Remote Command](#remote-command)
    - [Plugin](#plugin)
    - [RxSwift](#rxswift)
- [Communication](#communication)

## Requirements

- iOS 10.0+
- tvOS 10.0+

> In order to support background mode, append the following to your ``Info.plist``:
```
<key>UIBackgroundModes</key>
<array>
    <string>audio</string>
</array>
```

## Installation

### Swift Package Manager

Supported version: ``swift-tools-version:5.0``

```swift
// Package.swift

import PackageDescription

let package = Package(
    name: "Sample",
    dependencies: [
        .package(url: "https://github.com/noreasonprojects/ModernAVPlayer", from: "X.X.X")
    ],
    targets: [
        .target(name: "Sample", dependencies: ["ModernAVPlayer"])
    ]
)
```

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

## Getting started

> Create media from URL
```swift
let media = ModernAVPlayerMedia(url: URL, type: MediaType)
```
> Create media from AVPlayerItem
```swift
let media = ModernAVPlayerMediaItem(item: AVPlayerItem, type: MediaType, metadata: PlayerMediaMetadata)
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

### Custom configuration

All player configuration are available from `PlayerConfiguration` protocol.  
A default implementation `ModernAVPlayerConfiguration` is provided with documentation

---

### Remote command

If using default configuration file ( `swift useDefaultRemoteCommand = true`), ModernAVPlayer use **automatically** all commands created by `ModernAVPlayerRemoteCommandFactory` class
Documention available in  `ModernAVPlayerRemoteCommandFactory.swift` file

#### Custom command

> Use your own `PlayerConfiguration` implementation with 
```swift
...
useDefaultRemoteCommand = false
...
```

> Create an array of  commands conforming to  `ModernAVPlayerRemoteCommand` protocol. 
```swift
let player = ModernAVPlayer(config: YourConfigImplementation())
let commands: [ModernAVPlayerRemoteCommand] = YourRemoteCommandFactory.commands
player.remoteCommands = commands
```

You can use existing commands from public `ModernAVPlayerRemoteCommandFactory` class.

---

### Plugin

Use `PlayerPlugin` protocol to create your own plugin system, like tracking Plugin.

---

### RxSwift

Instead of using delegate pattern, you can use rx to bind player attributes.

> Setup

Use `pod 'ModernAVPlayer/RxSwift'` in the Podfile

> Usage
```swift
let player = ModernAVPlayer()
let state: Observable<ModernAVPlayer.State> = player.rx.state
```

## Communication

- If you **found a bug**, make a pull request using `Simple Audio` template in the example section to demonstrate.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.
