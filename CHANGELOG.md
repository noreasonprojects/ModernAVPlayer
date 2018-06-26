# Change Log
All notable changes to this project will be documented in this file.

---
## [X.X.X]
* Features:
	* Expose currentMedia attribute
	* Use of custom media metadata
* Breaking Change:
	* Update PlayerMedia protocol: getMetadata() replace metadata attribute 
* Fix:
	* Refactor context protocol

## [0.9.5]
* Features:
	* Add plugin methods to reflet all player's states
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
	* Unwanted state whhen buffering in buffering sate
