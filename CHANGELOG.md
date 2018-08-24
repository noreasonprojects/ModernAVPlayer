# Change Log
All notable changes to this project will be documented in this file.

---
## [x.x.x]
* Features:
	* Allow setting custom HTTP header fields
	* Allow setting audio session category with options
* Fixes:
	* Use the `$(inherited)` flag for PODS_PODFILE_DIR_PATH in example
	* Update deprecated MPMediaItemArtwork initializer
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
