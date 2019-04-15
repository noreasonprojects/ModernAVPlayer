# Change Log
All notable changes to this project will be documented in this file.

---
## [X.X.X]
* Fix:
	* Retain cycle in example project

## [1.2.0]
* Feature:
	* Support swift 5
* Dependencies:
	* [gem] Cocoapods -> 1.6.1
	* [pod] Quick -> 2.0.0
	* [pod] Nimble -> 8.0.1
	* [pod] RxSwift -> 4.5.0
	* [pod] RxSwift -> 4.5.0
	* [pod] SwiftyMocky -> 3.2.0

## [1.1.3]
* Improvement:
	* Disable external playback to avoid black screen when using AirPlay on Apple TV
* Dependency:
	* [gem] Fastlane -> 2.114.0

## [1.1.2]
* Fix:
	* Update `nowPlayingInfo` playbackTime when seek
* Improvement:
	* Delete duplicate code by merging internal Paused / Stopped states
* Dependency:
	* [gem] Fastlane -> 2.113.0

## [1.1.1]
* Breaking changes:
	* didPaused(media:position) plugin method accept optional `PlayerMedia`
	* didStopped(media:position) plugin method accept optional `PlayerMedia`
* Fix:
	* Crash when pause / stop and current media is nil
* Improvement:
	* Automate update project version number
* Dependency:
	* [gem] Fastlane -> 2.112.0

## [1.1.0]
* Breaking change:
	* Add `remoteCommand` case to `ModernAVPlayerLoggerDomain` enum
* Features:
	* Add swift version badge
	* Add `remoteCommand` logs
* Fixes:
	* Update build travis badge url
	* Set custom remote command
* Improvements:
	* Move `didInit(player:)` plugin method
	* Unite `ModernAVPlayer` variable returns

## [1.0.0]
* Breaking changes:
	* `load(media:autostart:position:)` replaces `loadMedia(media:autostart:position:)`
	* iOS 10.0+ requirement 
* Feature:
	* Update to swift 4.2
* Improvement:
	* Extract and refacto player actions

## [0.17.0]
* Breaking change:
	* `ModernAVPlayerMediaMetadata` take image data instead of localImageName path name
* Features:
	* Accept metadata image data instead of image path name
	* Make metadata optional on `ModernAVPlayerMedia` init

## [0.16.0]
* Feature:
	* Improve readme
	* Add usefull plugin method parameters
* Breaking change:
	* almost all plugin method parameters (PlayerPlugin.swift)
* Dependency:
	* [pod] SwiftyMocky -> 3.0.0

## [0.15.0]
* Breaking change:
	* `updateNowPlayingInfo(metadata:)` was replaced by `updateMetadata(_:)`
* Feature:
	* `updateMedatata(_:)` replace current media metadata and update now playing info

## [0.14.0]
* Features:
	* Make example swift 4.2 compliant
	* Make tests swift 4.2 compliant
	* Make pod dependencies swift 4.2 compliant
* Dependencies:
	* [pod] Quick -> 1.3.1
	* [pod] Nimble -> 7.3.0
	* [pod] RxCocoa -> 4.3.0
	* [pod] RxSwift -> 4.3.0
	* [pod] SwiftLint -> 0.27.0

## [0.13.0]
* Feature:
	* Enable/Disable loop mode on current media 
* Fix:
	* Update NowPlayingInfo time at the right moment when item play reach end time
	* Update init media documentation 

## [0.12.0]
* Features:
	* Allow media setting custom HTTP header fields
	* Expose AVPlayer instance
* Fixes:
	* Add audio session category test
	* Use the `$(inherited)` flag for `PODS_PODFILE_DIR_PATH` in example
	* Update deprecated MPMediaItemArtwork initializer
	* Move back ModernAVPlayerMedia & Metadata to library
* Dependency:
	* [gem][cocoapods] -> 1.5.3

## [0.11.1]
* Fix:
	* Headphone toggle play pause command

## [0.11.0]
* Feature:
	* Add item to play end time information to delegate and plugin
	* Add did media changed information to plugin

## [0.10.0]
* Breaking Change:
	* Remove useless item url delegate method
	* Remove loggerLevelFilter configuration variable
* Features:
	* Play current media from Failed state
	* Play not already loaded media from Paused / Stopped states
	* Log by domain
* Improvement:
	* Set & fetch context item duration
	* Fetch current time from player directly
* Fix:
	* Try to play when receive wrong end time notification
	* Adjust didCurrentTimeChange delegate method

## [0.9.6]
* Features:
	* Expose currentMedia attribute
	* Expose player errors
	* Use of custom media metadata
	* Add willStartLoading plugin method
	* Accept to load media from a specific position
* Breaking Change:
	* Update PlayerMedia protocol: getMetadata() replace metadata attribute
	* Remove useless optional media attribute in plugin loadMedia method
* Fix:
	* Refactor context protocol
	* Reset currentTime when loading media
	* Item duration fetch using simulator device
	* Plugin method description
	* Plugin methods are called at the right time
	* Remove useless space in now playing center default values
	* Remove duplicate command center command

## [0.9.5]
* Features:
	* Add plugin methods to reflect all player's states
	* Remove useless MediaPlayer delegate attribute
* Fix:
	* Reset item duration when loading media

## [0.9.4]
* Feature:
	* Update now playing info metadata anytime

## [0.9.3]
* Feature:
	* Add readme pod shields
	* Use RxSwift in example
* Fixes:
	* RxSwift compatibility
	* CommandCenter set when playing
	* Don't play on interruption ended when playing from another app

## [0.9.2]
* Feature:
	* Make example app universal

* Fixes:
	* Display nowPlaying isLiveStream information (from iOS 10)
	* Keep playing when connect bluetooth headphone
	* Display coherent live stream duration
	* Manage live stream audio cut
	* Improve log readability
	* End reach notification

## [0.9.1]
* Features:
	* Add Logger
	* Manage audio route changes
	* Enable audio background mode
	* Manage audio interruptions
	* Add RxModernAVPlayer Pod Subspec
	* Revert iOS 9 compatibility
	* Add waiting step state
	* Bypass waiting state when loading failed
	* Check edge cases when loading
	* Add plugin system management

* Fixes:
	* Fix commented unit tests
	* Separate rate observing service
	* Separate notification service on PlayingState
	* Remove useless public access control
	* Protocol and implementation naming
	* Paused state leak
	* Timer leaks
	* Unwanted state when buffering in buffering sate
