# Change Log
All notable changes to this project will be documented in this file.

---
## [X.X.X]
* Features:
	* Add Logger
	* Manage audio route changes
	* Enable audio background mode
	* Manage audio interruptions in playing and loading state
	* Add RxModernAVPlayer Pod Subspec
	* Revert iOS 9 compatibility
	* Add waiting step state
	* Bypass waiting state when loading failed
	* Check edge cases when loading

* Fixes:
	* Fix commented unit tests
	* Separate rate observing service
	* Separate notification service on PlayingState
	* Remove useless public access control
	* Protocol and implementation naming
	* Paused state leak
