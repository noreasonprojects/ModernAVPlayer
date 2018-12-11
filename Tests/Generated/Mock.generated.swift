// Generated using Sourcery 0.15.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


//swiftlint:disable force_cast
//swiftlint:disable function_body_length
//swiftlint:disable line_length
//swiftlint:disable vertical_whitespace

#if MockyCustom
import SwiftyMocky
import AVFoundation
@testable import ModernAVPlayer

    public final class MockyAssertion {
        public static var handler: ((Bool, String, StaticString, UInt) -> Void)?
    }

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        guard let handler = MockyAssertion.handler else {
            assert(expression, message, file: file, line: line)
            return
        }

        handler(expression(), message(), file, line)
    }
#elseif Mocky
import SwiftyMocky
import XCTest
import AVFoundation
@testable import ModernAVPlayer

    func MockyAssert(_ expression: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "Verification failed", file: StaticString = #file, line: UInt = #line) {
        XCTAssert(expression(), message(), file: file, line: line)
    }
#else
import Sourcery
import SourceryRuntime
#endif



// MARK: - AudioSessionService
class AudioSessionServiceMock: AudioSessionService, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    typealias PropertyStub = Given
    typealias MethodStub = Given
    typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    func activate() {
        addInvocation(.m_activate)
		let perform = methodPerformValue(.m_activate) as? () -> Void
		perform?()
    }

    func setCategory(_ category: AVAudioSession.Category) {
        addInvocation(.m_setCategory__category(Parameter<AVAudioSession.Category>.value(`category`)))
		let perform = methodPerformValue(.m_setCategory__category(Parameter<AVAudioSession.Category>.value(`category`))) as? (AVAudioSession.Category) -> Void
		perform?(`category`)
    }


    fileprivate enum MethodType {
        case m_activate
        case m_setCategory__category(Parameter<AVAudioSession.Category>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_activate, .m_activate):
                return true 
            case (.m_setCategory__category(let lhsCategory), .m_setCategory__category(let rhsCategory)):
                guard Parameter.compare(lhs: lhsCategory, rhs: rhsCategory, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_activate: return 0
            case let .m_setCategory__category(p0): return p0.intValue
            }
        }
    }

    class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


    }

    struct Verify {
        fileprivate var method: MethodType

        static func activate() -> Verify { return Verify(method: .m_activate)}
        static func setCategory(_ category: Parameter<AVAudioSession.Category>) -> Verify { return Verify(method: .m_setCategory__category(`category`))}
        @available(*, deprecated, message: "This constructor is deprecated, and will be removed in v3.1 Possible fix:  remove `category` label")
		static func setCategory(category: Parameter<AVAudioSession.Category>) -> Verify { return Verify(method: .m_setCategory__category(`category`))}
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func activate(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_activate, performs: perform)
        }
        static func setCategory(_ category: Parameter<AVAudioSession.Category>, perform: @escaping (AVAudioSession.Category) -> Void) -> Perform {
            return Perform(method: .m_setCategory__category(`category`), performs: perform)
        }
        @available(*, deprecated, message: "This constructor is deprecated, and will be removed in v3.1 Possible fix:  remove `category` label")
		static func setCategory(category: Parameter<AVAudioSession.Category>, perform: @escaping (AVAudioSession.Category) -> Void) -> Perform {
            return Perform(method: .m_setCategory__category(`category`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - PlaybackObservingService
class PlaybackObservingServiceMock: PlaybackObservingService, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    typealias PropertyStub = Given
    typealias MethodStub = Given
    typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    var onPlaybackStalled: (() -> Void)? {
		get {	invocations.append(.p_onPlaybackStalled_get); return __p_onPlaybackStalled ?? optionalGivenGetterValue(.p_onPlaybackStalled_get, "PlaybackObservingServiceMock - stub value for onPlaybackStalled was not defined") }
		set {	invocations.append(.p_onPlaybackStalled_set(.value(newValue))); __p_onPlaybackStalled = newValue }
	}
	private var __p_onPlaybackStalled: (() -> Void)?

    var onPlayToEndTime: (() -> Void)? {
		get {	invocations.append(.p_onPlayToEndTime_get); return __p_onPlayToEndTime ?? optionalGivenGetterValue(.p_onPlayToEndTime_get, "PlaybackObservingServiceMock - stub value for onPlayToEndTime was not defined") }
		set {	invocations.append(.p_onPlayToEndTime_set(.value(newValue))); __p_onPlayToEndTime = newValue }
	}
	private var __p_onPlayToEndTime: (() -> Void)?

    var onFailedToPlayToEndTime: (() -> Void)? {
		get {	invocations.append(.p_onFailedToPlayToEndTime_get); return __p_onFailedToPlayToEndTime ?? optionalGivenGetterValue(.p_onFailedToPlayToEndTime_get, "PlaybackObservingServiceMock - stub value for onFailedToPlayToEndTime was not defined") }
		set {	invocations.append(.p_onFailedToPlayToEndTime_set(.value(newValue))); __p_onFailedToPlayToEndTime = newValue }
	}
	private var __p_onFailedToPlayToEndTime: (() -> Void)?






    fileprivate enum MethodType {
        case p_onPlaybackStalled_get
		case p_onPlaybackStalled_set(Parameter<(() -> Void)?>)
        case p_onPlayToEndTime_get
		case p_onPlayToEndTime_set(Parameter<(() -> Void)?>)
        case p_onFailedToPlayToEndTime_get
		case p_onFailedToPlayToEndTime_set(Parameter<(() -> Void)?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_onPlaybackStalled_get,.p_onPlaybackStalled_get): return true
			case (.p_onPlaybackStalled_set(let left),.p_onPlaybackStalled_set(let right)): return Parameter<(() -> Void)?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_onPlayToEndTime_get,.p_onPlayToEndTime_get): return true
			case (.p_onPlayToEndTime_set(let left),.p_onPlayToEndTime_set(let right)): return Parameter<(() -> Void)?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_onFailedToPlayToEndTime_get,.p_onFailedToPlayToEndTime_get): return true
			case (.p_onFailedToPlayToEndTime_set(let left),.p_onFailedToPlayToEndTime_set(let right)): return Parameter<(() -> Void)?>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_onPlaybackStalled_get: return 0
			case .p_onPlaybackStalled_set(let newValue): return newValue.intValue
            case .p_onPlayToEndTime_get: return 0
			case .p_onPlayToEndTime_set(let newValue): return newValue.intValue
            case .p_onFailedToPlayToEndTime_get: return 0
			case .p_onFailedToPlayToEndTime_set(let newValue): return newValue.intValue
            }
        }
    }

    class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }

        static func onPlaybackStalled(getter defaultValue: (() -> Void)?...) -> PropertyStub {
            return Given(method: .p_onPlaybackStalled_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func onPlayToEndTime(getter defaultValue: (() -> Void)?...) -> PropertyStub {
            return Given(method: .p_onPlayToEndTime_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func onFailedToPlayToEndTime(getter defaultValue: (() -> Void)?...) -> PropertyStub {
            return Given(method: .p_onFailedToPlayToEndTime_get, products: defaultValue.map({ Product.return($0) }))
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static var onPlaybackStalled: Verify { return Verify(method: .p_onPlaybackStalled_get) }
		static func onPlaybackStalled(set newValue: Parameter<(() -> Void)?>) -> Verify { return Verify(method: .p_onPlaybackStalled_set(newValue)) }
        static var onPlayToEndTime: Verify { return Verify(method: .p_onPlayToEndTime_get) }
		static func onPlayToEndTime(set newValue: Parameter<(() -> Void)?>) -> Verify { return Verify(method: .p_onPlayToEndTime_set(newValue)) }
        static var onFailedToPlayToEndTime: Verify { return Verify(method: .p_onFailedToPlayToEndTime_get) }
		static func onFailedToPlayToEndTime(set newValue: Parameter<(() -> Void)?>) -> Verify { return Verify(method: .p_onFailedToPlayToEndTime_set(newValue)) }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - PlayerContext
class PlayerContextMock: PlayerContext, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    typealias PropertyStub = Given
    typealias MethodStub = Given
    typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    var audioSession: AudioSessionService {
		get {	invocations.append(.p_audioSession_get); return __p_audioSession ?? givenGetterValue(.p_audioSession_get, "PlayerContextMock - stub value for audioSession was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_audioSession = newValue }
	}
	private var __p_audioSession: (AudioSessionService)?

    var bgToken: UIBackgroundTaskIdentifier? {
		get {	invocations.append(.p_bgToken_get); return __p_bgToken ?? optionalGivenGetterValue(.p_bgToken_get, "PlayerContextMock - stub value for bgToken was not defined") }
		set {	invocations.append(.p_bgToken_set(.value(newValue))); __p_bgToken = newValue }
	}
	private var __p_bgToken: (UIBackgroundTaskIdentifier)?

    var config: PlayerConfiguration {
		get {	invocations.append(.p_config_get); return __p_config ?? givenGetterValue(.p_config_get, "PlayerContextMock - stub value for config was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_config = newValue }
	}
	private var __p_config: (PlayerConfiguration)?

    var currentMedia: PlayerMedia? {
		get {	invocations.append(.p_currentMedia_get); return __p_currentMedia ?? optionalGivenGetterValue(.p_currentMedia_get, "PlayerContextMock - stub value for currentMedia was not defined") }
		set {	invocations.append(.p_currentMedia_set(.value(newValue))); __p_currentMedia = newValue }
	}
	private var __p_currentMedia: (PlayerMedia)?

    var currentItem: AVPlayerItem? {
		get {	invocations.append(.p_currentItem_get); return __p_currentItem ?? optionalGivenGetterValue(.p_currentItem_get, "PlayerContextMock - stub value for currentItem was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_currentItem = newValue }
	}
	private var __p_currentItem: (AVPlayerItem)?

    var currentTime: Double {
		get {	invocations.append(.p_currentTime_get); return __p_currentTime ?? givenGetterValue(.p_currentTime_get, "PlayerContextMock - stub value for currentTime was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_currentTime = newValue }
	}
	private var __p_currentTime: (Double)?

    var debugMessage: String? {
		get {	invocations.append(.p_debugMessage_get); return __p_debugMessage ?? optionalGivenGetterValue(.p_debugMessage_get, "PlayerContextMock - stub value for debugMessage was not defined") }
		set {	invocations.append(.p_debugMessage_set(.value(newValue))); __p_debugMessage = newValue }
	}
	private var __p_debugMessage: (String)?

    var delegate: PlayerContextDelegate? {
		get {	invocations.append(.p_delegate_get); return __p_delegate ?? optionalGivenGetterValue(.p_delegate_get, "PlayerContextMock - stub value for delegate was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_delegate = newValue }
	}
	private var __p_delegate: (PlayerContextDelegate)?

    var itemDuration: Double? {
		get {	invocations.append(.p_itemDuration_get); return __p_itemDuration ?? optionalGivenGetterValue(.p_itemDuration_get, "PlayerContextMock - stub value for itemDuration was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_itemDuration = newValue }
	}
	private var __p_itemDuration: (Double)?

    var nowPlaying: NowPlaying {
		get {	invocations.append(.p_nowPlaying_get); return __p_nowPlaying ?? givenGetterValue(.p_nowPlaying_get, "PlayerContextMock - stub value for nowPlaying was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_nowPlaying = newValue }
	}
	private var __p_nowPlaying: (NowPlaying)?

    var plugins: [PlayerPlugin] {
		get {	invocations.append(.p_plugins_get); return __p_plugins ?? givenGetterValue(.p_plugins_get, "PlayerContextMock - stub value for plugins was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_plugins = newValue }
	}
	private var __p_plugins: ([PlayerPlugin])?

    var state: PlayerState! {
		get {	invocations.append(.p_state_get); return __p_state ?? optionalGivenGetterValue(.p_state_get, "PlayerContextMock - stub value for state was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_state = newValue }
	}
	private var __p_state: (PlayerState)?

    var player: AVPlayer {
		get {	invocations.append(.p_player_get); return __p_player ?? givenGetterValue(.p_player_get, "PlayerContextMock - stub value for player was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_player = newValue }
	}
	private var __p_player: (AVPlayer)?

    var loopMode: Bool {
		get {	invocations.append(.p_loopMode_get); return __p_loopMode ?? givenGetterValue(.p_loopMode_get, "PlayerContextMock - stub value for loopMode was not defined") }
		set {	invocations.append(.p_loopMode_set(.value(newValue))); __p_loopMode = newValue }
	}
	private var __p_loopMode: (Bool)?





    func changeState(state: PlayerState) {
        addInvocation(.m_changeState__state_state(Parameter<PlayerState>.value(`state`)))
		let perform = methodPerformValue(.m_changeState__state_state(Parameter<PlayerState>.value(`state`))) as? (PlayerState) -> Void
		perform?(`state`)
    }

    func updateMetadata(_ metadata: PlayerMediaMetadata) {
        addInvocation(.m_updateMetadata__metadata(Parameter<PlayerMediaMetadata>.value(`metadata`)))
		let perform = methodPerformValue(.m_updateMetadata__metadata(Parameter<PlayerMediaMetadata>.value(`metadata`))) as? (PlayerMediaMetadata) -> Void
		perform?(`metadata`)
    }

    func load(media: PlayerMedia, autostart: Bool, position: Double?) {
        addInvocation(.m_load__media_mediaautostart_autostartposition_position(Parameter<PlayerMedia>.value(`media`), Parameter<Bool>.value(`autostart`), Parameter<Double?>.value(`position`)))
		let perform = methodPerformValue(.m_load__media_mediaautostart_autostartposition_position(Parameter<PlayerMedia>.value(`media`), Parameter<Bool>.value(`autostart`), Parameter<Double?>.value(`position`))) as? (PlayerMedia, Bool, Double?) -> Void
		perform?(`media`, `autostart`, `position`)
    }

    func pause() {
        addInvocation(.m_pause)
		let perform = methodPerformValue(.m_pause) as? () -> Void
		perform?()
    }

    func play() {
        addInvocation(.m_play)
		let perform = methodPerformValue(.m_play) as? () -> Void
		perform?()
    }

    func seek(position: Double) {
        addInvocation(.m_seek__position_position(Parameter<Double>.value(`position`)))
		let perform = methodPerformValue(.m_seek__position_position(Parameter<Double>.value(`position`))) as? (Double) -> Void
		perform?(`position`)
    }

    func stop() {
        addInvocation(.m_stop)
		let perform = methodPerformValue(.m_stop) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_changeState__state_state(Parameter<PlayerState>)
        case m_updateMetadata__metadata(Parameter<PlayerMediaMetadata>)
        case m_load__media_mediaautostart_autostartposition_position(Parameter<PlayerMedia>, Parameter<Bool>, Parameter<Double?>)
        case m_pause
        case m_play
        case m_seek__position_position(Parameter<Double>)
        case m_stop
        case p_audioSession_get
        case p_bgToken_get
		case p_bgToken_set(Parameter<UIBackgroundTaskIdentifier?>)
        case p_config_get
        case p_currentMedia_get
		case p_currentMedia_set(Parameter<PlayerMedia?>)
        case p_currentItem_get
        case p_currentTime_get
        case p_debugMessage_get
		case p_debugMessage_set(Parameter<String?>)
        case p_delegate_get
        case p_itemDuration_get
        case p_nowPlaying_get
        case p_plugins_get
        case p_state_get
        case p_player_get
        case p_loopMode_get
		case p_loopMode_set(Parameter<Bool>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_changeState__state_state(let lhsState), .m_changeState__state_state(let rhsState)):
                guard Parameter.compare(lhs: lhsState, rhs: rhsState, with: matcher) else { return false } 
                return true 
            case (.m_updateMetadata__metadata(let lhsMetadata), .m_updateMetadata__metadata(let rhsMetadata)):
                guard Parameter.compare(lhs: lhsMetadata, rhs: rhsMetadata, with: matcher) else { return false } 
                return true 
            case (.m_load__media_mediaautostart_autostartposition_position(let lhsMedia, let lhsAutostart, let lhsPosition), .m_load__media_mediaautostart_autostartposition_position(let rhsMedia, let rhsAutostart, let rhsPosition)):
                guard Parameter.compare(lhs: lhsMedia, rhs: rhsMedia, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsAutostart, rhs: rhsAutostart, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsPosition, rhs: rhsPosition, with: matcher) else { return false } 
                return true 
            case (.m_pause, .m_pause):
                return true 
            case (.m_play, .m_play):
                return true 
            case (.m_seek__position_position(let lhsPosition), .m_seek__position_position(let rhsPosition)):
                guard Parameter.compare(lhs: lhsPosition, rhs: rhsPosition, with: matcher) else { return false } 
                return true 
            case (.m_stop, .m_stop):
                return true 
            case (.p_audioSession_get,.p_audioSession_get): return true
            case (.p_bgToken_get,.p_bgToken_get): return true
			case (.p_bgToken_set(let left),.p_bgToken_set(let right)): return Parameter<UIBackgroundTaskIdentifier?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_config_get,.p_config_get): return true
            case (.p_currentMedia_get,.p_currentMedia_get): return true
			case (.p_currentMedia_set(let left),.p_currentMedia_set(let right)): return Parameter<PlayerMedia?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_currentItem_get,.p_currentItem_get): return true
            case (.p_currentTime_get,.p_currentTime_get): return true
            case (.p_debugMessage_get,.p_debugMessage_get): return true
			case (.p_debugMessage_set(let left),.p_debugMessage_set(let right)): return Parameter<String?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_delegate_get,.p_delegate_get): return true
            case (.p_itemDuration_get,.p_itemDuration_get): return true
            case (.p_nowPlaying_get,.p_nowPlaying_get): return true
            case (.p_plugins_get,.p_plugins_get): return true
            case (.p_state_get,.p_state_get): return true
            case (.p_player_get,.p_player_get): return true
            case (.p_loopMode_get,.p_loopMode_get): return true
			case (.p_loopMode_set(let left),.p_loopMode_set(let right)): return Parameter<Bool>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_changeState__state_state(p0): return p0.intValue
            case let .m_updateMetadata__metadata(p0): return p0.intValue
            case let .m_load__media_mediaautostart_autostartposition_position(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            case .m_pause: return 0
            case .m_play: return 0
            case let .m_seek__position_position(p0): return p0.intValue
            case .m_stop: return 0
            case .p_audioSession_get: return 0
            case .p_bgToken_get: return 0
			case .p_bgToken_set(let newValue): return newValue.intValue
            case .p_config_get: return 0
            case .p_currentMedia_get: return 0
			case .p_currentMedia_set(let newValue): return newValue.intValue
            case .p_currentItem_get: return 0
            case .p_currentTime_get: return 0
            case .p_debugMessage_get: return 0
			case .p_debugMessage_set(let newValue): return newValue.intValue
            case .p_delegate_get: return 0
            case .p_itemDuration_get: return 0
            case .p_nowPlaying_get: return 0
            case .p_plugins_get: return 0
            case .p_state_get: return 0
            case .p_player_get: return 0
            case .p_loopMode_get: return 0
			case .p_loopMode_set(let newValue): return newValue.intValue
            }
        }
    }

    class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }

        static func audioSession(getter defaultValue: AudioSessionService...) -> PropertyStub {
            return Given(method: .p_audioSession_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func bgToken(getter defaultValue: UIBackgroundTaskIdentifier?...) -> PropertyStub {
            return Given(method: .p_bgToken_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func config(getter defaultValue: PlayerConfiguration...) -> PropertyStub {
            return Given(method: .p_config_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func currentMedia(getter defaultValue: PlayerMedia?...) -> PropertyStub {
            return Given(method: .p_currentMedia_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func currentItem(getter defaultValue: AVPlayerItem?...) -> PropertyStub {
            return Given(method: .p_currentItem_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func currentTime(getter defaultValue: Double...) -> PropertyStub {
            return Given(method: .p_currentTime_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func debugMessage(getter defaultValue: String?...) -> PropertyStub {
            return Given(method: .p_debugMessage_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func delegate(getter defaultValue: PlayerContextDelegate?...) -> PropertyStub {
            return Given(method: .p_delegate_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func itemDuration(getter defaultValue: Double?...) -> PropertyStub {
            return Given(method: .p_itemDuration_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func nowPlaying(getter defaultValue: NowPlaying...) -> PropertyStub {
            return Given(method: .p_nowPlaying_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func plugins(getter defaultValue: [PlayerPlugin]...) -> PropertyStub {
            return Given(method: .p_plugins_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func state(getter defaultValue: PlayerState?...) -> PropertyStub {
            return Given(method: .p_state_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func player(getter defaultValue: AVPlayer...) -> PropertyStub {
            return Given(method: .p_player_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func loopMode(getter defaultValue: Bool...) -> PropertyStub {
            return Given(method: .p_loopMode_get, products: defaultValue.map({ Product.return($0) }))
        }

    }

    struct Verify {
        fileprivate var method: MethodType

        static func changeState(state: Parameter<PlayerState>) -> Verify { return Verify(method: .m_changeState__state_state(`state`))}
        static func updateMetadata(_ metadata: Parameter<PlayerMediaMetadata>) -> Verify { return Verify(method: .m_updateMetadata__metadata(`metadata`))}
        @available(*, deprecated, message: "This constructor is deprecated, and will be removed in v3.1 Possible fix:  remove `metadata` label")
		static func updateMetadata(metadata: Parameter<PlayerMediaMetadata>) -> Verify { return Verify(method: .m_updateMetadata__metadata(`metadata`))}
        static func load(media: Parameter<PlayerMedia>, autostart: Parameter<Bool>, position: Parameter<Double?>) -> Verify { return Verify(method: .m_load__media_mediaautostart_autostartposition_position(`media`, `autostart`, `position`))}
        static func pause() -> Verify { return Verify(method: .m_pause)}
        static func play() -> Verify { return Verify(method: .m_play)}
        static func seek(position: Parameter<Double>) -> Verify { return Verify(method: .m_seek__position_position(`position`))}
        static func stop() -> Verify { return Verify(method: .m_stop)}
        static var audioSession: Verify { return Verify(method: .p_audioSession_get) }
        static var bgToken: Verify { return Verify(method: .p_bgToken_get) }
		static func bgToken(set newValue: Parameter<UIBackgroundTaskIdentifier?>) -> Verify { return Verify(method: .p_bgToken_set(newValue)) }
        static var config: Verify { return Verify(method: .p_config_get) }
        static var currentMedia: Verify { return Verify(method: .p_currentMedia_get) }
		static func currentMedia(set newValue: Parameter<PlayerMedia?>) -> Verify { return Verify(method: .p_currentMedia_set(newValue)) }
        static var currentItem: Verify { return Verify(method: .p_currentItem_get) }
        static var currentTime: Verify { return Verify(method: .p_currentTime_get) }
        static var debugMessage: Verify { return Verify(method: .p_debugMessage_get) }
		static func debugMessage(set newValue: Parameter<String?>) -> Verify { return Verify(method: .p_debugMessage_set(newValue)) }
        static var delegate: Verify { return Verify(method: .p_delegate_get) }
        static var itemDuration: Verify { return Verify(method: .p_itemDuration_get) }
        static var nowPlaying: Verify { return Verify(method: .p_nowPlaying_get) }
        static var plugins: Verify { return Verify(method: .p_plugins_get) }
        static var state: Verify { return Verify(method: .p_state_get) }
        static var player: Verify { return Verify(method: .p_player_get) }
        static var loopMode: Verify { return Verify(method: .p_loopMode_get) }
		static func loopMode(set newValue: Parameter<Bool>) -> Verify { return Verify(method: .p_loopMode_set(newValue)) }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func changeState(state: Parameter<PlayerState>, perform: @escaping (PlayerState) -> Void) -> Perform {
            return Perform(method: .m_changeState__state_state(`state`), performs: perform)
        }
        static func updateMetadata(_ metadata: Parameter<PlayerMediaMetadata>, perform: @escaping (PlayerMediaMetadata) -> Void) -> Perform {
            return Perform(method: .m_updateMetadata__metadata(`metadata`), performs: perform)
        }
        @available(*, deprecated, message: "This constructor is deprecated, and will be removed in v3.1 Possible fix:  remove `metadata` label")
		static func updateMetadata(metadata: Parameter<PlayerMediaMetadata>, perform: @escaping (PlayerMediaMetadata) -> Void) -> Perform {
            return Perform(method: .m_updateMetadata__metadata(`metadata`), performs: perform)
        }
        static func load(media: Parameter<PlayerMedia>, autostart: Parameter<Bool>, position: Parameter<Double?>, perform: @escaping (PlayerMedia, Bool, Double?) -> Void) -> Perform {
            return Perform(method: .m_load__media_mediaautostart_autostartposition_position(`media`, `autostart`, `position`), performs: perform)
        }
        static func pause(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_pause, performs: perform)
        }
        static func play(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_play, performs: perform)
        }
        static func seek(position: Parameter<Double>, perform: @escaping (Double) -> Void) -> Perform {
            return Perform(method: .m_seek__position_position(`position`), performs: perform)
        }
        static func stop(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_stop, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - PlayerMedia
class PlayerMediaMock: PlayerMedia, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    typealias PropertyStub = Given
    typealias MethodStub = Given
    typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    var url: URL {
		get {	invocations.append(.p_url_get); return __p_url ?? givenGetterValue(.p_url_get, "PlayerMediaMock - stub value for url was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_url = newValue }
	}
	private var __p_url: (URL)?

    var type: MediaType {
		get {	invocations.append(.p_type_get); return __p_type ?? givenGetterValue(.p_type_get, "PlayerMediaMock - stub value for type was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_type = newValue }
	}
	private var __p_type: (MediaType)?

    var assetOptions: [String: Any]? {
		get {	invocations.append(.p_assetOptions_get); return __p_assetOptions ?? optionalGivenGetterValue(.p_assetOptions_get, "PlayerMediaMock - stub value for assetOptions was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_assetOptions = newValue }
	}
	private var __p_assetOptions: ([String: Any])?

    var description: String {
		get {	invocations.append(.p_description_get); return __p_description ?? givenGetterValue(.p_description_get, "PlayerMediaMock - stub value for description was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_description = newValue }
	}
	private var __p_description: (String)?





    func isLive() -> Bool {
        addInvocation(.m_isLive)
		let perform = methodPerformValue(.m_isLive) as? () -> Void
		perform?()
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_isLive).casted()
		} catch {
			onFatalFailure("Stub return value not specified for isLive(). Use given")
			Failure("Stub return value not specified for isLive(). Use given")
		}
		return __value
    }

    func getMetadata() -> PlayerMediaMetadata? {
        addInvocation(.m_getMetadata)
		let perform = methodPerformValue(.m_getMetadata) as? () -> Void
		perform?()
		var __value: PlayerMediaMetadata? = nil
		do {
		    __value = try methodReturnValue(.m_getMetadata).casted()
		} catch {
			// do nothing
		}
		return __value
    }

    func setMetadata(_ metadata: PlayerMediaMetadata) {
        addInvocation(.m_setMetadata__metadata(Parameter<PlayerMediaMetadata>.value(`metadata`)))
		let perform = methodPerformValue(.m_setMetadata__metadata(Parameter<PlayerMediaMetadata>.value(`metadata`))) as? (PlayerMediaMetadata) -> Void
		perform?(`metadata`)
    }


    fileprivate enum MethodType {
        case m_isLive
        case m_getMetadata
        case m_setMetadata__metadata(Parameter<PlayerMediaMetadata>)
        case p_url_get
        case p_type_get
        case p_assetOptions_get
        case p_description_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_isLive, .m_isLive):
                return true 
            case (.m_getMetadata, .m_getMetadata):
                return true 
            case (.m_setMetadata__metadata(let lhsMetadata), .m_setMetadata__metadata(let rhsMetadata)):
                guard Parameter.compare(lhs: lhsMetadata, rhs: rhsMetadata, with: matcher) else { return false } 
                return true 
            case (.p_url_get,.p_url_get): return true
            case (.p_type_get,.p_type_get): return true
            case (.p_assetOptions_get,.p_assetOptions_get): return true
            case (.p_description_get,.p_description_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_isLive: return 0
            case .m_getMetadata: return 0
            case let .m_setMetadata__metadata(p0): return p0.intValue
            case .p_url_get: return 0
            case .p_type_get: return 0
            case .p_assetOptions_get: return 0
            case .p_description_get: return 0
            }
        }
    }

    class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }

        static func url(getter defaultValue: URL...) -> PropertyStub {
            return Given(method: .p_url_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func type(getter defaultValue: MediaType...) -> PropertyStub {
            return Given(method: .p_type_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func assetOptions(getter defaultValue: [String: Any]?...) -> PropertyStub {
            return Given(method: .p_assetOptions_get, products: defaultValue.map({ Product.return($0) }))
        }
        static func description(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_description_get, products: defaultValue.map({ Product.return($0) }))
        }

        static func isLive(willReturn: Bool...) -> MethodStub {
            return Given(method: .m_isLive, products: willReturn.map({ Product.return($0) }))
        }
        static func getMetadata(willReturn: PlayerMediaMetadata?...) -> MethodStub {
            return Given(method: .m_getMetadata, products: willReturn.map({ Product.return($0) }))
        }
        static func isLive(willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_isLive, products: willReturn.map({ Product.return($0) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        static func getMetadata(willProduce: (Stubber<PlayerMediaMetadata?>) -> Void) -> MethodStub {
            let willReturn: [PlayerMediaMetadata?] = []
			let given: Given = { return Given(method: .m_getMetadata, products: willReturn.map({ Product.return($0) })) }()
			let stubber = given.stub(for: (PlayerMediaMetadata?).self)
			willProduce(stubber)
			return given
        }
    }

    struct Verify {
        fileprivate var method: MethodType

        static func isLive() -> Verify { return Verify(method: .m_isLive)}
        static func getMetadata() -> Verify { return Verify(method: .m_getMetadata)}
        static func setMetadata(_ metadata: Parameter<PlayerMediaMetadata>) -> Verify { return Verify(method: .m_setMetadata__metadata(`metadata`))}
        @available(*, deprecated, message: "This constructor is deprecated, and will be removed in v3.1 Possible fix:  remove `metadata` label")
		static func setMetadata(metadata: Parameter<PlayerMediaMetadata>) -> Verify { return Verify(method: .m_setMetadata__metadata(`metadata`))}
        static var url: Verify { return Verify(method: .p_url_get) }
        static var type: Verify { return Verify(method: .p_type_get) }
        static var assetOptions: Verify { return Verify(method: .p_assetOptions_get) }
        static var description: Verify { return Verify(method: .p_description_get) }
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func isLive(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_isLive, performs: perform)
        }
        static func getMetadata(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getMetadata, performs: perform)
        }
        static func setMetadata(_ metadata: Parameter<PlayerMediaMetadata>, perform: @escaping (PlayerMediaMetadata) -> Void) -> Perform {
            return Perform(method: .m_setMetadata__metadata(`metadata`), performs: perform)
        }
        @available(*, deprecated, message: "This constructor is deprecated, and will be removed in v3.1 Possible fix:  remove `metadata` label")
		static func setMetadata(metadata: Parameter<PlayerMediaMetadata>, perform: @escaping (PlayerMediaMetadata) -> Void) -> Perform {
            return Perform(method: .m_setMetadata__metadata(`metadata`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

// MARK: - PlayerPlugin
class PlayerPluginMock: PlayerPlugin, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    typealias PropertyStub = Given
    typealias MethodStub = Given
    typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    func didInit(player: AVPlayer) {
        addInvocation(.m_didInit__player_player(Parameter<AVPlayer>.value(`player`)))
		let perform = methodPerformValue(.m_didInit__player_player(Parameter<AVPlayer>.value(`player`))) as? (AVPlayer) -> Void
		perform?(`player`)
    }

    func willStartLoading(media: PlayerMedia) {
        addInvocation(.m_willStartLoading__media_media(Parameter<PlayerMedia>.value(`media`)))
		let perform = methodPerformValue(.m_willStartLoading__media_media(Parameter<PlayerMedia>.value(`media`))) as? (PlayerMedia) -> Void
		perform?(`media`)
    }

    func didStartLoading(media: PlayerMedia) {
        addInvocation(.m_didStartLoading__media_media(Parameter<PlayerMedia>.value(`media`)))
		let perform = methodPerformValue(.m_didStartLoading__media_media(Parameter<PlayerMedia>.value(`media`))) as? (PlayerMedia) -> Void
		perform?(`media`)
    }

    func didStartBuffering(media: PlayerMedia) {
        addInvocation(.m_didStartBuffering__media_media(Parameter<PlayerMedia>.value(`media`)))
		let perform = methodPerformValue(.m_didStartBuffering__media_media(Parameter<PlayerMedia>.value(`media`))) as? (PlayerMedia) -> Void
		perform?(`media`)
    }

    func didLoad(media: PlayerMedia, duration: Double?) {
        addInvocation(.m_didLoad__media_mediaduration_duration(Parameter<PlayerMedia>.value(`media`), Parameter<Double?>.value(`duration`)))
		let perform = methodPerformValue(.m_didLoad__media_mediaduration_duration(Parameter<PlayerMedia>.value(`media`), Parameter<Double?>.value(`duration`))) as? (PlayerMedia, Double?) -> Void
		perform?(`media`, `duration`)
    }

    func didMediaChanged(_ media: PlayerMedia, previousMedia: PlayerMedia?) {
        addInvocation(.m_didMediaChanged__mediapreviousMedia_previousMedia(Parameter<PlayerMedia>.value(`media`), Parameter<PlayerMedia?>.value(`previousMedia`)))
		let perform = methodPerformValue(.m_didMediaChanged__mediapreviousMedia_previousMedia(Parameter<PlayerMedia>.value(`media`), Parameter<PlayerMedia?>.value(`previousMedia`))) as? (PlayerMedia, PlayerMedia?) -> Void
		perform?(`media`, `previousMedia`)
    }

    func willStartPlaying(media: PlayerMedia, position: Double) {
        addInvocation(.m_willStartPlaying__media_mediaposition_position(Parameter<PlayerMedia>.value(`media`), Parameter<Double>.value(`position`)))
		let perform = methodPerformValue(.m_willStartPlaying__media_mediaposition_position(Parameter<PlayerMedia>.value(`media`), Parameter<Double>.value(`position`))) as? (PlayerMedia, Double) -> Void
		perform?(`media`, `position`)
    }

    func didStartPlaying(media: PlayerMedia) {
        addInvocation(.m_didStartPlaying__media_media(Parameter<PlayerMedia>.value(`media`)))
		let perform = methodPerformValue(.m_didStartPlaying__media_media(Parameter<PlayerMedia>.value(`media`))) as? (PlayerMedia) -> Void
		perform?(`media`)
    }

    func didPaused(media: PlayerMedia, position: Double) {
        addInvocation(.m_didPaused__media_mediaposition_position(Parameter<PlayerMedia>.value(`media`), Parameter<Double>.value(`position`)))
		let perform = methodPerformValue(.m_didPaused__media_mediaposition_position(Parameter<PlayerMedia>.value(`media`), Parameter<Double>.value(`position`))) as? (PlayerMedia, Double) -> Void
		perform?(`media`, `position`)
    }

    func didStopped(media: PlayerMedia, position: Double) {
        addInvocation(.m_didStopped__media_mediaposition_position(Parameter<PlayerMedia>.value(`media`), Parameter<Double>.value(`position`)))
		let perform = methodPerformValue(.m_didStopped__media_mediaposition_position(Parameter<PlayerMedia>.value(`media`), Parameter<Double>.value(`position`))) as? (PlayerMedia, Double) -> Void
		perform?(`media`, `position`)
    }

    func didStartWaitingForNetwork(media: PlayerMedia) {
        addInvocation(.m_didStartWaitingForNetwork__media_media(Parameter<PlayerMedia>.value(`media`)))
		let perform = methodPerformValue(.m_didStartWaitingForNetwork__media_media(Parameter<PlayerMedia>.value(`media`))) as? (PlayerMedia) -> Void
		perform?(`media`)
    }

    func didFailed(media: PlayerMedia, error: PlayerError) {
        addInvocation(.m_didFailed__media_mediaerror_error(Parameter<PlayerMedia>.value(`media`), Parameter<PlayerError>.value(`error`)))
		let perform = methodPerformValue(.m_didFailed__media_mediaerror_error(Parameter<PlayerMedia>.value(`media`), Parameter<PlayerError>.value(`error`))) as? (PlayerMedia, PlayerError) -> Void
		perform?(`media`, `error`)
    }

    func didItemPlayToEndTime(media: PlayerMedia, endTime: Double) {
        addInvocation(.m_didItemPlayToEndTime__media_mediaendTime_endTime(Parameter<PlayerMedia>.value(`media`), Parameter<Double>.value(`endTime`)))
		let perform = methodPerformValue(.m_didItemPlayToEndTime__media_mediaendTime_endTime(Parameter<PlayerMedia>.value(`media`), Parameter<Double>.value(`endTime`))) as? (PlayerMedia, Double) -> Void
		perform?(`media`, `endTime`)
    }


    fileprivate enum MethodType {
        case m_didInit__player_player(Parameter<AVPlayer>)
        case m_willStartLoading__media_media(Parameter<PlayerMedia>)
        case m_didStartLoading__media_media(Parameter<PlayerMedia>)
        case m_didStartBuffering__media_media(Parameter<PlayerMedia>)
        case m_didLoad__media_mediaduration_duration(Parameter<PlayerMedia>, Parameter<Double?>)
        case m_didMediaChanged__mediapreviousMedia_previousMedia(Parameter<PlayerMedia>, Parameter<PlayerMedia?>)
        case m_willStartPlaying__media_mediaposition_position(Parameter<PlayerMedia>, Parameter<Double>)
        case m_didStartPlaying__media_media(Parameter<PlayerMedia>)
        case m_didPaused__media_mediaposition_position(Parameter<PlayerMedia>, Parameter<Double>)
        case m_didStopped__media_mediaposition_position(Parameter<PlayerMedia>, Parameter<Double>)
        case m_didStartWaitingForNetwork__media_media(Parameter<PlayerMedia>)
        case m_didFailed__media_mediaerror_error(Parameter<PlayerMedia>, Parameter<PlayerError>)
        case m_didItemPlayToEndTime__media_mediaendTime_endTime(Parameter<PlayerMedia>, Parameter<Double>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_didInit__player_player(let lhsPlayer), .m_didInit__player_player(let rhsPlayer)):
                guard Parameter.compare(lhs: lhsPlayer, rhs: rhsPlayer, with: matcher) else { return false } 
                return true 
            case (.m_willStartLoading__media_media(let lhsMedia), .m_willStartLoading__media_media(let rhsMedia)):
                guard Parameter.compare(lhs: lhsMedia, rhs: rhsMedia, with: matcher) else { return false } 
                return true 
            case (.m_didStartLoading__media_media(let lhsMedia), .m_didStartLoading__media_media(let rhsMedia)):
                guard Parameter.compare(lhs: lhsMedia, rhs: rhsMedia, with: matcher) else { return false } 
                return true 
            case (.m_didStartBuffering__media_media(let lhsMedia), .m_didStartBuffering__media_media(let rhsMedia)):
                guard Parameter.compare(lhs: lhsMedia, rhs: rhsMedia, with: matcher) else { return false } 
                return true 
            case (.m_didLoad__media_mediaduration_duration(let lhsMedia, let lhsDuration), .m_didLoad__media_mediaduration_duration(let rhsMedia, let rhsDuration)):
                guard Parameter.compare(lhs: lhsMedia, rhs: rhsMedia, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsDuration, rhs: rhsDuration, with: matcher) else { return false } 
                return true 
            case (.m_didMediaChanged__mediapreviousMedia_previousMedia(let lhsMedia, let lhsPreviousmedia), .m_didMediaChanged__mediapreviousMedia_previousMedia(let rhsMedia, let rhsPreviousmedia)):
                guard Parameter.compare(lhs: lhsMedia, rhs: rhsMedia, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsPreviousmedia, rhs: rhsPreviousmedia, with: matcher) else { return false } 
                return true 
            case (.m_willStartPlaying__media_mediaposition_position(let lhsMedia, let lhsPosition), .m_willStartPlaying__media_mediaposition_position(let rhsMedia, let rhsPosition)):
                guard Parameter.compare(lhs: lhsMedia, rhs: rhsMedia, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsPosition, rhs: rhsPosition, with: matcher) else { return false } 
                return true 
            case (.m_didStartPlaying__media_media(let lhsMedia), .m_didStartPlaying__media_media(let rhsMedia)):
                guard Parameter.compare(lhs: lhsMedia, rhs: rhsMedia, with: matcher) else { return false } 
                return true 
            case (.m_didPaused__media_mediaposition_position(let lhsMedia, let lhsPosition), .m_didPaused__media_mediaposition_position(let rhsMedia, let rhsPosition)):
                guard Parameter.compare(lhs: lhsMedia, rhs: rhsMedia, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsPosition, rhs: rhsPosition, with: matcher) else { return false } 
                return true 
            case (.m_didStopped__media_mediaposition_position(let lhsMedia, let lhsPosition), .m_didStopped__media_mediaposition_position(let rhsMedia, let rhsPosition)):
                guard Parameter.compare(lhs: lhsMedia, rhs: rhsMedia, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsPosition, rhs: rhsPosition, with: matcher) else { return false } 
                return true 
            case (.m_didStartWaitingForNetwork__media_media(let lhsMedia), .m_didStartWaitingForNetwork__media_media(let rhsMedia)):
                guard Parameter.compare(lhs: lhsMedia, rhs: rhsMedia, with: matcher) else { return false } 
                return true 
            case (.m_didFailed__media_mediaerror_error(let lhsMedia, let lhsError), .m_didFailed__media_mediaerror_error(let rhsMedia, let rhsError)):
                guard Parameter.compare(lhs: lhsMedia, rhs: rhsMedia, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsError, rhs: rhsError, with: matcher) else { return false } 
                return true 
            case (.m_didItemPlayToEndTime__media_mediaendTime_endTime(let lhsMedia, let lhsEndtime), .m_didItemPlayToEndTime__media_mediaendTime_endTime(let rhsMedia, let rhsEndtime)):
                guard Parameter.compare(lhs: lhsMedia, rhs: rhsMedia, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsEndtime, rhs: rhsEndtime, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_didInit__player_player(p0): return p0.intValue
            case let .m_willStartLoading__media_media(p0): return p0.intValue
            case let .m_didStartLoading__media_media(p0): return p0.intValue
            case let .m_didStartBuffering__media_media(p0): return p0.intValue
            case let .m_didLoad__media_mediaduration_duration(p0, p1): return p0.intValue + p1.intValue
            case let .m_didMediaChanged__mediapreviousMedia_previousMedia(p0, p1): return p0.intValue + p1.intValue
            case let .m_willStartPlaying__media_mediaposition_position(p0, p1): return p0.intValue + p1.intValue
            case let .m_didStartPlaying__media_media(p0): return p0.intValue
            case let .m_didPaused__media_mediaposition_position(p0, p1): return p0.intValue + p1.intValue
            case let .m_didStopped__media_mediaposition_position(p0, p1): return p0.intValue + p1.intValue
            case let .m_didStartWaitingForNetwork__media_media(p0): return p0.intValue
            case let .m_didFailed__media_mediaerror_error(p0, p1): return p0.intValue + p1.intValue
            case let .m_didItemPlayToEndTime__media_mediaendTime_endTime(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [Product]) {
            self.method = method
            super.init(products)
        }


    }

    struct Verify {
        fileprivate var method: MethodType

        static func didInit(player: Parameter<AVPlayer>) -> Verify { return Verify(method: .m_didInit__player_player(`player`))}
        static func willStartLoading(media: Parameter<PlayerMedia>) -> Verify { return Verify(method: .m_willStartLoading__media_media(`media`))}
        static func didStartLoading(media: Parameter<PlayerMedia>) -> Verify { return Verify(method: .m_didStartLoading__media_media(`media`))}
        static func didStartBuffering(media: Parameter<PlayerMedia>) -> Verify { return Verify(method: .m_didStartBuffering__media_media(`media`))}
        static func didLoad(media: Parameter<PlayerMedia>, duration: Parameter<Double?>) -> Verify { return Verify(method: .m_didLoad__media_mediaduration_duration(`media`, `duration`))}
        static func didMediaChanged(_ media: Parameter<PlayerMedia>, previousMedia: Parameter<PlayerMedia?>) -> Verify { return Verify(method: .m_didMediaChanged__mediapreviousMedia_previousMedia(`media`, `previousMedia`))}
        @available(*, deprecated, message: "This constructor is deprecated, and will be removed in v3.1 Possible fix:  remove `media` label")
		static func didMediaChanged(media: Parameter<PlayerMedia>, previousMedia: Parameter<PlayerMedia?>) -> Verify { return Verify(method: .m_didMediaChanged__mediapreviousMedia_previousMedia(`media`, `previousMedia`))}
        static func willStartPlaying(media: Parameter<PlayerMedia>, position: Parameter<Double>) -> Verify { return Verify(method: .m_willStartPlaying__media_mediaposition_position(`media`, `position`))}
        static func didStartPlaying(media: Parameter<PlayerMedia>) -> Verify { return Verify(method: .m_didStartPlaying__media_media(`media`))}
        static func didPaused(media: Parameter<PlayerMedia>, position: Parameter<Double>) -> Verify { return Verify(method: .m_didPaused__media_mediaposition_position(`media`, `position`))}
        static func didStopped(media: Parameter<PlayerMedia>, position: Parameter<Double>) -> Verify { return Verify(method: .m_didStopped__media_mediaposition_position(`media`, `position`))}
        static func didStartWaitingForNetwork(media: Parameter<PlayerMedia>) -> Verify { return Verify(method: .m_didStartWaitingForNetwork__media_media(`media`))}
        static func didFailed(media: Parameter<PlayerMedia>, error: Parameter<PlayerError>) -> Verify { return Verify(method: .m_didFailed__media_mediaerror_error(`media`, `error`))}
        static func didItemPlayToEndTime(media: Parameter<PlayerMedia>, endTime: Parameter<Double>) -> Verify { return Verify(method: .m_didItemPlayToEndTime__media_mediaendTime_endTime(`media`, `endTime`))}
    }

    struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        static func didInit(player: Parameter<AVPlayer>, perform: @escaping (AVPlayer) -> Void) -> Perform {
            return Perform(method: .m_didInit__player_player(`player`), performs: perform)
        }
        static func willStartLoading(media: Parameter<PlayerMedia>, perform: @escaping (PlayerMedia) -> Void) -> Perform {
            return Perform(method: .m_willStartLoading__media_media(`media`), performs: perform)
        }
        static func didStartLoading(media: Parameter<PlayerMedia>, perform: @escaping (PlayerMedia) -> Void) -> Perform {
            return Perform(method: .m_didStartLoading__media_media(`media`), performs: perform)
        }
        static func didStartBuffering(media: Parameter<PlayerMedia>, perform: @escaping (PlayerMedia) -> Void) -> Perform {
            return Perform(method: .m_didStartBuffering__media_media(`media`), performs: perform)
        }
        static func didLoad(media: Parameter<PlayerMedia>, duration: Parameter<Double?>, perform: @escaping (PlayerMedia, Double?) -> Void) -> Perform {
            return Perform(method: .m_didLoad__media_mediaduration_duration(`media`, `duration`), performs: perform)
        }
        static func didMediaChanged(_ media: Parameter<PlayerMedia>, previousMedia: Parameter<PlayerMedia?>, perform: @escaping (PlayerMedia, PlayerMedia?) -> Void) -> Perform {
            return Perform(method: .m_didMediaChanged__mediapreviousMedia_previousMedia(`media`, `previousMedia`), performs: perform)
        }
        @available(*, deprecated, message: "This constructor is deprecated, and will be removed in v3.1 Possible fix:  remove `media` label")
		static func didMediaChanged(media: Parameter<PlayerMedia>, previousMedia: Parameter<PlayerMedia?>, perform: @escaping (PlayerMedia, PlayerMedia?) -> Void) -> Perform {
            return Perform(method: .m_didMediaChanged__mediapreviousMedia_previousMedia(`media`, `previousMedia`), performs: perform)
        }
        static func willStartPlaying(media: Parameter<PlayerMedia>, position: Parameter<Double>, perform: @escaping (PlayerMedia, Double) -> Void) -> Perform {
            return Perform(method: .m_willStartPlaying__media_mediaposition_position(`media`, `position`), performs: perform)
        }
        static func didStartPlaying(media: Parameter<PlayerMedia>, perform: @escaping (PlayerMedia) -> Void) -> Perform {
            return Perform(method: .m_didStartPlaying__media_media(`media`), performs: perform)
        }
        static func didPaused(media: Parameter<PlayerMedia>, position: Parameter<Double>, perform: @escaping (PlayerMedia, Double) -> Void) -> Perform {
            return Perform(method: .m_didPaused__media_mediaposition_position(`media`, `position`), performs: perform)
        }
        static func didStopped(media: Parameter<PlayerMedia>, position: Parameter<Double>, perform: @escaping (PlayerMedia, Double) -> Void) -> Perform {
            return Perform(method: .m_didStopped__media_mediaposition_position(`media`, `position`), performs: perform)
        }
        static func didStartWaitingForNetwork(media: Parameter<PlayerMedia>, perform: @escaping (PlayerMedia) -> Void) -> Perform {
            return Perform(method: .m_didStartWaitingForNetwork__media_media(`media`), performs: perform)
        }
        static func didFailed(media: Parameter<PlayerMedia>, error: Parameter<PlayerError>, perform: @escaping (PlayerMedia, PlayerError) -> Void) -> Perform {
            return Perform(method: .m_didFailed__media_mediaerror_error(`media`, `error`), performs: perform)
        }
        static func didItemPlayToEndTime(media: Parameter<PlayerMedia>, endTime: Parameter<Double>, perform: @escaping (PlayerMedia, Double) -> Void) -> Perform {
            return Perform(method: .m_didItemPlayToEndTime__media_mediaendTime_endTime(`media`, `endTime`), performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expeced: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> Product {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType) -> [MethodType] {
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    private func matchingCalls(_ method: Verify) -> Int {
        return matchingCalls(method.method).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        #if Mocky
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleMissingStubError(message: message, file: file, line: line)
        #endif
    }
}

