// Generated using Sourcery 0.16.0 — https://github.com/krzysztofzablocki/Sourcery
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
open class AudioSessionServiceMock: AudioSessionService, Mock {
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

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func activate() {
        addInvocation(.m_activate)
		let perform = methodPerformValue(.m_activate) as? () -> Void
		perform?()
    }

    open func setCategory(_ category: AVAudioSession.Category) {
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

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func activate() -> Verify { return Verify(method: .m_activate)}
        public static func setCategory(_ category: Parameter<AVAudioSession.Category>) -> Verify { return Verify(method: .m_setCategory__category(`category`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func activate(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_activate, performs: perform)
        }
        public static func setCategory(_ category: Parameter<AVAudioSession.Category>, perform: @escaping (AVAudioSession.Category) -> Void) -> Perform {
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
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
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

// MARK: - NowPlaying
open class NowPlayingMock: NowPlaying, Mock {
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

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func update(metadata: PlayerMediaMetadata?, duration: Double?, isLive: Bool?) {
        addInvocation(.m_update__metadata_metadataduration_durationisLive_isLive(Parameter<PlayerMediaMetadata?>.value(`metadata`), Parameter<Double?>.value(`duration`), Parameter<Bool?>.value(`isLive`)))
		let perform = methodPerformValue(.m_update__metadata_metadataduration_durationisLive_isLive(Parameter<PlayerMediaMetadata?>.value(`metadata`), Parameter<Double?>.value(`duration`), Parameter<Bool?>.value(`isLive`))) as? (PlayerMediaMetadata?, Double?, Bool?) -> Void
		perform?(`metadata`, `duration`, `isLive`)
    }

    open func overrideInfoCenter(for key: String, value: Any) {
        addInvocation(.m_overrideInfoCenter__for_keyvalue_value(Parameter<String>.value(`key`), Parameter<Any>.value(`value`)))
		let perform = methodPerformValue(.m_overrideInfoCenter__for_keyvalue_value(Parameter<String>.value(`key`), Parameter<Any>.value(`value`))) as? (String, Any) -> Void
		perform?(`key`, `value`)
    }


    fileprivate enum MethodType {
        case m_update__metadata_metadataduration_durationisLive_isLive(Parameter<PlayerMediaMetadata?>, Parameter<Double?>, Parameter<Bool?>)
        case m_overrideInfoCenter__for_keyvalue_value(Parameter<String>, Parameter<Any>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_update__metadata_metadataduration_durationisLive_isLive(let lhsMetadata, let lhsDuration, let lhsIslive), .m_update__metadata_metadataduration_durationisLive_isLive(let rhsMetadata, let rhsDuration, let rhsIslive)):
                guard Parameter.compare(lhs: lhsMetadata, rhs: rhsMetadata, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsDuration, rhs: rhsDuration, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsIslive, rhs: rhsIslive, with: matcher) else { return false } 
                return true 
            case (.m_overrideInfoCenter__for_keyvalue_value(let lhsKey, let lhsValue), .m_overrideInfoCenter__for_keyvalue_value(let rhsKey, let rhsValue)):
                guard Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_update__metadata_metadataduration_durationisLive_isLive(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            case let .m_overrideInfoCenter__for_keyvalue_value(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func update(metadata: Parameter<PlayerMediaMetadata?>, duration: Parameter<Double?>, isLive: Parameter<Bool?>) -> Verify { return Verify(method: .m_update__metadata_metadataduration_durationisLive_isLive(`metadata`, `duration`, `isLive`))}
        public static func overrideInfoCenter(for key: Parameter<String>, value: Parameter<Any>) -> Verify { return Verify(method: .m_overrideInfoCenter__for_keyvalue_value(`key`, `value`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func update(metadata: Parameter<PlayerMediaMetadata?>, duration: Parameter<Double?>, isLive: Parameter<Bool?>, perform: @escaping (PlayerMediaMetadata?, Double?, Bool?) -> Void) -> Perform {
            return Perform(method: .m_update__metadata_metadataduration_durationisLive_isLive(`metadata`, `duration`, `isLive`), performs: perform)
        }
        public static func overrideInfoCenter(for key: Parameter<String>, value: Parameter<Any>, perform: @escaping (String, Any) -> Void) -> Perform {
            return Perform(method: .m_overrideInfoCenter__for_keyvalue_value(`key`, `value`), performs: perform)
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
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
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
open class PlaybackObservingServiceMock: PlaybackObservingService, Mock {
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

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    public var onPlaybackStalled: (() -> Void)? {
		get {	invocations.append(.p_onPlaybackStalled_get); return __p_onPlaybackStalled ?? optionalGivenGetterValue(.p_onPlaybackStalled_get, "PlaybackObservingServiceMock - stub value for onPlaybackStalled was not defined") }
		set {	invocations.append(.p_onPlaybackStalled_set(.value(newValue))); __p_onPlaybackStalled = newValue }
	}
	private var __p_onPlaybackStalled: (() -> Void)?

    public var onPlayToEndTime: (() -> Void)? {
		get {	invocations.append(.p_onPlayToEndTime_get); return __p_onPlayToEndTime ?? optionalGivenGetterValue(.p_onPlayToEndTime_get, "PlaybackObservingServiceMock - stub value for onPlayToEndTime was not defined") }
		set {	invocations.append(.p_onPlayToEndTime_set(.value(newValue))); __p_onPlayToEndTime = newValue }
	}
	private var __p_onPlayToEndTime: (() -> Void)?

    public var onFailedToPlayToEndTime: (() -> Void)? {
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

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func onPlaybackStalled(getter defaultValue: (() -> Void)?...) -> PropertyStub {
            return Given(method: .p_onPlaybackStalled_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func onPlayToEndTime(getter defaultValue: (() -> Void)?...) -> PropertyStub {
            return Given(method: .p_onPlayToEndTime_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func onFailedToPlayToEndTime(getter defaultValue: (() -> Void)?...) -> PropertyStub {
            return Given(method: .p_onFailedToPlayToEndTime_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var onPlaybackStalled: Verify { return Verify(method: .p_onPlaybackStalled_get) }
		public static func onPlaybackStalled(set newValue: Parameter<(() -> Void)?>) -> Verify { return Verify(method: .p_onPlaybackStalled_set(newValue)) }
        public static var onPlayToEndTime: Verify { return Verify(method: .p_onPlayToEndTime_get) }
		public static func onPlayToEndTime(set newValue: Parameter<(() -> Void)?>) -> Verify { return Verify(method: .p_onPlayToEndTime_set(newValue)) }
        public static var onFailedToPlayToEndTime: Verify { return Verify(method: .p_onFailedToPlayToEndTime_get) }
		public static func onFailedToPlayToEndTime(set newValue: Parameter<(() -> Void)?>) -> Verify { return Verify(method: .p_onFailedToPlayToEndTime_set(newValue)) }
    }

    public struct Perform {
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
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
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
open class PlayerContextMock: PlayerContext, Mock {
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

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    public var audioSession: AudioSessionService {
		get {	invocations.append(.p_audioSession_get); return __p_audioSession ?? givenGetterValue(.p_audioSession_get, "PlayerContextMock - stub value for audioSession was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_audioSession = newValue }
	}
	private var __p_audioSession: (AudioSessionService)?

    public var bgToken: UIBackgroundTaskIdentifier? {
		get {	invocations.append(.p_bgToken_get); return __p_bgToken ?? optionalGivenGetterValue(.p_bgToken_get, "PlayerContextMock - stub value for bgToken was not defined") }
		set {	invocations.append(.p_bgToken_set(.value(newValue))); __p_bgToken = newValue }
	}
	private var __p_bgToken: (UIBackgroundTaskIdentifier)?

    public var config: PlayerConfiguration {
		get {	invocations.append(.p_config_get); return __p_config ?? givenGetterValue(.p_config_get, "PlayerContextMock - stub value for config was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_config = newValue }
	}
	private var __p_config: (PlayerConfiguration)?

    public var currentMedia: PlayerMedia? {
		get {	invocations.append(.p_currentMedia_get); return __p_currentMedia ?? optionalGivenGetterValue(.p_currentMedia_get, "PlayerContextMock - stub value for currentMedia was not defined") }
		set {	invocations.append(.p_currentMedia_set(.value(newValue))); __p_currentMedia = newValue }
	}
	private var __p_currentMedia: (PlayerMedia)?

    public var currentItem: AVPlayerItem? {
		get {	invocations.append(.p_currentItem_get); return __p_currentItem ?? optionalGivenGetterValue(.p_currentItem_get, "PlayerContextMock - stub value for currentItem was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_currentItem = newValue }
	}
	private var __p_currentItem: (AVPlayerItem)?

    public var debugMessage: String? {
		get {	invocations.append(.p_debugMessage_get); return __p_debugMessage ?? optionalGivenGetterValue(.p_debugMessage_get, "PlayerContextMock - stub value for debugMessage was not defined") }
		set {	invocations.append(.p_debugMessage_set(.value(newValue))); __p_debugMessage = newValue }
	}
	private var __p_debugMessage: (String)?

    public var delegate: PlayerContextDelegate? {
		get {	invocations.append(.p_delegate_get); return __p_delegate ?? optionalGivenGetterValue(.p_delegate_get, "PlayerContextMock - stub value for delegate was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_delegate = newValue }
	}
	private var __p_delegate: (PlayerContextDelegate)?

    public var itemDuration: Double? {
		get {	invocations.append(.p_itemDuration_get); return __p_itemDuration ?? optionalGivenGetterValue(.p_itemDuration_get, "PlayerContextMock - stub value for itemDuration was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_itemDuration = newValue }
	}
	private var __p_itemDuration: (Double)?

    public var nowPlaying: NowPlaying {
		get {	invocations.append(.p_nowPlaying_get); return __p_nowPlaying ?? givenGetterValue(.p_nowPlaying_get, "PlayerContextMock - stub value for nowPlaying was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_nowPlaying = newValue }
	}
	private var __p_nowPlaying: (NowPlaying)?

    public var plugins: [PlayerPlugin] {
		get {	invocations.append(.p_plugins_get); return __p_plugins ?? givenGetterValue(.p_plugins_get, "PlayerContextMock - stub value for plugins was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_plugins = newValue }
	}
	private var __p_plugins: ([PlayerPlugin])?

    public var state: PlayerState! {
		get {	invocations.append(.p_state_get); return __p_state ?? optionalGivenGetterValue(.p_state_get, "PlayerContextMock - stub value for state was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_state = newValue }
	}
	private var __p_state: (PlayerState)?

    public var currentTime: Double {
		get {	invocations.append(.p_currentTime_get); return __p_currentTime ?? givenGetterValue(.p_currentTime_get, "PlayerContextMock - stub value for currentTime was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_currentTime = newValue }
	}
	private var __p_currentTime: (Double)?

    public var loopMode: Bool {
		get {	invocations.append(.p_loopMode_get); return __p_loopMode ?? givenGetterValue(.p_loopMode_get, "PlayerContextMock - stub value for loopMode was not defined") }
		set {	invocations.append(.p_loopMode_set(.value(newValue))); __p_loopMode = newValue }
	}
	private var __p_loopMode: (Bool)?

    public var player: AVPlayer {
		get {	invocations.append(.p_player_get); return __p_player ?? givenGetterValue(.p_player_get, "PlayerContextMock - stub value for player was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_player = newValue }
	}
	private var __p_player: (AVPlayer)?

    public var remoteCommands: [ModernAVPlayerRemoteCommand]? {
		get {	invocations.append(.p_remoteCommands_get); return __p_remoteCommands ?? optionalGivenGetterValue(.p_remoteCommands_get, "PlayerContextMock - stub value for remoteCommands was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_remoteCommands = newValue }
	}
	private var __p_remoteCommands: ([ModernAVPlayerRemoteCommand])?





    open func changeState(state: PlayerState) {
        addInvocation(.m_changeState__state_state(Parameter<PlayerState>.value(`state`)))
		let perform = methodPerformValue(.m_changeState__state_state(Parameter<PlayerState>.value(`state`))) as? (PlayerState) -> Void
		perform?(`state`)
    }

    open func updateMetadata(_ metadata: PlayerMediaMetadata) {
        addInvocation(.m_updateMetadata__metadata(Parameter<PlayerMediaMetadata>.value(`metadata`)))
		let perform = methodPerformValue(.m_updateMetadata__metadata(Parameter<PlayerMediaMetadata>.value(`metadata`))) as? (PlayerMediaMetadata) -> Void
		perform?(`metadata`)
    }

    open func load(media: PlayerMedia, autostart: Bool, position: Double?) {
        addInvocation(.m_load__media_mediaautostart_autostartposition_position(Parameter<PlayerMedia>.value(`media`), Parameter<Bool>.value(`autostart`), Parameter<Double?>.value(`position`)))
		let perform = methodPerformValue(.m_load__media_mediaautostart_autostartposition_position(Parameter<PlayerMedia>.value(`media`), Parameter<Bool>.value(`autostart`), Parameter<Double?>.value(`position`))) as? (PlayerMedia, Bool, Double?) -> Void
		perform?(`media`, `autostart`, `position`)
    }

    open func pause() {
        addInvocation(.m_pause)
		let perform = methodPerformValue(.m_pause) as? () -> Void
		perform?()
    }

    open func play() {
        addInvocation(.m_play)
		let perform = methodPerformValue(.m_play) as? () -> Void
		perform?()
    }

    open func seek(position: Double) {
        addInvocation(.m_seek__position_position(Parameter<Double>.value(`position`)))
		let perform = methodPerformValue(.m_seek__position_position(Parameter<Double>.value(`position`))) as? (Double) -> Void
		perform?(`position`)
    }

    open func stop() {
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
        case p_debugMessage_get
		case p_debugMessage_set(Parameter<String?>)
        case p_delegate_get
        case p_itemDuration_get
        case p_nowPlaying_get
        case p_plugins_get
        case p_state_get
        case p_currentTime_get
        case p_loopMode_get
		case p_loopMode_set(Parameter<Bool>)
        case p_player_get
        case p_remoteCommands_get

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
            case (.p_debugMessage_get,.p_debugMessage_get): return true
			case (.p_debugMessage_set(let left),.p_debugMessage_set(let right)): return Parameter<String?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_delegate_get,.p_delegate_get): return true
            case (.p_itemDuration_get,.p_itemDuration_get): return true
            case (.p_nowPlaying_get,.p_nowPlaying_get): return true
            case (.p_plugins_get,.p_plugins_get): return true
            case (.p_state_get,.p_state_get): return true
            case (.p_currentTime_get,.p_currentTime_get): return true
            case (.p_loopMode_get,.p_loopMode_get): return true
			case (.p_loopMode_set(let left),.p_loopMode_set(let right)): return Parameter<Bool>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_player_get,.p_player_get): return true
            case (.p_remoteCommands_get,.p_remoteCommands_get): return true
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
            case .p_debugMessage_get: return 0
			case .p_debugMessage_set(let newValue): return newValue.intValue
            case .p_delegate_get: return 0
            case .p_itemDuration_get: return 0
            case .p_nowPlaying_get: return 0
            case .p_plugins_get: return 0
            case .p_state_get: return 0
            case .p_currentTime_get: return 0
            case .p_loopMode_get: return 0
			case .p_loopMode_set(let newValue): return newValue.intValue
            case .p_player_get: return 0
            case .p_remoteCommands_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func audioSession(getter defaultValue: AudioSessionService...) -> PropertyStub {
            return Given(method: .p_audioSession_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func bgToken(getter defaultValue: UIBackgroundTaskIdentifier?...) -> PropertyStub {
            return Given(method: .p_bgToken_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func config(getter defaultValue: PlayerConfiguration...) -> PropertyStub {
            return Given(method: .p_config_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func currentMedia(getter defaultValue: PlayerMedia?...) -> PropertyStub {
            return Given(method: .p_currentMedia_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func currentItem(getter defaultValue: AVPlayerItem?...) -> PropertyStub {
            return Given(method: .p_currentItem_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func debugMessage(getter defaultValue: String?...) -> PropertyStub {
            return Given(method: .p_debugMessage_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func delegate(getter defaultValue: PlayerContextDelegate?...) -> PropertyStub {
            return Given(method: .p_delegate_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func itemDuration(getter defaultValue: Double?...) -> PropertyStub {
            return Given(method: .p_itemDuration_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func nowPlaying(getter defaultValue: NowPlaying...) -> PropertyStub {
            return Given(method: .p_nowPlaying_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func plugins(getter defaultValue: [PlayerPlugin]...) -> PropertyStub {
            return Given(method: .p_plugins_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func state(getter defaultValue: PlayerState?...) -> PropertyStub {
            return Given(method: .p_state_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func currentTime(getter defaultValue: Double...) -> PropertyStub {
            return Given(method: .p_currentTime_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func loopMode(getter defaultValue: Bool...) -> PropertyStub {
            return Given(method: .p_loopMode_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func player(getter defaultValue: AVPlayer...) -> PropertyStub {
            return Given(method: .p_player_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func remoteCommands(getter defaultValue: [ModernAVPlayerRemoteCommand]?...) -> PropertyStub {
            return Given(method: .p_remoteCommands_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func changeState(state: Parameter<PlayerState>) -> Verify { return Verify(method: .m_changeState__state_state(`state`))}
        public static func updateMetadata(_ metadata: Parameter<PlayerMediaMetadata>) -> Verify { return Verify(method: .m_updateMetadata__metadata(`metadata`))}
        public static func load(media: Parameter<PlayerMedia>, autostart: Parameter<Bool>, position: Parameter<Double?>) -> Verify { return Verify(method: .m_load__media_mediaautostart_autostartposition_position(`media`, `autostart`, `position`))}
        public static func pause() -> Verify { return Verify(method: .m_pause)}
        public static func play() -> Verify { return Verify(method: .m_play)}
        public static func seek(position: Parameter<Double>) -> Verify { return Verify(method: .m_seek__position_position(`position`))}
        public static func stop() -> Verify { return Verify(method: .m_stop)}
        public static var audioSession: Verify { return Verify(method: .p_audioSession_get) }
        public static var bgToken: Verify { return Verify(method: .p_bgToken_get) }
		public static func bgToken(set newValue: Parameter<UIBackgroundTaskIdentifier?>) -> Verify { return Verify(method: .p_bgToken_set(newValue)) }
        public static var config: Verify { return Verify(method: .p_config_get) }
        public static var currentMedia: Verify { return Verify(method: .p_currentMedia_get) }
		public static func currentMedia(set newValue: Parameter<PlayerMedia?>) -> Verify { return Verify(method: .p_currentMedia_set(newValue)) }
        public static var currentItem: Verify { return Verify(method: .p_currentItem_get) }
        public static var debugMessage: Verify { return Verify(method: .p_debugMessage_get) }
		public static func debugMessage(set newValue: Parameter<String?>) -> Verify { return Verify(method: .p_debugMessage_set(newValue)) }
        public static var delegate: Verify { return Verify(method: .p_delegate_get) }
        public static var itemDuration: Verify { return Verify(method: .p_itemDuration_get) }
        public static var nowPlaying: Verify { return Verify(method: .p_nowPlaying_get) }
        public static var plugins: Verify { return Verify(method: .p_plugins_get) }
        public static var state: Verify { return Verify(method: .p_state_get) }
        public static var currentTime: Verify { return Verify(method: .p_currentTime_get) }
        public static var loopMode: Verify { return Verify(method: .p_loopMode_get) }
		public static func loopMode(set newValue: Parameter<Bool>) -> Verify { return Verify(method: .p_loopMode_set(newValue)) }
        public static var player: Verify { return Verify(method: .p_player_get) }
        public static var remoteCommands: Verify { return Verify(method: .p_remoteCommands_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func changeState(state: Parameter<PlayerState>, perform: @escaping (PlayerState) -> Void) -> Perform {
            return Perform(method: .m_changeState__state_state(`state`), performs: perform)
        }
        public static func updateMetadata(_ metadata: Parameter<PlayerMediaMetadata>, perform: @escaping (PlayerMediaMetadata) -> Void) -> Perform {
            return Perform(method: .m_updateMetadata__metadata(`metadata`), performs: perform)
        }
        public static func load(media: Parameter<PlayerMedia>, autostart: Parameter<Bool>, position: Parameter<Double?>, perform: @escaping (PlayerMedia, Bool, Double?) -> Void) -> Perform {
            return Perform(method: .m_load__media_mediaautostart_autostartposition_position(`media`, `autostart`, `position`), performs: perform)
        }
        public static func pause(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_pause, performs: perform)
        }
        public static func play(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_play, performs: perform)
        }
        public static func seek(position: Parameter<Double>, perform: @escaping (Double) -> Void) -> Perform {
            return Perform(method: .m_seek__position_position(`position`), performs: perform)
        }
        public static func stop(perform: @escaping () -> Void) -> Perform {
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
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
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
open class PlayerMediaMock: PlayerMedia, Mock {
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

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    public var url: URL {
		get {	invocations.append(.p_url_get); return __p_url ?? givenGetterValue(.p_url_get, "PlayerMediaMock - stub value for url was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_url = newValue }
	}
	private var __p_url: (URL)?

    public var type: MediaType {
		get {	invocations.append(.p_type_get); return __p_type ?? givenGetterValue(.p_type_get, "PlayerMediaMock - stub value for type was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_type = newValue }
	}
	private var __p_type: (MediaType)?

    public var assetOptions: [String: Any]? {
		get {	invocations.append(.p_assetOptions_get); return __p_assetOptions ?? optionalGivenGetterValue(.p_assetOptions_get, "PlayerMediaMock - stub value for assetOptions was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_assetOptions = newValue }
	}
	private var __p_assetOptions: ([String: Any])?

    public var description: String {
		get {	invocations.append(.p_description_get); return __p_description ?? givenGetterValue(.p_description_get, "PlayerMediaMock - stub value for description was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_description = newValue }
	}
	private var __p_description: (String)?





    open func isLive() -> Bool {
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

    open func getMetadata() -> PlayerMediaMetadata? {
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

    open func setMetadata(_ metadata: PlayerMediaMetadata) {
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

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func url(getter defaultValue: URL...) -> PropertyStub {
            return Given(method: .p_url_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func type(getter defaultValue: MediaType...) -> PropertyStub {
            return Given(method: .p_type_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func assetOptions(getter defaultValue: [String: Any]?...) -> PropertyStub {
            return Given(method: .p_assetOptions_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func description(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_description_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func isLive(willReturn: Bool...) -> MethodStub {
            return Given(method: .m_isLive, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getMetadata(willReturn: PlayerMediaMetadata?...) -> MethodStub {
            return Given(method: .m_getMetadata, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func isLive(willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_isLive, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        public static func getMetadata(willProduce: (Stubber<PlayerMediaMetadata?>) -> Void) -> MethodStub {
            let willReturn: [PlayerMediaMetadata?] = []
			let given: Given = { return Given(method: .m_getMetadata, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (PlayerMediaMetadata?).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func isLive() -> Verify { return Verify(method: .m_isLive)}
        public static func getMetadata() -> Verify { return Verify(method: .m_getMetadata)}
        public static func setMetadata(_ metadata: Parameter<PlayerMediaMetadata>) -> Verify { return Verify(method: .m_setMetadata__metadata(`metadata`))}
        public static var url: Verify { return Verify(method: .p_url_get) }
        public static var type: Verify { return Verify(method: .p_type_get) }
        public static var assetOptions: Verify { return Verify(method: .p_assetOptions_get) }
        public static var description: Verify { return Verify(method: .p_description_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func isLive(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_isLive, performs: perform)
        }
        public static func getMetadata(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getMetadata, performs: perform)
        }
        public static func setMetadata(_ metadata: Parameter<PlayerMediaMetadata>, perform: @escaping (PlayerMediaMetadata) -> Void) -> Perform {
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
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
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
open class PlayerPluginMock: PlayerPlugin, Mock {
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

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }





    open func didInit(player: AVPlayer) {
        addInvocation(.m_didInit__player_player(Parameter<AVPlayer>.value(`player`)))
		let perform = methodPerformValue(.m_didInit__player_player(Parameter<AVPlayer>.value(`player`))) as? (AVPlayer) -> Void
		perform?(`player`)
    }

    open func willStartLoading(media: PlayerMedia) {
        addInvocation(.m_willStartLoading__media_media(Parameter<PlayerMedia>.value(`media`)))
		let perform = methodPerformValue(.m_willStartLoading__media_media(Parameter<PlayerMedia>.value(`media`))) as? (PlayerMedia) -> Void
		perform?(`media`)
    }

    open func didStartLoading(media: PlayerMedia) {
        addInvocation(.m_didStartLoading__media_media(Parameter<PlayerMedia>.value(`media`)))
		let perform = methodPerformValue(.m_didStartLoading__media_media(Parameter<PlayerMedia>.value(`media`))) as? (PlayerMedia) -> Void
		perform?(`media`)
    }

    open func didStartBuffering(media: PlayerMedia) {
        addInvocation(.m_didStartBuffering__media_media(Parameter<PlayerMedia>.value(`media`)))
		let perform = methodPerformValue(.m_didStartBuffering__media_media(Parameter<PlayerMedia>.value(`media`))) as? (PlayerMedia) -> Void
		perform?(`media`)
    }

    open func didLoad(media: PlayerMedia, duration: Double?) {
        addInvocation(.m_didLoad__media_mediaduration_duration(Parameter<PlayerMedia>.value(`media`), Parameter<Double?>.value(`duration`)))
		let perform = methodPerformValue(.m_didLoad__media_mediaduration_duration(Parameter<PlayerMedia>.value(`media`), Parameter<Double?>.value(`duration`))) as? (PlayerMedia, Double?) -> Void
		perform?(`media`, `duration`)
    }

    open func didMediaChanged(_ media: PlayerMedia, previousMedia: PlayerMedia?) {
        addInvocation(.m_didMediaChanged__mediapreviousMedia_previousMedia(Parameter<PlayerMedia>.value(`media`), Parameter<PlayerMedia?>.value(`previousMedia`)))
		let perform = methodPerformValue(.m_didMediaChanged__mediapreviousMedia_previousMedia(Parameter<PlayerMedia>.value(`media`), Parameter<PlayerMedia?>.value(`previousMedia`))) as? (PlayerMedia, PlayerMedia?) -> Void
		perform?(`media`, `previousMedia`)
    }

    open func willStartPlaying(media: PlayerMedia, position: Double) {
        addInvocation(.m_willStartPlaying__media_mediaposition_position(Parameter<PlayerMedia>.value(`media`), Parameter<Double>.value(`position`)))
		let perform = methodPerformValue(.m_willStartPlaying__media_mediaposition_position(Parameter<PlayerMedia>.value(`media`), Parameter<Double>.value(`position`))) as? (PlayerMedia, Double) -> Void
		perform?(`media`, `position`)
    }

    open func didStartPlaying(media: PlayerMedia) {
        addInvocation(.m_didStartPlaying__media_media(Parameter<PlayerMedia>.value(`media`)))
		let perform = methodPerformValue(.m_didStartPlaying__media_media(Parameter<PlayerMedia>.value(`media`))) as? (PlayerMedia) -> Void
		perform?(`media`)
    }

    open func didPaused(media: PlayerMedia?, position: Double) {
        addInvocation(.m_didPaused__media_mediaposition_position(Parameter<PlayerMedia?>.value(`media`), Parameter<Double>.value(`position`)))
		let perform = methodPerformValue(.m_didPaused__media_mediaposition_position(Parameter<PlayerMedia?>.value(`media`), Parameter<Double>.value(`position`))) as? (PlayerMedia?, Double) -> Void
		perform?(`media`, `position`)
    }

    open func didStopped(media: PlayerMedia?, position: Double) {
        addInvocation(.m_didStopped__media_mediaposition_position(Parameter<PlayerMedia?>.value(`media`), Parameter<Double>.value(`position`)))
		let perform = methodPerformValue(.m_didStopped__media_mediaposition_position(Parameter<PlayerMedia?>.value(`media`), Parameter<Double>.value(`position`))) as? (PlayerMedia?, Double) -> Void
		perform?(`media`, `position`)
    }

    open func didStartWaitingForNetwork(media: PlayerMedia) {
        addInvocation(.m_didStartWaitingForNetwork__media_media(Parameter<PlayerMedia>.value(`media`)))
		let perform = methodPerformValue(.m_didStartWaitingForNetwork__media_media(Parameter<PlayerMedia>.value(`media`))) as? (PlayerMedia) -> Void
		perform?(`media`)
    }

    open func didFailed(media: PlayerMedia, error: PlayerError) {
        addInvocation(.m_didFailed__media_mediaerror_error(Parameter<PlayerMedia>.value(`media`), Parameter<PlayerError>.value(`error`)))
		let perform = methodPerformValue(.m_didFailed__media_mediaerror_error(Parameter<PlayerMedia>.value(`media`), Parameter<PlayerError>.value(`error`))) as? (PlayerMedia, PlayerError) -> Void
		perform?(`media`, `error`)
    }

    open func didItemPlayToEndTime(media: PlayerMedia, endTime: Double) {
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
        case m_didPaused__media_mediaposition_position(Parameter<PlayerMedia?>, Parameter<Double>)
        case m_didStopped__media_mediaposition_position(Parameter<PlayerMedia?>, Parameter<Double>)
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

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func didInit(player: Parameter<AVPlayer>) -> Verify { return Verify(method: .m_didInit__player_player(`player`))}
        public static func willStartLoading(media: Parameter<PlayerMedia>) -> Verify { return Verify(method: .m_willStartLoading__media_media(`media`))}
        public static func didStartLoading(media: Parameter<PlayerMedia>) -> Verify { return Verify(method: .m_didStartLoading__media_media(`media`))}
        public static func didStartBuffering(media: Parameter<PlayerMedia>) -> Verify { return Verify(method: .m_didStartBuffering__media_media(`media`))}
        public static func didLoad(media: Parameter<PlayerMedia>, duration: Parameter<Double?>) -> Verify { return Verify(method: .m_didLoad__media_mediaduration_duration(`media`, `duration`))}
        public static func didMediaChanged(_ media: Parameter<PlayerMedia>, previousMedia: Parameter<PlayerMedia?>) -> Verify { return Verify(method: .m_didMediaChanged__mediapreviousMedia_previousMedia(`media`, `previousMedia`))}
        public static func willStartPlaying(media: Parameter<PlayerMedia>, position: Parameter<Double>) -> Verify { return Verify(method: .m_willStartPlaying__media_mediaposition_position(`media`, `position`))}
        public static func didStartPlaying(media: Parameter<PlayerMedia>) -> Verify { return Verify(method: .m_didStartPlaying__media_media(`media`))}
        public static func didPaused(media: Parameter<PlayerMedia?>, position: Parameter<Double>) -> Verify { return Verify(method: .m_didPaused__media_mediaposition_position(`media`, `position`))}
        public static func didStopped(media: Parameter<PlayerMedia?>, position: Parameter<Double>) -> Verify { return Verify(method: .m_didStopped__media_mediaposition_position(`media`, `position`))}
        public static func didStartWaitingForNetwork(media: Parameter<PlayerMedia>) -> Verify { return Verify(method: .m_didStartWaitingForNetwork__media_media(`media`))}
        public static func didFailed(media: Parameter<PlayerMedia>, error: Parameter<PlayerError>) -> Verify { return Verify(method: .m_didFailed__media_mediaerror_error(`media`, `error`))}
        public static func didItemPlayToEndTime(media: Parameter<PlayerMedia>, endTime: Parameter<Double>) -> Verify { return Verify(method: .m_didItemPlayToEndTime__media_mediaendTime_endTime(`media`, `endTime`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func didInit(player: Parameter<AVPlayer>, perform: @escaping (AVPlayer) -> Void) -> Perform {
            return Perform(method: .m_didInit__player_player(`player`), performs: perform)
        }
        public static func willStartLoading(media: Parameter<PlayerMedia>, perform: @escaping (PlayerMedia) -> Void) -> Perform {
            return Perform(method: .m_willStartLoading__media_media(`media`), performs: perform)
        }
        public static func didStartLoading(media: Parameter<PlayerMedia>, perform: @escaping (PlayerMedia) -> Void) -> Perform {
            return Perform(method: .m_didStartLoading__media_media(`media`), performs: perform)
        }
        public static func didStartBuffering(media: Parameter<PlayerMedia>, perform: @escaping (PlayerMedia) -> Void) -> Perform {
            return Perform(method: .m_didStartBuffering__media_media(`media`), performs: perform)
        }
        public static func didLoad(media: Parameter<PlayerMedia>, duration: Parameter<Double?>, perform: @escaping (PlayerMedia, Double?) -> Void) -> Perform {
            return Perform(method: .m_didLoad__media_mediaduration_duration(`media`, `duration`), performs: perform)
        }
        public static func didMediaChanged(_ media: Parameter<PlayerMedia>, previousMedia: Parameter<PlayerMedia?>, perform: @escaping (PlayerMedia, PlayerMedia?) -> Void) -> Perform {
            return Perform(method: .m_didMediaChanged__mediapreviousMedia_previousMedia(`media`, `previousMedia`), performs: perform)
        }
        public static func willStartPlaying(media: Parameter<PlayerMedia>, position: Parameter<Double>, perform: @escaping (PlayerMedia, Double) -> Void) -> Perform {
            return Perform(method: .m_willStartPlaying__media_mediaposition_position(`media`, `position`), performs: perform)
        }
        public static func didStartPlaying(media: Parameter<PlayerMedia>, perform: @escaping (PlayerMedia) -> Void) -> Perform {
            return Perform(method: .m_didStartPlaying__media_media(`media`), performs: perform)
        }
        public static func didPaused(media: Parameter<PlayerMedia?>, position: Parameter<Double>, perform: @escaping (PlayerMedia?, Double) -> Void) -> Perform {
            return Perform(method: .m_didPaused__media_mediaposition_position(`media`, `position`), performs: perform)
        }
        public static func didStopped(media: Parameter<PlayerMedia?>, position: Parameter<Double>, perform: @escaping (PlayerMedia?, Double) -> Void) -> Perform {
            return Perform(method: .m_didStopped__media_mediaposition_position(`media`, `position`), performs: perform)
        }
        public static func didStartWaitingForNetwork(media: Parameter<PlayerMedia>, perform: @escaping (PlayerMedia) -> Void) -> Perform {
            return Perform(method: .m_didStartWaitingForNetwork__media_media(`media`), performs: perform)
        }
        public static func didFailed(media: Parameter<PlayerMedia>, error: Parameter<PlayerError>, perform: @escaping (PlayerMedia, PlayerError) -> Void) -> Perform {
            return Perform(method: .m_didFailed__media_mediaerror_error(`media`, `error`), performs: perform)
        }
        public static func didItemPlayToEndTime(media: Parameter<PlayerMedia>, endTime: Parameter<Double>, perform: @escaping (PlayerMedia, Double) -> Void) -> Perform {
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
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        invocations.append(call)
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
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

