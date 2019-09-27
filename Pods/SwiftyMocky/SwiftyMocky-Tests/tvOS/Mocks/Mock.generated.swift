// Generated using Sourcery 0.16.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// Generated with SwiftyMocky 3.3.3

import SwiftyMocky
#if !MockyCustom
import XCTest
#endif
@testable import Mocky_Example_tvOS

// MARK: - AMassiveTestProtocol
open class AMassiveTestProtocolMock: AMassiveTestProtocol, Mock, StaticMock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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
    static var matcher: Matcher = Matcher.default
    static var stubbingPolicy: StubbingPolicy = .wrap
    static var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    public typealias StaticPropertyStub = StaticGiven
    public typealias StaticMethodStub = StaticGiven
    public static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    public var nonOptionalClosure: () -> Void {
		get {	invocations.append(.p_nonOptionalClosure_get); return __p_nonOptionalClosure ?? givenGetterValue(.p_nonOptionalClosure_get, "AMassiveTestProtocolMock - stub value for nonOptionalClosure was not defined") }
		set {	invocations.append(.p_nonOptionalClosure_set(.value(newValue))); __p_nonOptionalClosure = newValue }
	}
	private var __p_nonOptionalClosure: (() -> Void)?

    public var optionalClosure: (() -> Int)? {
		get {	invocations.append(.p_optionalClosure_get); return __p_optionalClosure ?? optionalGivenGetterValue(.p_optionalClosure_get, "AMassiveTestProtocolMock - stub value for optionalClosure was not defined") }
		set {	invocations.append(.p_optionalClosure_set(.value(newValue))); __p_optionalClosure = newValue }
	}
	private var __p_optionalClosure: (() -> Int)?

    public var implicitelyUnwrappedClosure: (() -> Void)! {
		get {	invocations.append(.p_implicitelyUnwrappedClosure_get); return __p_implicitelyUnwrappedClosure ?? optionalGivenGetterValue(.p_implicitelyUnwrappedClosure_get, "AMassiveTestProtocolMock - stub value for implicitelyUnwrappedClosure was not defined") }
		set {	invocations.append(.p_implicitelyUnwrappedClosure_set(.value(newValue))); __p_implicitelyUnwrappedClosure = newValue }
	}
	private var __p_implicitelyUnwrappedClosure: (() -> Void)?


    public static var optionalClosure: (() -> Int)? {
		get {	AMassiveTestProtocolMock.invocations.append(.p_optionalClosure_get); return AMassiveTestProtocolMock.__p_optionalClosure ?? optionalGivenGetterValue(.p_optionalClosure_get, "AMassiveTestProtocolMock - stub value for optionalClosure was not defined") }
		set {	AMassiveTestProtocolMock.invocations.append(.p_optionalClosure_set(.value(newValue))); AMassiveTestProtocolMock.__p_optionalClosure = newValue }
	}
	private static var __p_optionalClosure: (() -> Int)?




    public static func methodThatThrows() throws {
        addInvocation(.sm_methodThatThrows)
		let perform = methodPerformValue(.sm_methodThatThrows) as? () -> Void
		perform?()
		do {
		    _ = try methodReturnValue(.sm_methodThatThrows).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }

    public static func methodThatReturnsAndThrows(param: String) throws -> Int {
        addInvocation(.sm_methodThatReturnsAndThrows__param_param(Parameter<String>.value(`param`)))
		let perform = methodPerformValue(.sm_methodThatReturnsAndThrows__param_param(Parameter<String>.value(`param`))) as? (String) -> Void
		perform?(`param`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.sm_methodThatReturnsAndThrows__param_param(Parameter<String>.value(`param`))).casted()
		} catch MockError.notStubed {
			Failure("Stub return value not specified for methodThatReturnsAndThrows(param: String). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    public static func methodThatRethrows(param: (String) throws -> Int) rethrows -> Int {
        addInvocation(.sm_methodThatRethrows__param_param(Parameter<(String) throws -> Int>.any))
		let perform = methodPerformValue(.sm_methodThatRethrows__param_param(Parameter<(String) throws -> Int>.any)) as? ((String) throws -> Int) -> Void
		perform?(`param`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.sm_methodThatRethrows__param_param(Parameter<(String) throws -> Int>.any)).casted()
		} catch {
			Failure("Stub return value not specified for methodThatRethrows(param: (String) throws -> Int). Use given")
		}
		return __value
    }

    public required init() { }

    public required init(_ sth: Int) { }

    open func methodThatThrows() throws {
        addInvocation(.m_methodThatThrows)
		let perform = methodPerformValue(.m_methodThatThrows) as? () -> Void
		perform?()
		do {
		    _ = try methodReturnValue(.m_methodThatThrows).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }

    open func methodThatReturnsAndThrows(param: String) throws -> Int {
        addInvocation(.m_methodThatReturnsAndThrows__param_param(Parameter<String>.value(`param`)))
		let perform = methodPerformValue(.m_methodThatReturnsAndThrows__param_param(Parameter<String>.value(`param`))) as? (String) -> Void
		perform?(`param`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodThatReturnsAndThrows__param_param(Parameter<String>.value(`param`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for methodThatReturnsAndThrows(param: String). Use given")
			Failure("Stub return value not specified for methodThatReturnsAndThrows(param: String). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    open func methodThatRethrows(param: (String) throws -> Int) rethrows -> Int {
        addInvocation(.m_methodThatRethrows__param_param(Parameter<(String) throws -> Int>.any))
		let perform = methodPerformValue(.m_methodThatRethrows__param_param(Parameter<(String) throws -> Int>.any)) as? ((String) throws -> Int) -> Void
		perform?(`param`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodThatRethrows__param_param(Parameter<(String) throws -> Int>.any)).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodThatRethrows(param: (String) throws -> Int). Use given")
			Failure("Stub return value not specified for methodThatRethrows(param: (String) throws -> Int). Use given")
		}
		return __value
    }

    fileprivate enum StaticMethodType {
        case sm_methodThatThrows
        case sm_methodThatReturnsAndThrows__param_param(Parameter<String>)
        case sm_methodThatRethrows__param_param(Parameter<(String) throws -> Int>)
        case p_optionalClosure_get
		case p_optionalClosure_set(Parameter<(() -> Int)?>)

        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.sm_methodThatThrows, .sm_methodThatThrows):
                return true 
            case (.sm_methodThatReturnsAndThrows__param_param(let lhsParam), .sm_methodThatReturnsAndThrows__param_param(let rhsParam)):
                guard Parameter.compare(lhs: lhsParam, rhs: rhsParam, with: matcher) else { return false } 
                return true 
            case (.sm_methodThatRethrows__param_param(let lhsParam), .sm_methodThatRethrows__param_param(let rhsParam)):
                guard Parameter.compare(lhs: lhsParam, rhs: rhsParam, with: matcher) else { return false } 
                return true 
            case (.p_optionalClosure_get,.p_optionalClosure_get): return true
			case (.p_optionalClosure_set(let left),.p_optionalClosure_set(let right)): return Parameter<(() -> Int)?>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case .sm_methodThatThrows: return 0
                case let .sm_methodThatReturnsAndThrows__param_param(p0): return p0.intValue
                case let .sm_methodThatRethrows__param_param(p0): return p0.intValue
                case .p_optionalClosure_get: return 0
			case .p_optionalClosure_set(let newValue): return newValue.intValue
            }
        }
    }

    open class StaticGiven: StubbedMethod {
        fileprivate var method: StaticMethodType

        private init(method: StaticMethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func optionalClosure(getter defaultValue: (() -> Int)?...) -> StaticPropertyStub {
            return StaticGiven(method: .p_optionalClosure_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func methodThatReturnsAndThrows(param: Parameter<String>, willReturn: Int...) -> StaticMethodStub {
            return StaticGiven(method: .sm_methodThatReturnsAndThrows__param_param(`param`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodThatRethrows(param: Parameter<(String) throws -> Int>, willReturn: Int...) -> StaticMethodStub {
            return StaticGiven(method: .sm_methodThatRethrows__param_param(`param`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodThatThrows(willThrow: Error...) -> StaticMethodStub {
            return StaticGiven(method: .sm_methodThatThrows, products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func methodThatThrows(willProduce: (StubberThrows<Void>) -> Void) -> StaticMethodStub {
            let willThrow: [Error] = []
			let given: StaticGiven = { return StaticGiven(method: .sm_methodThatThrows, products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
        public static func methodThatReturnsAndThrows(param: Parameter<String>, willThrow: Error...) -> StaticMethodStub {
            return StaticGiven(method: .sm_methodThatReturnsAndThrows__param_param(`param`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func methodThatReturnsAndThrows(param: Parameter<String>, willProduce: (StubberThrows<Int>) -> Void) -> StaticMethodStub {
            let willThrow: [Error] = []
			let given: StaticGiven = { return StaticGiven(method: .sm_methodThatReturnsAndThrows__param_param(`param`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func methodThatRethrows(param: Parameter<(String) throws -> Int>, willThrow: Error...) -> StaticMethodStub {
            return StaticGiven(method: .sm_methodThatRethrows__param_param(`param`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func methodThatRethrows(param: Parameter<(String) throws -> Int>, willProduce: (StubberThrows<Int>) -> Void) -> StaticMethodStub {
            let willThrow: [Error] = []
			let given: StaticGiven = { return StaticGiven(method: .sm_methodThatRethrows__param_param(`param`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Int).self)
			willProduce(stubber)
			return given
        }
    }

    public struct StaticVerify {
        fileprivate var method: StaticMethodType

        public static func methodThatThrows() -> StaticVerify { return StaticVerify(method: .sm_methodThatThrows)}
        public static func methodThatReturnsAndThrows(param: Parameter<String>) -> StaticVerify { return StaticVerify(method: .sm_methodThatReturnsAndThrows__param_param(`param`))}
        public static func methodThatRethrows(param: Parameter<(String) throws -> Int>) -> StaticVerify { return StaticVerify(method: .sm_methodThatRethrows__param_param(`param`))}
        public static var optionalClosure: StaticVerify { return StaticVerify(method: .p_optionalClosure_get) }
		public static func optionalClosure(set newValue: Parameter<(() -> Int)?>) -> StaticVerify { return StaticVerify(method: .p_optionalClosure_set(newValue)) }
    }

    public struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        public static func methodThatThrows(perform: @escaping () -> Void) -> StaticPerform {
            return StaticPerform(method: .sm_methodThatThrows, performs: perform)
        }
        public static func methodThatReturnsAndThrows(param: Parameter<String>, perform: @escaping (String) -> Void) -> StaticPerform {
            return StaticPerform(method: .sm_methodThatReturnsAndThrows__param_param(`param`), performs: perform)
        }
        public static func methodThatRethrows(param: Parameter<(String) throws -> Int>, perform: @escaping ((String) throws -> Int) -> Void) -> StaticPerform {
            return StaticPerform(method: .sm_methodThatRethrows__param_param(`param`), performs: perform)
        }
    }

    
    fileprivate enum MethodType {
        case m_methodThatThrows
        case m_methodThatReturnsAndThrows__param_param(Parameter<String>)
        case m_methodThatRethrows__param_param(Parameter<(String) throws -> Int>)
        case p_nonOptionalClosure_get
		case p_nonOptionalClosure_set(Parameter<() -> Void>)
        case p_optionalClosure_get
		case p_optionalClosure_set(Parameter<(() -> Int)?>)
        case p_implicitelyUnwrappedClosure_get
		case p_implicitelyUnwrappedClosure_set(Parameter<(() -> Void)?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_methodThatThrows, .m_methodThatThrows):
                return true 
            case (.m_methodThatReturnsAndThrows__param_param(let lhsParam), .m_methodThatReturnsAndThrows__param_param(let rhsParam)):
                guard Parameter.compare(lhs: lhsParam, rhs: rhsParam, with: matcher) else { return false } 
                return true 
            case (.m_methodThatRethrows__param_param(let lhsParam), .m_methodThatRethrows__param_param(let rhsParam)):
                guard Parameter.compare(lhs: lhsParam, rhs: rhsParam, with: matcher) else { return false } 
                return true 
            case (.p_nonOptionalClosure_get,.p_nonOptionalClosure_get): return true
			case (.p_nonOptionalClosure_set(let left),.p_nonOptionalClosure_set(let right)): return Parameter<() -> Void>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_optionalClosure_get,.p_optionalClosure_get): return true
			case (.p_optionalClosure_set(let left),.p_optionalClosure_set(let right)): return Parameter<(() -> Int)?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_implicitelyUnwrappedClosure_get,.p_implicitelyUnwrappedClosure_get): return true
			case (.p_implicitelyUnwrappedClosure_set(let left),.p_implicitelyUnwrappedClosure_set(let right)): return Parameter<(() -> Void)?>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_methodThatThrows: return 0
            case let .m_methodThatReturnsAndThrows__param_param(p0): return p0.intValue
            case let .m_methodThatRethrows__param_param(p0): return p0.intValue
            case .p_nonOptionalClosure_get: return 0
			case .p_nonOptionalClosure_set(let newValue): return newValue.intValue
            case .p_optionalClosure_get: return 0
			case .p_optionalClosure_set(let newValue): return newValue.intValue
            case .p_implicitelyUnwrappedClosure_get: return 0
			case .p_implicitelyUnwrappedClosure_set(let newValue): return newValue.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func nonOptionalClosure(getter defaultValue: () -> Void...) -> PropertyStub {
            return Given(method: .p_nonOptionalClosure_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func optionalClosure(getter defaultValue: (() -> Int)?...) -> PropertyStub {
            return Given(method: .p_optionalClosure_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func implicitelyUnwrappedClosure(getter defaultValue: (() -> Void)?...) -> PropertyStub {
            return Given(method: .p_implicitelyUnwrappedClosure_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func methodThatReturnsAndThrows(param: Parameter<String>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodThatReturnsAndThrows__param_param(`param`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodThatRethrows(param: Parameter<(String) throws -> Int>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodThatRethrows__param_param(`param`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodThatThrows(willThrow: Error...) -> MethodStub {
            return Given(method: .m_methodThatThrows, products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func methodThatThrows(willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_methodThatThrows, products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
        public static func methodThatReturnsAndThrows(param: Parameter<String>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_methodThatReturnsAndThrows__param_param(`param`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func methodThatReturnsAndThrows(param: Parameter<String>, willProduce: (StubberThrows<Int>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_methodThatReturnsAndThrows__param_param(`param`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func methodThatRethrows(param: Parameter<(String) throws -> Int>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_methodThatRethrows__param_param(`param`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func methodThatRethrows(param: Parameter<(String) throws -> Int>, willProduce: (StubberThrows<Int>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_methodThatRethrows__param_param(`param`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Int).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodThatThrows() -> Verify { return Verify(method: .m_methodThatThrows)}
        public static func methodThatReturnsAndThrows(param: Parameter<String>) -> Verify { return Verify(method: .m_methodThatReturnsAndThrows__param_param(`param`))}
        public static func methodThatRethrows(param: Parameter<(String) throws -> Int>) -> Verify { return Verify(method: .m_methodThatRethrows__param_param(`param`))}
        public static var nonOptionalClosure: Verify { return Verify(method: .p_nonOptionalClosure_get) }
		public static func nonOptionalClosure(set newValue: Parameter<() -> Void>) -> Verify { return Verify(method: .p_nonOptionalClosure_set(newValue)) }
        public static var optionalClosure: Verify { return Verify(method: .p_optionalClosure_get) }
		public static func optionalClosure(set newValue: Parameter<(() -> Int)?>) -> Verify { return Verify(method: .p_optionalClosure_set(newValue)) }
        public static var implicitelyUnwrappedClosure: Verify { return Verify(method: .p_implicitelyUnwrappedClosure_get) }
		public static func implicitelyUnwrappedClosure(set newValue: Parameter<(() -> Void)?>) -> Verify { return Verify(method: .p_implicitelyUnwrappedClosure_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodThatThrows(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_methodThatThrows, performs: perform)
        }
        public static func methodThatReturnsAndThrows(param: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_methodThatReturnsAndThrows__param_param(`param`), performs: perform)
        }
        public static func methodThatRethrows(param: Parameter<(String) throws -> Int>, perform: @escaping ((String) throws -> Int) -> Void) -> Perform {
            return Perform(method: .m_methodThatRethrows__param_param(`param`), performs: perform)
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

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }
    static private func methodReturnValue(_ method: StaticMethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }
    static private func givenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            Failure(message)
        }
    }
    static private func optionalGivenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
}

// MARK: - AVeryAssociatedProtocol
open class AVeryAssociatedProtocolMock<T1,T2>: AVeryAssociatedProtocol, Mock where T1: Sequence, T2: Comparable, T2: EmptyProtocol {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func fetch(for value: T2) -> T1 {
        addInvocation(.m_fetch__for_value(Parameter<T2>.value(`value`)))
		let perform = methodPerformValue(.m_fetch__for_value(Parameter<T2>.value(`value`))) as? (T2) -> Void
		perform?(`value`)
		var __value: T1
		do {
		    __value = try methodReturnValue(.m_fetch__for_value(Parameter<T2>.value(`value`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for fetch(for value: T2). Use given")
			Failure("Stub return value not specified for fetch(for value: T2). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_fetch__for_value(Parameter<T2>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_fetch__for_value(let lhsValue), .m_fetch__for_value(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_fetch__for_value(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func fetch(for value: Parameter<T2>, willReturn: T1...) -> MethodStub {
            return Given(method: .m_fetch__for_value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func fetch(for value: Parameter<T2>, willProduce: (Stubber<T1>) -> Void) -> MethodStub {
            let willReturn: [T1] = []
			let given: Given = { return Given(method: .m_fetch__for_value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (T1).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func fetch(for value: Parameter<T2>) -> Verify { return Verify(method: .m_fetch__for_value(`value`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func fetch(for value: Parameter<T2>, perform: @escaping (T2) -> Void) -> Perform {
            return Perform(method: .m_fetch__for_value(`value`), performs: perform)
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

// MARK: - AVeryGenericProtocol
open class AVeryGenericProtocolMock: AVeryGenericProtocol, Mock, StaticMock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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
    static var matcher: Matcher = Matcher.default
    static var stubbingPolicy: StubbingPolicy = .wrap
    static var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    public typealias StaticPropertyStub = StaticGiven
    public typealias StaticMethodStub = StaticGiven
    public static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }





    public static func generic<Q>(lhs: Q, rhs: Q) -> Bool where Q: Equatable {
        addInvocation(.sm_generic__lhs_lhsrhs_rhs(Parameter<Q>.value(`lhs`).wrapAsGeneric(), Parameter<Q>.value(`rhs`).wrapAsGeneric()))
		let perform = methodPerformValue(.sm_generic__lhs_lhsrhs_rhs(Parameter<Q>.value(`lhs`).wrapAsGeneric(), Parameter<Q>.value(`rhs`).wrapAsGeneric())) as? (Q, Q) -> Void
		perform?(`lhs`, `rhs`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.sm_generic__lhs_lhsrhs_rhs(Parameter<Q>.value(`lhs`).wrapAsGeneric(), Parameter<Q>.value(`rhs`).wrapAsGeneric())).casted()
		} catch {
			Failure("Stub return value not specified for generic<Q>(lhs: Q, rhs: Q). Use given")
		}
		return __value
    }

    public static func veryConstrained<Q: Sequence>(lhs: Q, rhs: Q) -> Bool where Q: Equatable {
        addInvocation(.sm_veryConstrained__lhs_lhsrhs_rhs(Parameter<Q>.value(`lhs`).wrapAsGeneric(), Parameter<Q>.value(`rhs`).wrapAsGeneric()))
		let perform = methodPerformValue(.sm_veryConstrained__lhs_lhsrhs_rhs(Parameter<Q>.value(`lhs`).wrapAsGeneric(), Parameter<Q>.value(`rhs`).wrapAsGeneric())) as? (Q, Q) -> Void
		perform?(`lhs`, `rhs`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.sm_veryConstrained__lhs_lhsrhs_rhs(Parameter<Q>.value(`lhs`).wrapAsGeneric(), Parameter<Q>.value(`rhs`).wrapAsGeneric())).casted()
		} catch {
			Failure("Stub return value not specified for veryConstrained<Q: Sequence>(lhs: Q, rhs: Q). Use given")
		}
		return __value
    }

    public required init<V>(value: V) { }

    open func methodConstrained<A,B,C>(param: A) -> (B,C) {
        addInvocation(.m_methodConstrained__param_param(Parameter<A>.value(`param`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_methodConstrained__param_param(Parameter<A>.value(`param`).wrapAsGeneric())) as? (A) -> Void
		perform?(`param`)
		var __value: (B,C)
		do {
		    __value = try methodReturnValue(.m_methodConstrained__param_param(Parameter<A>.value(`param`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodConstrained<A,B,C>(param: A). Use given")
			Failure("Stub return value not specified for methodConstrained<A,B,C>(param: A). Use given")
		}
		return __value
    }

    fileprivate enum StaticMethodType {
        case sm_generic__lhs_lhsrhs_rhs(Parameter<GenericAttribute>, Parameter<GenericAttribute>)
        case sm_veryConstrained__lhs_lhsrhs_rhs(Parameter<GenericAttribute>, Parameter<GenericAttribute>)

        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.sm_generic__lhs_lhsrhs_rhs(let lhsLhs, let lhsRhs), .sm_generic__lhs_lhsrhs_rhs(let rhsLhs, let rhsRhs)):
                guard Parameter.compare(lhs: lhsLhs, rhs: rhsLhs, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsRhs, rhs: rhsRhs, with: matcher) else { return false } 
                return true 
            case (.sm_veryConstrained__lhs_lhsrhs_rhs(let lhsLhs, let lhsRhs), .sm_veryConstrained__lhs_lhsrhs_rhs(let rhsLhs, let rhsRhs)):
                guard Parameter.compare(lhs: lhsLhs, rhs: rhsLhs, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsRhs, rhs: rhsRhs, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .sm_generic__lhs_lhsrhs_rhs(p0, p1): return p0.intValue + p1.intValue
                case let .sm_veryConstrained__lhs_lhsrhs_rhs(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class StaticGiven: StubbedMethod {
        fileprivate var method: StaticMethodType

        private init(method: StaticMethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func generic<Q>(lhs: Parameter<Q>, rhs: Parameter<Q>, willReturn: Bool...) -> StaticMethodStub where Q: Equatable {
            return StaticGiven(method: .sm_generic__lhs_lhsrhs_rhs(`lhs`.wrapAsGeneric(), `rhs`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func veryConstrained<Q: Sequence>(lhs: Parameter<Q>, rhs: Parameter<Q>, willReturn: Bool...) -> StaticMethodStub where Q: Equatable {
            return StaticGiven(method: .sm_veryConstrained__lhs_lhsrhs_rhs(`lhs`.wrapAsGeneric(), `rhs`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func generic<Q>(lhs: Parameter<Q>, rhs: Parameter<Q>, willProduce: (Stubber<Bool>) -> Void) -> StaticMethodStub where Q: Equatable {
            let willReturn: [Bool] = []
			let given: StaticGiven = { return StaticGiven(method: .sm_generic__lhs_lhsrhs_rhs(`lhs`.wrapAsGeneric(), `rhs`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        public static func veryConstrained<Q: Sequence>(lhs: Parameter<Q>, rhs: Parameter<Q>, willProduce: (Stubber<Bool>) -> Void) -> StaticMethodStub where Q: Equatable {
            let willReturn: [Bool] = []
			let given: StaticGiven = { return StaticGiven(method: .sm_veryConstrained__lhs_lhsrhs_rhs(`lhs`.wrapAsGeneric(), `rhs`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct StaticVerify {
        fileprivate var method: StaticMethodType

        public static func generic<Q>(lhs: Parameter<Q>, rhs: Parameter<Q>) -> StaticVerify { return StaticVerify(method: .sm_generic__lhs_lhsrhs_rhs(`lhs`.wrapAsGeneric(), `rhs`.wrapAsGeneric()))}
        public static func veryConstrained<Q>(lhs: Parameter<Q>, rhs: Parameter<Q>) -> StaticVerify where Q:Sequence { return StaticVerify(method: .sm_veryConstrained__lhs_lhsrhs_rhs(`lhs`.wrapAsGeneric(), `rhs`.wrapAsGeneric()))}
    }

    public struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        public static func generic<Q>(lhs: Parameter<Q>, rhs: Parameter<Q>, perform: @escaping (Q, Q) -> Void) -> StaticPerform {
            return StaticPerform(method: .sm_generic__lhs_lhsrhs_rhs(`lhs`.wrapAsGeneric(), `rhs`.wrapAsGeneric()), performs: perform)
        }
        public static func veryConstrained<Q>(lhs: Parameter<Q>, rhs: Parameter<Q>, perform: @escaping (Q, Q) -> Void) -> StaticPerform where Q:Sequence {
            return StaticPerform(method: .sm_veryConstrained__lhs_lhsrhs_rhs(`lhs`.wrapAsGeneric(), `rhs`.wrapAsGeneric()), performs: perform)
        }
    }

    
    fileprivate enum MethodType {
        case m_methodConstrained__param_param(Parameter<GenericAttribute>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_methodConstrained__param_param(let lhsParam), .m_methodConstrained__param_param(let rhsParam)):
                guard Parameter.compare(lhs: lhsParam, rhs: rhsParam, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_methodConstrained__param_param(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func methodConstrained<A,B,C>(param: Parameter<A>, willReturn: (B,C)...) -> MethodStub {
            return Given(method: .m_methodConstrained__param_param(`param`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodConstrained<A,B,C>(param: Parameter<A>, willProduce: (Stubber<(B,C)>) -> Void) -> MethodStub {
            let willReturn: [(B,C)] = []
			let given: Given = { return Given(method: .m_methodConstrained__param_param(`param`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: ((B,C)).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodConstrained<A>(param: Parameter<A>) -> Verify { return Verify(method: .m_methodConstrained__param_param(`param`.wrapAsGeneric()))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodConstrained<A>(param: Parameter<A>, perform: @escaping (A) -> Void) -> Perform {
            return Perform(method: .m_methodConstrained__param_param(`param`.wrapAsGeneric()), performs: perform)
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

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }
    static private func methodReturnValue(_ method: StaticMethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }
    static private func givenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            Failure(message)
        }
    }
    static private func optionalGivenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
}

// MARK: - AllLiteralsContainer
open class AllLiteralsContainerMock: AllLiteralsContainer, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func methodWithStringParameter(p: String) -> Int {
        addInvocation(.m_methodWithStringParameter__p_p(Parameter<String>.value(`p`)))
		let perform = methodPerformValue(.m_methodWithStringParameter__p_p(Parameter<String>.value(`p`))) as? (String) -> Void
		perform?(`p`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodWithStringParameter__p_p(Parameter<String>.value(`p`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithStringParameter(p: String). Use given")
			Failure("Stub return value not specified for methodWithStringParameter(p: String). Use given")
		}
		return __value
    }

    open func methodWithOtionalStringParameter(p: String?) -> Int {
        addInvocation(.m_methodWithOtionalStringParameter__p_p(Parameter<String?>.value(`p`)))
		let perform = methodPerformValue(.m_methodWithOtionalStringParameter__p_p(Parameter<String?>.value(`p`))) as? (String?) -> Void
		perform?(`p`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodWithOtionalStringParameter__p_p(Parameter<String?>.value(`p`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithOtionalStringParameter(p: String?). Use given")
			Failure("Stub return value not specified for methodWithOtionalStringParameter(p: String?). Use given")
		}
		return __value
    }

    open func methodWithCustomStringParameter(p: CustomString) -> Int {
        addInvocation(.m_methodWithCustomStringParameter__p_p(Parameter<CustomString>.value(`p`)))
		let perform = methodPerformValue(.m_methodWithCustomStringParameter__p_p(Parameter<CustomString>.value(`p`))) as? (CustomString) -> Void
		perform?(`p`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodWithCustomStringParameter__p_p(Parameter<CustomString>.value(`p`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithCustomStringParameter(p: CustomString). Use given")
			Failure("Stub return value not specified for methodWithCustomStringParameter(p: CustomString). Use given")
		}
		return __value
    }

    open func methodWithCustomOptionalStringParameter(p: CustomString?) -> Int {
        addInvocation(.m_methodWithCustomOptionalStringParameter__p_p(Parameter<CustomString?>.value(`p`)))
		let perform = methodPerformValue(.m_methodWithCustomOptionalStringParameter__p_p(Parameter<CustomString?>.value(`p`))) as? (CustomString?) -> Void
		perform?(`p`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodWithCustomOptionalStringParameter__p_p(Parameter<CustomString?>.value(`p`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithCustomOptionalStringParameter(p: CustomString?). Use given")
			Failure("Stub return value not specified for methodWithCustomOptionalStringParameter(p: CustomString?). Use given")
		}
		return __value
    }

    open func methodWithIntParameter(p: Int) -> Int {
        addInvocation(.m_methodWithIntParameter__p_p(Parameter<Int>.value(`p`)))
		let perform = methodPerformValue(.m_methodWithIntParameter__p_p(Parameter<Int>.value(`p`))) as? (Int) -> Void
		perform?(`p`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodWithIntParameter__p_p(Parameter<Int>.value(`p`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithIntParameter(p: Int). Use given")
			Failure("Stub return value not specified for methodWithIntParameter(p: Int). Use given")
		}
		return __value
    }

    open func methodWithCustomOptionalIntParameter(p: CustomInt?) -> Int {
        addInvocation(.m_methodWithCustomOptionalIntParameter__p_p(Parameter<CustomInt?>.value(`p`)))
		let perform = methodPerformValue(.m_methodWithCustomOptionalIntParameter__p_p(Parameter<CustomInt?>.value(`p`))) as? (CustomInt?) -> Void
		perform?(`p`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodWithCustomOptionalIntParameter__p_p(Parameter<CustomInt?>.value(`p`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithCustomOptionalIntParameter(p: CustomInt?). Use given")
			Failure("Stub return value not specified for methodWithCustomOptionalIntParameter(p: CustomInt?). Use given")
		}
		return __value
    }

    open func methodWithBool(p: Bool?) -> Int {
        addInvocation(.m_methodWithBool__p_p(Parameter<Bool?>.value(`p`)))
		let perform = methodPerformValue(.m_methodWithBool__p_p(Parameter<Bool?>.value(`p`))) as? (Bool?) -> Void
		perform?(`p`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodWithBool__p_p(Parameter<Bool?>.value(`p`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithBool(p: Bool?). Use given")
			Failure("Stub return value not specified for methodWithBool(p: Bool?). Use given")
		}
		return __value
    }

    open func methodWithFloat(p: Float?) -> Int {
        addInvocation(.m_methodWithFloat__p_p(Parameter<Float?>.value(`p`)))
		let perform = methodPerformValue(.m_methodWithFloat__p_p(Parameter<Float?>.value(`p`))) as? (Float?) -> Void
		perform?(`p`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodWithFloat__p_p(Parameter<Float?>.value(`p`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithFloat(p: Float?). Use given")
			Failure("Stub return value not specified for methodWithFloat(p: Float?). Use given")
		}
		return __value
    }

    open func methodWithDouble(p: Double?) -> Int {
        addInvocation(.m_methodWithDouble__p_p(Parameter<Double?>.value(`p`)))
		let perform = methodPerformValue(.m_methodWithDouble__p_p(Parameter<Double?>.value(`p`))) as? (Double?) -> Void
		perform?(`p`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodWithDouble__p_p(Parameter<Double?>.value(`p`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithDouble(p: Double?). Use given")
			Failure("Stub return value not specified for methodWithDouble(p: Double?). Use given")
		}
		return __value
    }

    open func methodWithArrayOfInt(p: [Int]) -> Int {
        addInvocation(.m_methodWithArrayOfInt__p_p(Parameter<[Int]>.value(`p`)))
		let perform = methodPerformValue(.m_methodWithArrayOfInt__p_p(Parameter<[Int]>.value(`p`))) as? ([Int]) -> Void
		perform?(`p`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodWithArrayOfInt__p_p(Parameter<[Int]>.value(`p`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithArrayOfInt(p: [Int]). Use given")
			Failure("Stub return value not specified for methodWithArrayOfInt(p: [Int]). Use given")
		}
		return __value
    }

    open func methodWithArrayOfOther(p: [SomeClass]) -> Int {
        addInvocation(.m_methodWithArrayOfOther__p_p(Parameter<[SomeClass]>.value(`p`)))
		let perform = methodPerformValue(.m_methodWithArrayOfOther__p_p(Parameter<[SomeClass]>.value(`p`))) as? ([SomeClass]) -> Void
		perform?(`p`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodWithArrayOfOther__p_p(Parameter<[SomeClass]>.value(`p`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithArrayOfOther(p: [SomeClass]). Use given")
			Failure("Stub return value not specified for methodWithArrayOfOther(p: [SomeClass]). Use given")
		}
		return __value
    }

    open func methodWithDict(p: [String: SomeClass]) -> Int {
        addInvocation(.m_methodWithDict__p_p(Parameter<[String: SomeClass]>.value(`p`)))
		let perform = methodPerformValue(.m_methodWithDict__p_p(Parameter<[String: SomeClass]>.value(`p`))) as? ([String: SomeClass]) -> Void
		perform?(`p`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodWithDict__p_p(Parameter<[String: SomeClass]>.value(`p`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithDict(p: [String: SomeClass]). Use given")
			Failure("Stub return value not specified for methodWithDict(p: [String: SomeClass]). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_methodWithStringParameter__p_p(Parameter<String>)
        case m_methodWithOtionalStringParameter__p_p(Parameter<String?>)
        case m_methodWithCustomStringParameter__p_p(Parameter<CustomString>)
        case m_methodWithCustomOptionalStringParameter__p_p(Parameter<CustomString?>)
        case m_methodWithIntParameter__p_p(Parameter<Int>)
        case m_methodWithCustomOptionalIntParameter__p_p(Parameter<CustomInt?>)
        case m_methodWithBool__p_p(Parameter<Bool?>)
        case m_methodWithFloat__p_p(Parameter<Float?>)
        case m_methodWithDouble__p_p(Parameter<Double?>)
        case m_methodWithArrayOfInt__p_p(Parameter<[Int]>)
        case m_methodWithArrayOfOther__p_p(Parameter<[SomeClass]>)
        case m_methodWithDict__p_p(Parameter<[String: SomeClass]>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_methodWithStringParameter__p_p(let lhsP), .m_methodWithStringParameter__p_p(let rhsP)):
                guard Parameter.compare(lhs: lhsP, rhs: rhsP, with: matcher) else { return false } 
                return true 
            case (.m_methodWithOtionalStringParameter__p_p(let lhsP), .m_methodWithOtionalStringParameter__p_p(let rhsP)):
                guard Parameter.compare(lhs: lhsP, rhs: rhsP, with: matcher) else { return false } 
                return true 
            case (.m_methodWithCustomStringParameter__p_p(let lhsP), .m_methodWithCustomStringParameter__p_p(let rhsP)):
                guard Parameter.compare(lhs: lhsP, rhs: rhsP, with: matcher) else { return false } 
                return true 
            case (.m_methodWithCustomOptionalStringParameter__p_p(let lhsP), .m_methodWithCustomOptionalStringParameter__p_p(let rhsP)):
                guard Parameter.compare(lhs: lhsP, rhs: rhsP, with: matcher) else { return false } 
                return true 
            case (.m_methodWithIntParameter__p_p(let lhsP), .m_methodWithIntParameter__p_p(let rhsP)):
                guard Parameter.compare(lhs: lhsP, rhs: rhsP, with: matcher) else { return false } 
                return true 
            case (.m_methodWithCustomOptionalIntParameter__p_p(let lhsP), .m_methodWithCustomOptionalIntParameter__p_p(let rhsP)):
                guard Parameter.compare(lhs: lhsP, rhs: rhsP, with: matcher) else { return false } 
                return true 
            case (.m_methodWithBool__p_p(let lhsP), .m_methodWithBool__p_p(let rhsP)):
                guard Parameter.compare(lhs: lhsP, rhs: rhsP, with: matcher) else { return false } 
                return true 
            case (.m_methodWithFloat__p_p(let lhsP), .m_methodWithFloat__p_p(let rhsP)):
                guard Parameter.compare(lhs: lhsP, rhs: rhsP, with: matcher) else { return false } 
                return true 
            case (.m_methodWithDouble__p_p(let lhsP), .m_methodWithDouble__p_p(let rhsP)):
                guard Parameter.compare(lhs: lhsP, rhs: rhsP, with: matcher) else { return false } 
                return true 
            case (.m_methodWithArrayOfInt__p_p(let lhsP), .m_methodWithArrayOfInt__p_p(let rhsP)):
                guard Parameter.compare(lhs: lhsP, rhs: rhsP, with: matcher) else { return false } 
                return true 
            case (.m_methodWithArrayOfOther__p_p(let lhsP), .m_methodWithArrayOfOther__p_p(let rhsP)):
                guard Parameter.compare(lhs: lhsP, rhs: rhsP, with: matcher) else { return false } 
                return true 
            case (.m_methodWithDict__p_p(let lhsP), .m_methodWithDict__p_p(let rhsP)):
                guard Parameter.compare(lhs: lhsP, rhs: rhsP, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_methodWithStringParameter__p_p(p0): return p0.intValue
            case let .m_methodWithOtionalStringParameter__p_p(p0): return p0.intValue
            case let .m_methodWithCustomStringParameter__p_p(p0): return p0.intValue
            case let .m_methodWithCustomOptionalStringParameter__p_p(p0): return p0.intValue
            case let .m_methodWithIntParameter__p_p(p0): return p0.intValue
            case let .m_methodWithCustomOptionalIntParameter__p_p(p0): return p0.intValue
            case let .m_methodWithBool__p_p(p0): return p0.intValue
            case let .m_methodWithFloat__p_p(p0): return p0.intValue
            case let .m_methodWithDouble__p_p(p0): return p0.intValue
            case let .m_methodWithArrayOfInt__p_p(p0): return p0.intValue
            case let .m_methodWithArrayOfOther__p_p(p0): return p0.intValue
            case let .m_methodWithDict__p_p(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func methodWithStringParameter(p: Parameter<String>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodWithStringParameter__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithOtionalStringParameter(p: Parameter<String?>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodWithOtionalStringParameter__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithCustomStringParameter(p: Parameter<CustomString>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodWithCustomStringParameter__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithCustomOptionalStringParameter(p: Parameter<CustomString?>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodWithCustomOptionalStringParameter__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithIntParameter(p: Parameter<Int>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodWithIntParameter__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithCustomOptionalIntParameter(p: Parameter<CustomInt?>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodWithCustomOptionalIntParameter__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithBool(p: Parameter<Bool?>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodWithBool__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithFloat(p: Parameter<Float?>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodWithFloat__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithDouble(p: Parameter<Double?>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodWithDouble__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithArrayOfInt(p: Parameter<[Int]>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodWithArrayOfInt__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithArrayOfOther(p: Parameter<[SomeClass]>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodWithArrayOfOther__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithDict(p: Parameter<[String: SomeClass]>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodWithDict__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithStringParameter(p: Parameter<String>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_methodWithStringParameter__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithOtionalStringParameter(p: Parameter<String?>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_methodWithOtionalStringParameter__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithCustomStringParameter(p: Parameter<CustomString>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_methodWithCustomStringParameter__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithCustomOptionalStringParameter(p: Parameter<CustomString?>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_methodWithCustomOptionalStringParameter__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithIntParameter(p: Parameter<Int>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_methodWithIntParameter__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithCustomOptionalIntParameter(p: Parameter<CustomInt?>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_methodWithCustomOptionalIntParameter__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithBool(p: Parameter<Bool?>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_methodWithBool__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithFloat(p: Parameter<Float?>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_methodWithFloat__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithDouble(p: Parameter<Double?>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_methodWithDouble__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithArrayOfInt(p: Parameter<[Int]>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_methodWithArrayOfInt__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithArrayOfOther(p: Parameter<[SomeClass]>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_methodWithArrayOfOther__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithDict(p: Parameter<[String: SomeClass]>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_methodWithDict__p_p(`p`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodWithStringParameter(p: Parameter<String>) -> Verify { return Verify(method: .m_methodWithStringParameter__p_p(`p`))}
        public static func methodWithOtionalStringParameter(p: Parameter<String?>) -> Verify { return Verify(method: .m_methodWithOtionalStringParameter__p_p(`p`))}
        public static func methodWithCustomStringParameter(p: Parameter<CustomString>) -> Verify { return Verify(method: .m_methodWithCustomStringParameter__p_p(`p`))}
        public static func methodWithCustomOptionalStringParameter(p: Parameter<CustomString?>) -> Verify { return Verify(method: .m_methodWithCustomOptionalStringParameter__p_p(`p`))}
        public static func methodWithIntParameter(p: Parameter<Int>) -> Verify { return Verify(method: .m_methodWithIntParameter__p_p(`p`))}
        public static func methodWithCustomOptionalIntParameter(p: Parameter<CustomInt?>) -> Verify { return Verify(method: .m_methodWithCustomOptionalIntParameter__p_p(`p`))}
        public static func methodWithBool(p: Parameter<Bool?>) -> Verify { return Verify(method: .m_methodWithBool__p_p(`p`))}
        public static func methodWithFloat(p: Parameter<Float?>) -> Verify { return Verify(method: .m_methodWithFloat__p_p(`p`))}
        public static func methodWithDouble(p: Parameter<Double?>) -> Verify { return Verify(method: .m_methodWithDouble__p_p(`p`))}
        public static func methodWithArrayOfInt(p: Parameter<[Int]>) -> Verify { return Verify(method: .m_methodWithArrayOfInt__p_p(`p`))}
        public static func methodWithArrayOfOther(p: Parameter<[SomeClass]>) -> Verify { return Verify(method: .m_methodWithArrayOfOther__p_p(`p`))}
        public static func methodWithDict(p: Parameter<[String: SomeClass]>) -> Verify { return Verify(method: .m_methodWithDict__p_p(`p`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodWithStringParameter(p: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_methodWithStringParameter__p_p(`p`), performs: perform)
        }
        public static func methodWithOtionalStringParameter(p: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_methodWithOtionalStringParameter__p_p(`p`), performs: perform)
        }
        public static func methodWithCustomStringParameter(p: Parameter<CustomString>, perform: @escaping (CustomString) -> Void) -> Perform {
            return Perform(method: .m_methodWithCustomStringParameter__p_p(`p`), performs: perform)
        }
        public static func methodWithCustomOptionalStringParameter(p: Parameter<CustomString?>, perform: @escaping (CustomString?) -> Void) -> Perform {
            return Perform(method: .m_methodWithCustomOptionalStringParameter__p_p(`p`), performs: perform)
        }
        public static func methodWithIntParameter(p: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .m_methodWithIntParameter__p_p(`p`), performs: perform)
        }
        public static func methodWithCustomOptionalIntParameter(p: Parameter<CustomInt?>, perform: @escaping (CustomInt?) -> Void) -> Perform {
            return Perform(method: .m_methodWithCustomOptionalIntParameter__p_p(`p`), performs: perform)
        }
        public static func methodWithBool(p: Parameter<Bool?>, perform: @escaping (Bool?) -> Void) -> Perform {
            return Perform(method: .m_methodWithBool__p_p(`p`), performs: perform)
        }
        public static func methodWithFloat(p: Parameter<Float?>, perform: @escaping (Float?) -> Void) -> Perform {
            return Perform(method: .m_methodWithFloat__p_p(`p`), performs: perform)
        }
        public static func methodWithDouble(p: Parameter<Double?>, perform: @escaping (Double?) -> Void) -> Perform {
            return Perform(method: .m_methodWithDouble__p_p(`p`), performs: perform)
        }
        public static func methodWithArrayOfInt(p: Parameter<[Int]>, perform: @escaping ([Int]) -> Void) -> Perform {
            return Perform(method: .m_methodWithArrayOfInt__p_p(`p`), performs: perform)
        }
        public static func methodWithArrayOfOther(p: Parameter<[SomeClass]>, perform: @escaping ([SomeClass]) -> Void) -> Perform {
            return Perform(method: .m_methodWithArrayOfOther__p_p(`p`), performs: perform)
        }
        public static func methodWithDict(p: Parameter<[String: SomeClass]>, perform: @escaping ([String: SomeClass]) -> Void) -> Perform {
            return Perform(method: .m_methodWithDict__p_p(`p`), performs: perform)
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

// MARK: - AnotherProtocol
open class AnotherProtocolMock: AnotherProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func doSomething<T: ProtocolWithAssociatedType2>(type: T) -> T.ValueType? {
        addInvocation(.m_doSomething__type_type(Parameter<T>.value(`type`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_doSomething__type_type(Parameter<T>.value(`type`).wrapAsGeneric())) as? (T) -> Void
		perform?(`type`)
		var __value: T.ValueType? = nil
		do {
		    __value = try methodReturnValue(.m_doSomething__type_type(Parameter<T>.value(`type`).wrapAsGeneric())).casted()
		} catch {
			// do nothing
		}
		return __value
    }

    open func doSomething2<T: ProtocolWithAssociatedType2>(type: T, withValue: T.ValueType?) {
        addInvocation(.m_doSomething2__type_typewithValue_withValue(Parameter<T>.value(`type`).wrapAsGeneric(), Parameter<T.ValueType?>.value(`withValue`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_doSomething2__type_typewithValue_withValue(Parameter<T>.value(`type`).wrapAsGeneric(), Parameter<T.ValueType?>.value(`withValue`).wrapAsGeneric())) as? (T, T.ValueType?) -> Void
		perform?(`type`, `withValue`)
    }


    fileprivate enum MethodType {
        case m_doSomething__type_type(Parameter<GenericAttribute>)
        case m_doSomething2__type_typewithValue_withValue(Parameter<GenericAttribute>, Parameter<GenericAttribute>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_doSomething__type_type(let lhsType), .m_doSomething__type_type(let rhsType)):
                guard Parameter.compare(lhs: lhsType, rhs: rhsType, with: matcher) else { return false } 
                return true 
            case (.m_doSomething2__type_typewithValue_withValue(let lhsType, let lhsWithvalue), .m_doSomething2__type_typewithValue_withValue(let rhsType, let rhsWithvalue)):
                guard Parameter.compare(lhs: lhsType, rhs: rhsType, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsWithvalue, rhs: rhsWithvalue, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_doSomething__type_type(p0): return p0.intValue
            case let .m_doSomething2__type_typewithValue_withValue(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func doSomething<T: ProtocolWithAssociatedType2>(type: Parameter<T>, willReturn: T.ValueType?...) -> MethodStub {
            return Given(method: .m_doSomething__type_type(`type`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func doSomething<T: ProtocolWithAssociatedType2>(type: Parameter<T>, willProduce: (Stubber<T.ValueType?>) -> Void) -> MethodStub {
            let willReturn: [T.ValueType?] = []
			let given: Given = { return Given(method: .m_doSomething__type_type(`type`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (T.ValueType?).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func doSomething<T>(type: Parameter<T>) -> Verify where T:ProtocolWithAssociatedType2 { return Verify(method: .m_doSomething__type_type(`type`.wrapAsGeneric()))}
        public static func doSomething2<T>(type: Parameter<T>, withValue: Parameter<T.ValueType?>) -> Verify where T:ProtocolWithAssociatedType2 { return Verify(method: .m_doSomething2__type_typewithValue_withValue(`type`.wrapAsGeneric(), `withValue`.wrapAsGeneric()))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func doSomething<T>(type: Parameter<T>, perform: @escaping (T) -> Void) -> Perform where T:ProtocolWithAssociatedType2 {
            return Perform(method: .m_doSomething__type_type(`type`.wrapAsGeneric()), performs: perform)
        }
        public static func doSomething2<T>(type: Parameter<T>, withValue: Parameter<T.ValueType?>, perform: @escaping (T, T.ValueType?) -> Void) -> Perform where T:ProtocolWithAssociatedType2 {
            return Perform(method: .m_doSomething2__type_typewithValue_withValue(`type`.wrapAsGeneric(), `withValue`.wrapAsGeneric()), performs: perform)
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

// MARK: - ComplicatedServiceType
open class ComplicatedServiceTypeMock: ComplicatedServiceType, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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

    public var youCouldOnlyGetThis: String {
		get {	invocations.append(.p_youCouldOnlyGetThis_get); return __p_youCouldOnlyGetThis ?? givenGetterValue(.p_youCouldOnlyGetThis_get, "ComplicatedServiceTypeMock - stub value for youCouldOnlyGetThis was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_youCouldOnlyGetThis = newValue }
	}
	private var __p_youCouldOnlyGetThis: (String)?





    open func serviceName() -> String {
        addInvocation(.m_serviceName)
		let perform = methodPerformValue(.m_serviceName) as? () -> Void
		perform?()
		var __value: String
		do {
		    __value = try methodReturnValue(.m_serviceName).casted()
		} catch {
			onFatalFailure("Stub return value not specified for serviceName(). Use given")
			Failure("Stub return value not specified for serviceName(). Use given")
		}
		return __value
    }

    open func aNewWayToSayHooray() {
        addInvocation(.m_aNewWayToSayHooray)
		let perform = methodPerformValue(.m_aNewWayToSayHooray) as? () -> Void
		perform?()
    }

    open func getPoint(from point: Point) -> Point {
        addInvocation(.m_getPoint__from_point(Parameter<Point>.value(`point`)))
		let perform = methodPerformValue(.m_getPoint__from_point(Parameter<Point>.value(`point`))) as? (Point) -> Void
		perform?(`point`)
		var __value: Point
		do {
		    __value = try methodReturnValue(.m_getPoint__from_point(Parameter<Point>.value(`point`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getPoint(from point: Point). Use given")
			Failure("Stub return value not specified for getPoint(from point: Point). Use given")
		}
		return __value
    }

    open func getPoint(from tuple: (Float,Float)) -> Point {
        addInvocation(.m_getPoint__from_tuple(Parameter<(Float,Float)>.value(`tuple`)))
		let perform = methodPerformValue(.m_getPoint__from_tuple(Parameter<(Float,Float)>.value(`tuple`))) as? ((Float,Float)) -> Void
		perform?(`tuple`)
		var __value: Point
		do {
		    __value = try methodReturnValue(.m_getPoint__from_tuple(Parameter<(Float,Float)>.value(`tuple`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getPoint(from tuple: (Float,Float)). Use given")
			Failure("Stub return value not specified for getPoint(from tuple: (Float,Float)). Use given")
		}
		return __value
    }

    open func similarMethodThatDiffersOnType(_ value: Float) -> Bool {
        addInvocation(.m_similarMethodThatDiffersOnType__value_1(Parameter<Float>.value(`value`)))
		let perform = methodPerformValue(.m_similarMethodThatDiffersOnType__value_1(Parameter<Float>.value(`value`))) as? (Float) -> Void
		perform?(`value`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_similarMethodThatDiffersOnType__value_1(Parameter<Float>.value(`value`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for similarMethodThatDiffersOnType(_ value: Float). Use given")
			Failure("Stub return value not specified for similarMethodThatDiffersOnType(_ value: Float). Use given")
		}
		return __value
    }

    open func similarMethodThatDiffersOnType(_ value: Point) -> Bool {
        addInvocation(.m_similarMethodThatDiffersOnType__value_2(Parameter<Point>.value(`value`)))
		let perform = methodPerformValue(.m_similarMethodThatDiffersOnType__value_2(Parameter<Point>.value(`value`))) as? (Point) -> Void
		perform?(`value`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_similarMethodThatDiffersOnType__value_2(Parameter<Point>.value(`value`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for similarMethodThatDiffersOnType(_ value: Point). Use given")
			Failure("Stub return value not specified for similarMethodThatDiffersOnType(_ value: Point). Use given")
		}
		return __value
    }

    open func methodWithTypedef(_ scalar: Scalar) {
        addInvocation(.m_methodWithTypedef__scalar(Parameter<Scalar>.value(`scalar`)))
		let perform = methodPerformValue(.m_methodWithTypedef__scalar(Parameter<Scalar>.value(`scalar`))) as? (Scalar) -> Void
		perform?(`scalar`)
    }

    open func methodWithClosures(success function: LinearFunction) -> ClosureFabric {
        addInvocation(.m_methodWithClosures__success_function_1(Parameter<LinearFunction>.value(`function`)))
		let perform = methodPerformValue(.m_methodWithClosures__success_function_1(Parameter<LinearFunction>.value(`function`))) as? (LinearFunction) -> Void
		perform?(`function`)
		var __value: ClosureFabric
		do {
		    __value = try methodReturnValue(.m_methodWithClosures__success_function_1(Parameter<LinearFunction>.value(`function`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithClosures(success function: LinearFunction). Use given")
			Failure("Stub return value not specified for methodWithClosures(success function: LinearFunction). Use given")
		}
		return __value
    }

    open func methodWithClosures(success function: ((Scalar,Scalar) -> Scalar)?) -> ((Int) -> Void) {
        addInvocation(.m_methodWithClosures__success_function_2(Parameter<((Scalar,Scalar) -> Scalar)?>.value(`function`)))
		let perform = methodPerformValue(.m_methodWithClosures__success_function_2(Parameter<((Scalar,Scalar) -> Scalar)?>.value(`function`))) as? (((Scalar,Scalar) -> Scalar)?) -> Void
		perform?(`function`)
		var __value: (Int) -> Void
		do {
		    __value = try methodReturnValue(.m_methodWithClosures__success_function_2(Parameter<((Scalar,Scalar) -> Scalar)?>.value(`function`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithClosures(success function: ((Scalar,Scalar) -> Scalar)?). Use given")
			Failure("Stub return value not specified for methodWithClosures(success function: ((Scalar,Scalar) -> Scalar)?). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_serviceName
        case m_aNewWayToSayHooray
        case m_getPoint__from_point(Parameter<Point>)
        case m_getPoint__from_tuple(Parameter<(Float,Float)>)
        case m_similarMethodThatDiffersOnType__value_1(Parameter<Float>)
        case m_similarMethodThatDiffersOnType__value_2(Parameter<Point>)
        case m_methodWithTypedef__scalar(Parameter<Scalar>)
        case m_methodWithClosures__success_function_1(Parameter<LinearFunction>)
        case m_methodWithClosures__success_function_2(Parameter<((Scalar,Scalar) -> Scalar)?>)
        case p_youCouldOnlyGetThis_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_serviceName, .m_serviceName):
                return true 
            case (.m_aNewWayToSayHooray, .m_aNewWayToSayHooray):
                return true 
            case (.m_getPoint__from_point(let lhsPoint), .m_getPoint__from_point(let rhsPoint)):
                guard Parameter.compare(lhs: lhsPoint, rhs: rhsPoint, with: matcher) else { return false } 
                return true 
            case (.m_getPoint__from_tuple(let lhsTuple), .m_getPoint__from_tuple(let rhsTuple)):
                guard Parameter.compare(lhs: lhsTuple, rhs: rhsTuple, with: matcher) else { return false } 
                return true 
            case (.m_similarMethodThatDiffersOnType__value_1(let lhsValue), .m_similarMethodThatDiffersOnType__value_1(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            case (.m_similarMethodThatDiffersOnType__value_2(let lhsValue), .m_similarMethodThatDiffersOnType__value_2(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            case (.m_methodWithTypedef__scalar(let lhsScalar), .m_methodWithTypedef__scalar(let rhsScalar)):
                guard Parameter.compare(lhs: lhsScalar, rhs: rhsScalar, with: matcher) else { return false } 
                return true 
            case (.m_methodWithClosures__success_function_1(let lhsFunction), .m_methodWithClosures__success_function_1(let rhsFunction)):
                guard Parameter.compare(lhs: lhsFunction, rhs: rhsFunction, with: matcher) else { return false } 
                return true 
            case (.m_methodWithClosures__success_function_2(let lhsFunction), .m_methodWithClosures__success_function_2(let rhsFunction)):
                guard Parameter.compare(lhs: lhsFunction, rhs: rhsFunction, with: matcher) else { return false } 
                return true 
            case (.p_youCouldOnlyGetThis_get,.p_youCouldOnlyGetThis_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_serviceName: return 0
            case .m_aNewWayToSayHooray: return 0
            case let .m_getPoint__from_point(p0): return p0.intValue
            case let .m_getPoint__from_tuple(p0): return p0.intValue
            case let .m_similarMethodThatDiffersOnType__value_1(p0): return p0.intValue
            case let .m_similarMethodThatDiffersOnType__value_2(p0): return p0.intValue
            case let .m_methodWithTypedef__scalar(p0): return p0.intValue
            case let .m_methodWithClosures__success_function_1(p0): return p0.intValue
            case let .m_methodWithClosures__success_function_2(p0): return p0.intValue
            case .p_youCouldOnlyGetThis_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func youCouldOnlyGetThis(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_youCouldOnlyGetThis_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func serviceName(willReturn: String...) -> MethodStub {
            return Given(method: .m_serviceName, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getPoint(from point: Parameter<Point>, willReturn: Point...) -> MethodStub {
            return Given(method: .m_getPoint__from_point(`point`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getPoint(from tuple: Parameter<(Float,Float)>, willReturn: Point...) -> MethodStub {
            return Given(method: .m_getPoint__from_tuple(`tuple`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func similarMethodThatDiffersOnType(_ value: Parameter<Float>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_similarMethodThatDiffersOnType__value_1(`value`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func similarMethodThatDiffersOnType(_ value: Parameter<Point>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_similarMethodThatDiffersOnType__value_2(`value`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithClosures(success function: Parameter<LinearFunction>, willReturn: ClosureFabric...) -> MethodStub {
            return Given(method: .m_methodWithClosures__success_function_1(`function`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithClosures(success function: Parameter<((Scalar,Scalar) -> Scalar)?>, willReturn: (Int) -> Void...) -> MethodStub {
            return Given(method: .m_methodWithClosures__success_function_2(`function`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func serviceName(willProduce: (Stubber<String>) -> Void) -> MethodStub {
            let willReturn: [String] = []
			let given: Given = { return Given(method: .m_serviceName, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String).self)
			willProduce(stubber)
			return given
        }
        public static func getPoint(from point: Parameter<Point>, willProduce: (Stubber<Point>) -> Void) -> MethodStub {
            let willReturn: [Point] = []
			let given: Given = { return Given(method: .m_getPoint__from_point(`point`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Point).self)
			willProduce(stubber)
			return given
        }
        public static func getPoint(from tuple: Parameter<(Float,Float)>, willProduce: (Stubber<Point>) -> Void) -> MethodStub {
            let willReturn: [Point] = []
			let given: Given = { return Given(method: .m_getPoint__from_tuple(`tuple`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Point).self)
			willProduce(stubber)
			return given
        }
        public static func similarMethodThatDiffersOnType(_ value: Parameter<Float>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_similarMethodThatDiffersOnType__value_1(`value`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        public static func similarMethodThatDiffersOnType(_ value: Parameter<Point>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_similarMethodThatDiffersOnType__value_2(`value`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithClosures(success function: Parameter<LinearFunction>, willProduce: (Stubber<ClosureFabric>) -> Void) -> MethodStub {
            let willReturn: [ClosureFabric] = []
			let given: Given = { return Given(method: .m_methodWithClosures__success_function_1(`function`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (ClosureFabric).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithClosures(success function: Parameter<((Scalar,Scalar) -> Scalar)?>, willProduce: (Stubber<(Int) -> Void>) -> Void) -> MethodStub {
            let willReturn: [(Int) -> Void] = []
			let given: Given = { return Given(method: .m_methodWithClosures__success_function_2(`function`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: ((Int) -> Void).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func serviceName() -> Verify { return Verify(method: .m_serviceName)}
        public static func aNewWayToSayHooray() -> Verify { return Verify(method: .m_aNewWayToSayHooray)}
        public static func getPoint(from point: Parameter<Point>) -> Verify { return Verify(method: .m_getPoint__from_point(`point`))}
        public static func getPoint(from tuple: Parameter<(Float,Float)>) -> Verify { return Verify(method: .m_getPoint__from_tuple(`tuple`))}
        public static func similarMethodThatDiffersOnType(_ value: Parameter<Float>) -> Verify { return Verify(method: .m_similarMethodThatDiffersOnType__value_1(`value`))}
        public static func similarMethodThatDiffersOnType(_ value: Parameter<Point>) -> Verify { return Verify(method: .m_similarMethodThatDiffersOnType__value_2(`value`))}
        public static func methodWithTypedef(_ scalar: Parameter<Scalar>) -> Verify { return Verify(method: .m_methodWithTypedef__scalar(`scalar`))}
        public static func methodWithClosures(success function: Parameter<LinearFunction>) -> Verify { return Verify(method: .m_methodWithClosures__success_function_1(`function`))}
        public static func methodWithClosures(success function: Parameter<((Scalar,Scalar) -> Scalar)?>) -> Verify { return Verify(method: .m_methodWithClosures__success_function_2(`function`))}
        public static var youCouldOnlyGetThis: Verify { return Verify(method: .p_youCouldOnlyGetThis_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func serviceName(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_serviceName, performs: perform)
        }
        public static func aNewWayToSayHooray(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_aNewWayToSayHooray, performs: perform)
        }
        public static func getPoint(from point: Parameter<Point>, perform: @escaping (Point) -> Void) -> Perform {
            return Perform(method: .m_getPoint__from_point(`point`), performs: perform)
        }
        public static func getPoint(from tuple: Parameter<(Float,Float)>, perform: @escaping ((Float,Float)) -> Void) -> Perform {
            return Perform(method: .m_getPoint__from_tuple(`tuple`), performs: perform)
        }
        public static func similarMethodThatDiffersOnType(_ value: Parameter<Float>, perform: @escaping (Float) -> Void) -> Perform {
            return Perform(method: .m_similarMethodThatDiffersOnType__value_1(`value`), performs: perform)
        }
        public static func similarMethodThatDiffersOnType(_ value: Parameter<Point>, perform: @escaping (Point) -> Void) -> Perform {
            return Perform(method: .m_similarMethodThatDiffersOnType__value_2(`value`), performs: perform)
        }
        public static func methodWithTypedef(_ scalar: Parameter<Scalar>, perform: @escaping (Scalar) -> Void) -> Perform {
            return Perform(method: .m_methodWithTypedef__scalar(`scalar`), performs: perform)
        }
        public static func methodWithClosures(success function: Parameter<LinearFunction>, perform: @escaping (LinearFunction) -> Void) -> Perform {
            return Perform(method: .m_methodWithClosures__success_function_1(`function`), performs: perform)
        }
        public static func methodWithClosures(success function: Parameter<((Scalar,Scalar) -> Scalar)?>, perform: @escaping (((Scalar,Scalar) -> Scalar)?) -> Void) -> Perform {
            return Perform(method: .m_methodWithClosures__success_function_2(`function`), performs: perform)
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

// MARK: - DateSortable
open class DateSortableMock: DateSortable, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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

    public var date: Date {
		get {	invocations.append(.p_date_get); return __p_date ?? givenGetterValue(.p_date_get, "DateSortableMock - stub value for date was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_date = newValue }
	}
	private var __p_date: (Date)?






    fileprivate enum MethodType {
        case p_date_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_date_get,.p_date_get): return true
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_date_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func date(getter defaultValue: Date...) -> PropertyStub {
            return Given(method: .p_date_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var date: Verify { return Verify(method: .p_date_get) }
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

// MARK: - EdgeCasesGenericsProtocol
open class EdgeCasesGenericsProtocolMock: EdgeCasesGenericsProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func sorted<Key, Value>(by key: Mytest<Key, Value>) {
        addInvocation(.m_sorted__by_key(Parameter<Mytest<Key, Value>>.value(`key`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_sorted__by_key(Parameter<Mytest<Key, Value>>.value(`key`).wrapAsGeneric())) as? (Mytest<Key, Value>) -> Void
		perform?(`key`)
    }

    open func getter<K,V: Sequence,T: Equatable>(swapped key: Mytest<K,V>) -> T {
        addInvocation(.m_getter__swapped_key(Parameter<Mytest<K,V>>.value(`key`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_getter__swapped_key(Parameter<Mytest<K,V>>.value(`key`).wrapAsGeneric())) as? (Mytest<K,V>) -> Void
		perform?(`key`)
		var __value: T
		do {
		    __value = try methodReturnValue(.m_getter__swapped_key(Parameter<Mytest<K,V>>.value(`key`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getter<K,V: Sequence,T: Equatable>(swapped key: Mytest<K,V>). Use given")
			Failure("Stub return value not specified for getter<K,V: Sequence,T: Equatable>(swapped key: Mytest<K,V>). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_sorted__by_key(Parameter<GenericAttribute>)
        case m_getter__swapped_key(Parameter<GenericAttribute>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_sorted__by_key(let lhsKey), .m_sorted__by_key(let rhsKey)):
                guard Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher) else { return false } 
                return true 
            case (.m_getter__swapped_key(let lhsKey), .m_getter__swapped_key(let rhsKey)):
                guard Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_sorted__by_key(p0): return p0.intValue
            case let .m_getter__swapped_key(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getter<K,V: Sequence,T: Equatable>(swapped key: Parameter<Mytest<K,V>>, willReturn: T...) -> MethodStub {
            return Given(method: .m_getter__swapped_key(`key`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getter<K,V: Sequence,T: Equatable>(swapped key: Parameter<Mytest<K,V>>, willProduce: (Stubber<T>) -> Void) -> MethodStub {
            let willReturn: [T] = []
			let given: Given = { return Given(method: .m_getter__swapped_key(`key`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (T).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func sorted<Key,Value>(by key: Parameter<Mytest<Key, Value>>) -> Verify { return Verify(method: .m_sorted__by_key(`key`.wrapAsGeneric()))}
        public static func getter<K,V>(swapped key: Parameter<Mytest<K,V>>) -> Verify where V:Sequence { return Verify(method: .m_getter__swapped_key(`key`.wrapAsGeneric()))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func sorted<Key,Value>(by key: Parameter<Mytest<Key, Value>>, perform: @escaping (Mytest<Key, Value>) -> Void) -> Perform {
            return Perform(method: .m_sorted__by_key(`key`.wrapAsGeneric()), performs: perform)
        }
        public static func getter<K,V>(swapped key: Parameter<Mytest<K,V>>, perform: @escaping (Mytest<K,V>) -> Void) -> Perform where V:Sequence {
            return Perform(method: .m_getter__swapped_key(`key`.wrapAsGeneric()), performs: perform)
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

// MARK: - EmptyProtocol
open class EmptyProtocolMock: EmptyProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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






    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
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

// MARK: - FailsWithAutoClosureOnSwift5
open class FailsWithAutoClosureOnSwift5Mock: FailsWithAutoClosureOnSwift5, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func connect(_ token: @autoclosure () -> String) -> Bool {
        addInvocation(.m_connect__token(Parameter<() -> String>.any))
		let perform = methodPerformValue(.m_connect__token(Parameter<() -> String>.any)) as? (@autoclosure () -> String) -> Void
		perform?(`token`())
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_connect__token(Parameter<() -> String>.any)).casted()
		} catch {
			onFatalFailure("Stub return value not specified for connect(_ token: @autoclosure () -> String). Use given")
			Failure("Stub return value not specified for connect(_ token: @autoclosure () -> String). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_connect__token(Parameter<() -> String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_connect__token(let lhsToken), .m_connect__token(let rhsToken)):
                guard Parameter.compare(lhs: lhsToken, rhs: rhsToken, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_connect__token(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func connect(_ token: Parameter<() -> String>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_connect__token(`token`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func connect(_ token: Parameter<() -> String>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_connect__token(`token`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func connect(_ token: Parameter<() -> String>) -> Verify { return Verify(method: .m_connect__token(`token`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func connect(_ token: Parameter<() -> String>, perform: @escaping (@autoclosure () -> String) -> Void) -> Perform {
            return Perform(method: .m_connect__token(`token`), performs: perform)
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

// MARK: - FailsWithKeywordArguments
open class FailsWithKeywordArgumentsMock: FailsWithKeywordArguments, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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

    public var `throw`: Error {
		get {	invocations.append(.p_throw_get); return __p_throw ?? givenGetterValue(.p_throw_get, "FailsWithKeywordArgumentsMock - stub value for `throw` was not defined") }
		set {	invocations.append(.p_throw_set(.value(newValue))); __p_throw = newValue }
	}
	private var __p_throw: (Error)?





    open func foo(for: String) {
        addInvocation(.m_foo__for_for(Parameter<String>.value(`for`)))
		let perform = methodPerformValue(.m_foo__for_for(Parameter<String>.value(`for`))) as? (String) -> Void
		perform?(`for`)
    }

    open func `throw`(while: String) -> Error {
        addInvocation(.m_throw__while_while(Parameter<String>.value(`while`)))
		let perform = methodPerformValue(.m_throw__while_while(Parameter<String>.value(`while`))) as? (String) -> Void
		perform?(`while`)
		var __value: Error
		do {
		    __value = try methodReturnValue(.m_throw__while_while(Parameter<String>.value(`while`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for `throw`(while: String). Use given")
			Failure("Stub return value not specified for `throw`(while: String). Use given")
		}
		return __value
    }

    open func `return`(do while: String) -> Bool {
        addInvocation(.m_return__do_while(Parameter<String>.value(`while`)))
		let perform = methodPerformValue(.m_return__do_while(Parameter<String>.value(`while`))) as? (String) -> Void
		perform?(`while`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_return__do_while(Parameter<String>.value(`while`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for `return`(do while: String). Use given")
			Failure("Stub return value not specified for `return`(do while: String). Use given")
		}
		return __value
    }

    public subscript (_ return: Int) -> Bool {
		get {
			addInvocation(.subscript_get_return(Parameter<Int>.value(`return`)))
			do {
				return try methodReturnValue(.subscript_get_return(Parameter<Int>.value(`return`))).casted()
			} catch {
				onFatalFailure("Stub return value not specified for subscript. Use given first."); Failure("noStubDefinedMessage")
			}
		}
		set {
			addInvocation(.subscript_set_return(Parameter<Int>.value(`return`), Parameter<Bool>.value(newValue)))
		}
	}


    fileprivate enum MethodType {
        case m_foo__for_for(Parameter<String>)
        case m_throw__while_while(Parameter<String>)
        case m_return__do_while(Parameter<String>)
        case p_throw_get
		case p_throw_set(Parameter<Error>)
        case subscript_get_return(Parameter<Int>)
		case subscript_set_return(Parameter<Int>, Parameter<Bool>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_foo__for_for(let lhsFor), .m_foo__for_for(let rhsFor)):
                guard Parameter.compare(lhs: lhsFor, rhs: rhsFor, with: matcher) else { return false } 
                return true 
            case (.m_throw__while_while(let lhsWhile), .m_throw__while_while(let rhsWhile)):
                guard Parameter.compare(lhs: lhsWhile, rhs: rhsWhile, with: matcher) else { return false } 
                return true 
            case (.m_return__do_while(let lhsWhile), .m_return__do_while(let rhsWhile)):
                guard Parameter.compare(lhs: lhsWhile, rhs: rhsWhile, with: matcher) else { return false } 
                return true 
            case (.p_throw_get,.p_throw_get): return true
			case (.p_throw_set(let left),.p_throw_set(let right)): return Parameter<Error>.compare(lhs: left, rhs: right, with: matcher)
            case (let .subscript_get_return(lhsReturn), let .subscript_get_return(rhsReturn)):
				guard Parameter.compare(lhs: lhsReturn, rhs: rhsReturn, with: matcher) else { return false }
				return true
			case (let .subscript_set_return(lhsReturn, lhsDidSet), let .subscript_set_return(rhsReturn, rhsDidSet)):
				guard Parameter.compare(lhs: lhsReturn, rhs: rhsReturn, with: matcher) else { return false }
				return Parameter.compare(lhs: lhsDidSet, rhs: rhsDidSet, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_foo__for_for(p0): return p0.intValue
            case let .m_throw__while_while(p0): return p0.intValue
            case let .m_return__do_while(p0): return p0.intValue
            case .p_throw_get: return 0
			case .p_throw_set(let newValue): return newValue.intValue
            case let .subscript_get_return(p0): return p0.intValue
			case let .subscript_set_return(p0, _): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func `throw`(getter defaultValue: Error...) -> PropertyStub {
            return Given(method: .p_throw_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func `throw`(while: Parameter<String>, willReturn: Error...) -> MethodStub {
            return Given(method: .m_throw__while_while(`while`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func `return`(do while: Parameter<String>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_return__do_while(`while`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func `throw`(while: Parameter<String>, willProduce: (Stubber<Error>) -> Void) -> MethodStub {
            let willReturn: [Error] = []
			let given: Given = { return Given(method: .m_throw__while_while(`while`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Error).self)
			willProduce(stubber)
			return given
        }
        public static func `return`(do while: Parameter<String>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_return__do_while(`while`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        public static func `subscript`(_ return: Parameter<Int>, willReturn: Bool...) -> SubscriptStub {
            return Given(method: .subscript_get_return(`return`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func foo(for: Parameter<String>) -> Verify { return Verify(method: .m_foo__for_for(`for`))}
        public static func `throw`(while: Parameter<String>) -> Verify { return Verify(method: .m_throw__while_while(`while`))}
        public static func `return`(do while: Parameter<String>) -> Verify { return Verify(method: .m_return__do_while(`while`))}
        public static var `throw`: Verify { return Verify(method: .p_throw_get) }
		public static func `throw`(set newValue: Parameter<Error>) -> Verify { return Verify(method: .p_throw_set(newValue)) }
        public static func `subscript`(_ return: Parameter<Int>) -> Verify { return Verify(method: .subscript_get_return(`return`))}
        public static func `subscript`(_ return: Parameter<Int>, set newValue: Parameter<Bool>) -> Verify { return Verify(method: .subscript_set_return(`return`, newValue))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func foo(for: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_foo__for_for(`for`), performs: perform)
        }
        public static func `throw`(while: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_throw__while_while(`while`), performs: perform)
        }
        public static func `return`(do while: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_return__do_while(`while`), performs: perform)
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

// MARK: - FailsWithReturnedTypeBeingGenericOfSelf
public final class FailsWithReturnedTypeBeingGenericOfSelfMock: FailsWithReturnedTypeBeingGenericOfSelf, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    public func methodWillReturnSelfTypedArray() -> Array<FailsWithReturnedTypeBeingGenericOfSelfMock>  {
        func _wrapped<__Self__>() -> __Self__ {
		addInvocation(.m_methodWillReturnSelfTypedArray)
		let perform = methodPerformValue(.m_methodWillReturnSelfTypedArray) as? () -> Void
		perform?()
		var __value: __Self__
		do {
		    __value = try methodReturnValue(.m_methodWillReturnSelfTypedArray).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWillReturnSelfTypedArray(). Use given")
			Failure("Stub return value not specified for methodWillReturnSelfTypedArray(). Use given")
		}
		return __value
		}
		return _wrapped()
    }

    public func methodWillReturnSelfTypedArray2() -> [FailsWithReturnedTypeBeingGenericOfSelfMock]  {
        func _wrapped<__Self__>() -> __Self__ {
		addInvocation(.m_methodWillReturnSelfTypedArray2)
		let perform = methodPerformValue(.m_methodWillReturnSelfTypedArray2) as? () -> Void
		perform?()
		var __value: __Self__
		do {
		    __value = try methodReturnValue(.m_methodWillReturnSelfTypedArray2).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWillReturnSelfTypedArray2(). Use given")
			Failure("Stub return value not specified for methodWillReturnSelfTypedArray2(). Use given")
		}
		return __value
		}
		return _wrapped()
    }

    public func methodWillReturnSelfTypedCustom() -> CustomGeneric<FailsWithReturnedTypeBeingGenericOfSelfMock>  {
        func _wrapped<__Self__>() -> __Self__ {
		addInvocation(.m_methodWillReturnSelfTypedCustom)
		let perform = methodPerformValue(.m_methodWillReturnSelfTypedCustom) as? () -> Void
		perform?()
		var __value: __Self__
		do {
		    __value = try methodReturnValue(.m_methodWillReturnSelfTypedCustom).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWillReturnSelfTypedCustom(). Use given")
			Failure("Stub return value not specified for methodWillReturnSelfTypedCustom(). Use given")
		}
		return __value
		}
		return _wrapped()
    }

    open func test(value: FailsWithReturnedTypeBeingGenericOfSelfMock) -> Bool {
        addInvocation(.m_test__value_value(Parameter<FailsWithReturnedTypeBeingGenericOfSelfMock>.value(`value`)))
		let perform = methodPerformValue(.m_test__value_value(Parameter<FailsWithReturnedTypeBeingGenericOfSelfMock>.value(`value`))) as? (FailsWithReturnedTypeBeingGenericOfSelfMock) -> Void
		perform?(`value`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_test__value_value(Parameter<FailsWithReturnedTypeBeingGenericOfSelfMock>.value(`value`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for test(value: FailsWithReturnedTypeBeingGenericOfSelfMock). Use given")
			Failure("Stub return value not specified for test(value: FailsWithReturnedTypeBeingGenericOfSelfMock). Use given")
		}
		return __value
    }

    open func insanetTest(value: CustomGeneric<[FailsWithReturnedTypeBeingGenericOfSelfMock]>) -> Bool {
        addInvocation(.m_insanetTest__value_value(Parameter<CustomGeneric<[FailsWithReturnedTypeBeingGenericOfSelfMock]>>.value(`value`)))
		let perform = methodPerformValue(.m_insanetTest__value_value(Parameter<CustomGeneric<[FailsWithReturnedTypeBeingGenericOfSelfMock]>>.value(`value`))) as? (CustomGeneric<[FailsWithReturnedTypeBeingGenericOfSelfMock]>) -> Void
		perform?(`value`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_insanetTest__value_value(Parameter<CustomGeneric<[FailsWithReturnedTypeBeingGenericOfSelfMock]>>.value(`value`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for insanetTest(value: CustomGeneric<[FailsWithReturnedTypeBeingGenericOfSelfMock]>). Use given")
			Failure("Stub return value not specified for insanetTest(value: CustomGeneric<[FailsWithReturnedTypeBeingGenericOfSelfMock]>). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_methodWillReturnSelfTypedArray
        case m_methodWillReturnSelfTypedArray2
        case m_methodWillReturnSelfTypedCustom
        case m_test__value_value(Parameter<FailsWithReturnedTypeBeingGenericOfSelfMock>)
        case m_insanetTest__value_value(Parameter<CustomGeneric<[FailsWithReturnedTypeBeingGenericOfSelfMock]>>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_methodWillReturnSelfTypedArray, .m_methodWillReturnSelfTypedArray):
                return true 
            case (.m_methodWillReturnSelfTypedArray2, .m_methodWillReturnSelfTypedArray2):
                return true 
            case (.m_methodWillReturnSelfTypedCustom, .m_methodWillReturnSelfTypedCustom):
                return true 
            case (.m_test__value_value(let lhsValue), .m_test__value_value(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            case (.m_insanetTest__value_value(let lhsValue), .m_insanetTest__value_value(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_methodWillReturnSelfTypedArray: return 0
            case .m_methodWillReturnSelfTypedArray2: return 0
            case .m_methodWillReturnSelfTypedCustom: return 0
            case let .m_test__value_value(p0): return p0.intValue
            case let .m_insanetTest__value_value(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func methodWillReturnSelfTypedArray(willReturn: Array<FailsWithReturnedTypeBeingGenericOfSelfMock> ...) -> MethodStub {
            return Given(method: .m_methodWillReturnSelfTypedArray, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWillReturnSelfTypedArray2(willReturn: [FailsWithReturnedTypeBeingGenericOfSelfMock] ...) -> MethodStub {
            return Given(method: .m_methodWillReturnSelfTypedArray2, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWillReturnSelfTypedCustom(willReturn: CustomGeneric<FailsWithReturnedTypeBeingGenericOfSelfMock> ...) -> MethodStub {
            return Given(method: .m_methodWillReturnSelfTypedCustom, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func test(value: Parameter<FailsWithReturnedTypeBeingGenericOfSelfMock>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_test__value_value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func insanetTest(value: Parameter<CustomGeneric<[FailsWithReturnedTypeBeingGenericOfSelfMock]>>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_insanetTest__value_value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWillReturnSelfTypedArray(willProduce: (Stubber<Array<FailsWithReturnedTypeBeingGenericOfSelfMock> >) -> Void) -> MethodStub {
            let willReturn: [Array<FailsWithReturnedTypeBeingGenericOfSelfMock> ] = []
			let given: Given = { return Given(method: .m_methodWillReturnSelfTypedArray, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Array<FailsWithReturnedTypeBeingGenericOfSelfMock> ).self)
			willProduce(stubber)
			return given
        }
        public static func methodWillReturnSelfTypedArray2(willProduce: (Stubber<[FailsWithReturnedTypeBeingGenericOfSelfMock] >) -> Void) -> MethodStub {
            let willReturn: [[FailsWithReturnedTypeBeingGenericOfSelfMock] ] = []
			let given: Given = { return Given(method: .m_methodWillReturnSelfTypedArray2, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: ([FailsWithReturnedTypeBeingGenericOfSelfMock] ).self)
			willProduce(stubber)
			return given
        }
        public static func methodWillReturnSelfTypedCustom(willProduce: (Stubber<CustomGeneric<FailsWithReturnedTypeBeingGenericOfSelfMock> >) -> Void) -> MethodStub {
            let willReturn: [CustomGeneric<FailsWithReturnedTypeBeingGenericOfSelfMock> ] = []
			let given: Given = { return Given(method: .m_methodWillReturnSelfTypedCustom, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (CustomGeneric<FailsWithReturnedTypeBeingGenericOfSelfMock> ).self)
			willProduce(stubber)
			return given
        }
        public static func test(value: Parameter<FailsWithReturnedTypeBeingGenericOfSelfMock>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_test__value_value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        public static func insanetTest(value: Parameter<CustomGeneric<[FailsWithReturnedTypeBeingGenericOfSelfMock]>>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_insanetTest__value_value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodWillReturnSelfTypedArray() -> Verify { return Verify(method: .m_methodWillReturnSelfTypedArray)}
        public static func methodWillReturnSelfTypedArray2() -> Verify { return Verify(method: .m_methodWillReturnSelfTypedArray2)}
        public static func methodWillReturnSelfTypedCustom() -> Verify { return Verify(method: .m_methodWillReturnSelfTypedCustom)}
        public static func test(value: Parameter<FailsWithReturnedTypeBeingGenericOfSelfMock>) -> Verify { return Verify(method: .m_test__value_value(`value`))}
        public static func insanetTest(value: Parameter<CustomGeneric<[FailsWithReturnedTypeBeingGenericOfSelfMock]>>) -> Verify { return Verify(method: .m_insanetTest__value_value(`value`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodWillReturnSelfTypedArray(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_methodWillReturnSelfTypedArray, performs: perform)
        }
        public static func methodWillReturnSelfTypedArray2(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_methodWillReturnSelfTypedArray2, performs: perform)
        }
        public static func methodWillReturnSelfTypedCustom(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_methodWillReturnSelfTypedCustom, performs: perform)
        }
        public static func test(value: Parameter<FailsWithReturnedTypeBeingGenericOfSelfMock>, perform: @escaping (FailsWithReturnedTypeBeingGenericOfSelfMock) -> Void) -> Perform {
            return Perform(method: .m_test__value_value(`value`), performs: perform)
        }
        public static func insanetTest(value: Parameter<CustomGeneric<[FailsWithReturnedTypeBeingGenericOfSelfMock]>>, perform: @escaping (CustomGeneric<[FailsWithReturnedTypeBeingGenericOfSelfMock]>) -> Void) -> Perform {
            return Perform(method: .m_insanetTest__value_value(`value`), performs: perform)
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

// MARK: - FailsWithUntagged
open class FailsWithUntaggedMock: FailsWithUntagged, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    public required init<T>(with t: T) { }

    open func foo<T>(_: T, bar : String) where T: Sequence {
        addInvocation(.m_foo__barbar(Parameter<String>.value(`bar`)))
		let perform = methodPerformValue(.m_foo__barbar(Parameter<String>.value(`bar`))) as? (String) -> Void
		perform?(`bar`)
    }


    fileprivate enum MethodType {
        case m_foo__barbar(Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_foo__barbar(let lhsBar), .m_foo__barbar(let rhsBar)):
                guard Parameter.compare(lhs: lhsBar, rhs: rhsBar, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_foo__barbar(p0): return p0.intValue
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

        public static func foo(bar: Parameter<String>) -> Verify { return Verify(method: .m_foo__barbar(`bar`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func foo(bar: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_foo__barbar(`bar`), performs: perform)
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

// MARK: - GenericProtocolReturningInt
open class GenericProtocolReturningIntMock: GenericProtocolReturningInt, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func value<T>(for value: T) -> Int {
        addInvocation(.m_value__for_value(Parameter<T>.value(`value`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_value__for_value(Parameter<T>.value(`value`).wrapAsGeneric())) as? (T) -> Void
		perform?(`value`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_value__for_value(Parameter<T>.value(`value`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for value<T>(for value: T). Use given")
			Failure("Stub return value not specified for value<T>(for value: T). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_value__for_value(Parameter<GenericAttribute>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_value__for_value(let lhsValue), .m_value__for_value(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_value__for_value(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func value<T>(for value: Parameter<T>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_value__for_value(`value`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func value<T>(for value: Parameter<T>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_value__for_value(`value`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func value<T>(for value: Parameter<T>) -> Verify { return Verify(method: .m_value__for_value(`value`.wrapAsGeneric()))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func value<T>(for value: Parameter<T>, perform: @escaping (T) -> Void) -> Perform {
            return Perform(method: .m_value__for_value(`value`.wrapAsGeneric()), performs: perform)
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

// MARK: - GenericProtocolWithTypeConstraint
open class GenericProtocolWithTypeConstraintMock: GenericProtocolWithTypeConstraint, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func decode<T: Decodable>(_ type: T.Type, from data: Data) -> T {
        addInvocation(.m_decode__typefrom_data(Parameter<T.Type>.value(`type`).wrapAsGeneric(), Parameter<Data>.value(`data`)))
		let perform = methodPerformValue(.m_decode__typefrom_data(Parameter<T.Type>.value(`type`).wrapAsGeneric(), Parameter<Data>.value(`data`))) as? (T.Type, Data) -> Void
		perform?(`type`, `data`)
		var __value: T
		do {
		    __value = try methodReturnValue(.m_decode__typefrom_data(Parameter<T.Type>.value(`type`).wrapAsGeneric(), Parameter<Data>.value(`data`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for decode<T: Decodable>(_ type: T.Type, from data: Data). Use given")
			Failure("Stub return value not specified for decode<T: Decodable>(_ type: T.Type, from data: Data). Use given")
		}
		return __value
    }

    open func test<FOO>(_ type: FOO.Type) -> Int {
        addInvocation(.m_test__type(Parameter<FOO.Type>.value(`type`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_test__type(Parameter<FOO.Type>.value(`type`).wrapAsGeneric())) as? (FOO.Type) -> Void
		perform?(`type`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_test__type(Parameter<FOO.Type>.value(`type`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for test<FOO>(_ type: FOO.Type). Use given")
			Failure("Stub return value not specified for test<FOO>(_ type: FOO.Type). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_decode__typefrom_data(Parameter<GenericAttribute>, Parameter<Data>)
        case m_test__type(Parameter<GenericAttribute>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_decode__typefrom_data(let lhsType, let lhsData), .m_decode__typefrom_data(let rhsType, let rhsData)):
                guard Parameter.compare(lhs: lhsType, rhs: rhsType, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsData, rhs: rhsData, with: matcher) else { return false } 
                return true 
            case (.m_test__type(let lhsType), .m_test__type(let rhsType)):
                guard Parameter.compare(lhs: lhsType, rhs: rhsType, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_decode__typefrom_data(p0, p1): return p0.intValue + p1.intValue
            case let .m_test__type(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func decode<T: Decodable>(_ type: Parameter<T.Type>, from data: Parameter<Data>, willReturn: T...) -> MethodStub {
            return Given(method: .m_decode__typefrom_data(`type`.wrapAsGeneric(), `data`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func test<FOO>(_ type: Parameter<FOO.Type>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_test__type(`type`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func decode<T: Decodable>(_ type: Parameter<T.Type>, from data: Parameter<Data>, willProduce: (Stubber<T>) -> Void) -> MethodStub {
            let willReturn: [T] = []
			let given: Given = { return Given(method: .m_decode__typefrom_data(`type`.wrapAsGeneric(), `data`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (T).self)
			willProduce(stubber)
			return given
        }
        public static func test<FOO>(_ type: Parameter<FOO.Type>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_test__type(`type`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func decode<T>(_ type: Parameter<T.Type>, from data: Parameter<Data>) -> Verify where T:Decodable { return Verify(method: .m_decode__typefrom_data(`type`.wrapAsGeneric(), `data`))}
        public static func test<FOO>(_ type: Parameter<FOO.Type>) -> Verify { return Verify(method: .m_test__type(`type`.wrapAsGeneric()))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func decode<T>(_ type: Parameter<T.Type>, from data: Parameter<Data>, perform: @escaping (T.Type, Data) -> Void) -> Perform where T:Decodable {
            return Perform(method: .m_decode__typefrom_data(`type`.wrapAsGeneric(), `data`), performs: perform)
        }
        public static func test<FOO>(_ type: Parameter<FOO.Type>, perform: @escaping (FOO.Type) -> Void) -> Perform {
            return Perform(method: .m_test__type(`type`.wrapAsGeneric()), performs: perform)
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

// MARK: - HistorySectionMapperType
open class HistorySectionMapperTypeMock: HistorySectionMapperType, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func map<T: DateSortable>(_ items: [T]) -> [(key: String, items: [T])] {
        addInvocation(.m_map__items(Parameter<[T]>.value(`items`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_map__items(Parameter<[T]>.value(`items`).wrapAsGeneric())) as? ([T]) -> Void
		perform?(`items`)
		var __value: [(key: String, items: [T])]
		do {
		    __value = try methodReturnValue(.m_map__items(Parameter<[T]>.value(`items`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for map<T: DateSortable>(_ items: [T]). Use given")
			Failure("Stub return value not specified for map<T: DateSortable>(_ items: [T]). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_map__items(Parameter<GenericAttribute>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_map__items(let lhsItems), .m_map__items(let rhsItems)):
                guard Parameter.compare(lhs: lhsItems, rhs: rhsItems, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_map__items(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func map<T: DateSortable>(_ items: Parameter<[T]>, willReturn: [(key: String, items: [T])]...) -> MethodStub {
            return Given(method: .m_map__items(`items`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func map<T: DateSortable>(_ items: Parameter<[T]>, willProduce: (Stubber<[(key: String, items: [T])]>) -> Void) -> MethodStub {
            let willReturn: [[(key: String, items: [T])]] = []
			let given: Given = { return Given(method: .m_map__items(`items`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: ([(key: String, items: [T])]).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func map<T>(_ items: Parameter<[T]>) -> Verify where T:DateSortable { return Verify(method: .m_map__items(`items`.wrapAsGeneric()))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func map<T>(_ items: Parameter<[T]>, perform: @escaping ([T]) -> Void) -> Perform where T:DateSortable {
            return Perform(method: .m_map__items(`items`.wrapAsGeneric()), performs: perform)
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

// MARK: - InoutProtocol
open class InoutProtocolMock: InoutProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func passThisAsInOut(value: inout URLRequest) {
        addInvocation(.m_passThisAsInOut__value_value(Parameter<URLRequest>.value(`value`)))
		let perform = methodPerformValue(.m_passThisAsInOut__value_value(Parameter<URLRequest>.value(`value`))) as? (inout URLRequest) -> Void
		perform?(&`value`)
    }

    open func returnAndInOut(value: inout Int) -> String {
        addInvocation(.m_returnAndInOut__value_value(Parameter<Int>.value(`value`)))
		let perform = methodPerformValue(.m_returnAndInOut__value_value(Parameter<Int>.value(`value`))) as? (inout Int) -> Void
		perform?(&`value`)
		var __value: String
		do {
		    __value = try methodReturnValue(.m_returnAndInOut__value_value(Parameter<Int>.value(`value`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for returnAndInOut(value: inout Int). Use given")
			Failure("Stub return value not specified for returnAndInOut(value: inout Int). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_passThisAsInOut__value_value(Parameter<URLRequest>)
        case m_returnAndInOut__value_value(Parameter<Int>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_passThisAsInOut__value_value(let lhsValue), .m_passThisAsInOut__value_value(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            case (.m_returnAndInOut__value_value(let lhsValue), .m_returnAndInOut__value_value(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_passThisAsInOut__value_value(p0): return p0.intValue
            case let .m_returnAndInOut__value_value(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func returnAndInOut(value: Parameter<Int>, willReturn: String...) -> MethodStub {
            return Given(method: .m_returnAndInOut__value_value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func returnAndInOut(value: Parameter<Int>, willProduce: (Stubber<String>) -> Void) -> MethodStub {
            let willReturn: [String] = []
			let given: Given = { return Given(method: .m_returnAndInOut__value_value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func passThisAsInOut(value: Parameter<URLRequest>) -> Verify { return Verify(method: .m_passThisAsInOut__value_value(`value`))}
        public static func returnAndInOut(value: Parameter<Int>) -> Verify { return Verify(method: .m_returnAndInOut__value_value(`value`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func passThisAsInOut(value: Parameter<URLRequest>, perform: @escaping (inout URLRequest) -> Void) -> Perform {
            return Perform(method: .m_passThisAsInOut__value_value(`value`), performs: perform)
        }
        public static func returnAndInOut(value: Parameter<Int>, perform: @escaping (inout Int) -> Void) -> Perform {
            return Perform(method: .m_returnAndInOut__value_value(`value`), performs: perform)
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

// MARK: - NonSwiftProtocol
open class NonSwiftProtocolMock: NSObject, NonSwiftProtocol, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func returnNoting() {
        addInvocation(.m_returnNoting)
		let perform = methodPerformValue(.m_returnNoting) as? () -> Void
		perform?()
    }

    open func someMethod() {
        addInvocation(.m_someMethod)
		let perform = methodPerformValue(.m_someMethod) as? () -> Void
		perform?()
    }


    fileprivate enum MethodType {
        case m_returnNoting
        case m_someMethod

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_returnNoting, .m_returnNoting):
                return true 
            case (.m_someMethod, .m_someMethod):
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_returnNoting: return 0
            case .m_someMethod: return 0
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

        public static func returnNoting() -> Verify { return Verify(method: .m_returnNoting)}
        public static func someMethod() -> Verify { return Verify(method: .m_someMethod)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func returnNoting(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_returnNoting, performs: perform)
        }
        public static func someMethod(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_someMethod, performs: perform)
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

// MARK: - ProtocolMethodsGenericThatDifferOnlyInReturnType
open class ProtocolMethodsGenericThatDifferOnlyInReturnTypeMock: ProtocolMethodsGenericThatDifferOnlyInReturnType, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func foo<T>(bar: T) -> String {
        addInvocation(.m_foo__bar_bar_1(Parameter<T>.value(`bar`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_foo__bar_bar_1(Parameter<T>.value(`bar`).wrapAsGeneric())) as? (T) -> Void
		perform?(`bar`)
		var __value: String
		do {
		    __value = try methodReturnValue(.m_foo__bar_bar_1(Parameter<T>.value(`bar`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for foo<T>(bar: T). Use given")
			Failure("Stub return value not specified for foo<T>(bar: T). Use given")
		}
		return __value
    }

    open func foo<T>(bar: T) -> Int {
        addInvocation(.m_foo__bar_bar_2(Parameter<T>.value(`bar`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_foo__bar_bar_2(Parameter<T>.value(`bar`).wrapAsGeneric())) as? (T) -> Void
		perform?(`bar`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_foo__bar_bar_2(Parameter<T>.value(`bar`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for foo<T>(bar: T). Use given")
			Failure("Stub return value not specified for foo<T>(bar: T). Use given")
		}
		return __value
    }

    open func foo<T>(bar: T) -> Float where T: A {
        addInvocation(.m_foo__bar_bar_4(Parameter<T>.value(`bar`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_foo__bar_bar_4(Parameter<T>.value(`bar`).wrapAsGeneric())) as? (T) -> Void
		perform?(`bar`)
		var __value: Float
		do {
		    __value = try methodReturnValue(.m_foo__bar_bar_4(Parameter<T>.value(`bar`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for foo<T>(bar: T). Use given")
			Failure("Stub return value not specified for foo<T>(bar: T). Use given")
		}
		return __value
    }

    open func foo<T>(bar: T) -> Float where T: B {
        addInvocation(.m_foo__bar_bar_4(Parameter<T>.value(`bar`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_foo__bar_bar_4(Parameter<T>.value(`bar`).wrapAsGeneric())) as? (T) -> Void
		perform?(`bar`)
		var __value: Float
		do {
		    __value = try methodReturnValue(.m_foo__bar_bar_4(Parameter<T>.value(`bar`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for foo<T>(bar: T). Use given")
			Failure("Stub return value not specified for foo<T>(bar: T). Use given")
		}
		return __value
    }

    open func foo<T>(bar: T) -> Double where T: B {
        addInvocation(.m_foo__bar_bar_5(Parameter<T>.value(`bar`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_foo__bar_bar_5(Parameter<T>.value(`bar`).wrapAsGeneric())) as? (T) -> Void
		perform?(`bar`)
		var __value: Double
		do {
		    __value = try methodReturnValue(.m_foo__bar_bar_5(Parameter<T>.value(`bar`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for foo<T>(bar: T). Use given")
			Failure("Stub return value not specified for foo<T>(bar: T). Use given")
		}
		return __value
    }

    open func foo<T>(bar: String) -> Array<T> {
        addInvocation(.m_foo__bar_bar_6(Parameter<String>.value(`bar`)))
		let perform = methodPerformValue(.m_foo__bar_bar_6(Parameter<String>.value(`bar`))) as? (String) -> Void
		perform?(`bar`)
		var __value: Array<T>
		do {
		    __value = try methodReturnValue(.m_foo__bar_bar_6(Parameter<String>.value(`bar`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for foo<T>(bar: String). Use given")
			Failure("Stub return value not specified for foo<T>(bar: String). Use given")
		}
		return __value
    }

    open func foo<T>(bar: String) -> Set<T> {
        addInvocation(.m_foo__bar_bar_7(Parameter<String>.value(`bar`)))
		let perform = methodPerformValue(.m_foo__bar_bar_7(Parameter<String>.value(`bar`))) as? (String) -> Void
		perform?(`bar`)
		var __value: Set<T>
		do {
		    __value = try methodReturnValue(.m_foo__bar_bar_7(Parameter<String>.value(`bar`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for foo<T>(bar: String). Use given")
			Failure("Stub return value not specified for foo<T>(bar: String). Use given")
		}
		return __value
    }

    open func foo<T>(bar: Bool) -> T where T: A {
        addInvocation(.m_foo__bar_bar_9(Parameter<Bool>.value(`bar`)))
		let perform = methodPerformValue(.m_foo__bar_bar_9(Parameter<Bool>.value(`bar`))) as? (Bool) -> Void
		perform?(`bar`)
		var __value: T
		do {
		    __value = try methodReturnValue(.m_foo__bar_bar_9(Parameter<Bool>.value(`bar`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for foo<T>(bar: Bool). Use given")
			Failure("Stub return value not specified for foo<T>(bar: Bool). Use given")
		}
		return __value
    }

    open func foo<T>(bar: Bool) -> T where T: B {
        addInvocation(.m_foo__bar_bar_9(Parameter<Bool>.value(`bar`)))
		let perform = methodPerformValue(.m_foo__bar_bar_9(Parameter<Bool>.value(`bar`))) as? (Bool) -> Void
		perform?(`bar`)
		var __value: T
		do {
		    __value = try methodReturnValue(.m_foo__bar_bar_9(Parameter<Bool>.value(`bar`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for foo<T>(bar: Bool). Use given")
			Failure("Stub return value not specified for foo<T>(bar: Bool). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_foo__bar_bar_1(Parameter<GenericAttribute>)
        case m_foo__bar_bar_2(Parameter<GenericAttribute>)
        case m_foo__bar_bar_4(Parameter<GenericAttribute>)
        case m_foo__bar_bar_5(Parameter<GenericAttribute>)
        case m_foo__bar_bar_6(Parameter<String>)
        case m_foo__bar_bar_7(Parameter<String>)
        case m_foo__bar_bar_9(Parameter<Bool>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_foo__bar_bar_1(let lhsBar), .m_foo__bar_bar_1(let rhsBar)):
                guard Parameter.compare(lhs: lhsBar, rhs: rhsBar, with: matcher) else { return false } 
                return true 
            case (.m_foo__bar_bar_2(let lhsBar), .m_foo__bar_bar_2(let rhsBar)):
                guard Parameter.compare(lhs: lhsBar, rhs: rhsBar, with: matcher) else { return false } 
                return true 
            case (.m_foo__bar_bar_4(let lhsBar), .m_foo__bar_bar_4(let rhsBar)):
                guard Parameter.compare(lhs: lhsBar, rhs: rhsBar, with: matcher) else { return false } 
                return true 
            case (.m_foo__bar_bar_5(let lhsBar), .m_foo__bar_bar_5(let rhsBar)):
                guard Parameter.compare(lhs: lhsBar, rhs: rhsBar, with: matcher) else { return false } 
                return true 
            case (.m_foo__bar_bar_6(let lhsBar), .m_foo__bar_bar_6(let rhsBar)):
                guard Parameter.compare(lhs: lhsBar, rhs: rhsBar, with: matcher) else { return false } 
                return true 
            case (.m_foo__bar_bar_7(let lhsBar), .m_foo__bar_bar_7(let rhsBar)):
                guard Parameter.compare(lhs: lhsBar, rhs: rhsBar, with: matcher) else { return false } 
                return true 
            case (.m_foo__bar_bar_9(let lhsBar), .m_foo__bar_bar_9(let rhsBar)):
                guard Parameter.compare(lhs: lhsBar, rhs: rhsBar, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_foo__bar_bar_1(p0): return p0.intValue
            case let .m_foo__bar_bar_2(p0): return p0.intValue
            case let .m_foo__bar_bar_4(p0): return p0.intValue
            case let .m_foo__bar_bar_5(p0): return p0.intValue
            case let .m_foo__bar_bar_6(p0): return p0.intValue
            case let .m_foo__bar_bar_7(p0): return p0.intValue
            case let .m_foo__bar_bar_9(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func foo<T>(bar: Parameter<T>, willReturn: String...) -> MethodStub {
            return Given(method: .m_foo__bar_bar_1(`bar`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func foo<T>(bar: Parameter<T>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_foo__bar_bar_2(`bar`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func foo<T>(bar: Parameter<T>, willReturn: Float...) -> MethodStub where T: A {
            return Given(method: .m_foo__bar_bar_4(`bar`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func foo<T>(bar: Parameter<T>, willReturn: Double...) -> MethodStub where T: B {
            return Given(method: .m_foo__bar_bar_5(`bar`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func foo<T>(bar: Parameter<String>, willReturn: Array<T>...) -> MethodStub {
            return Given(method: .m_foo__bar_bar_6(`bar`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func foo<T>(bar: Parameter<String>, willReturn: Set<T>...) -> MethodStub {
            return Given(method: .m_foo__bar_bar_7(`bar`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func foo<T>(bar: Parameter<Bool>, willReturn: T...) -> MethodStub where T: A {
            return Given(method: .m_foo__bar_bar_9(`bar`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func foo<T>(bar: Parameter<T>, willProduce: (Stubber<String>) -> Void) -> MethodStub {
            let willReturn: [String] = []
			let given: Given = { return Given(method: .m_foo__bar_bar_1(`bar`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String).self)
			willProduce(stubber)
			return given
        }
        public static func foo<T>(bar: Parameter<T>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_foo__bar_bar_2(`bar`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func foo<T>(bar: Parameter<T>, willProduce: (Stubber<Float>) -> Void) -> MethodStub where T: A {
            let willReturn: [Float] = []
			let given: Given = { return Given(method: .m_foo__bar_bar_4(`bar`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Float).self)
			willProduce(stubber)
			return given
        }
        public static func foo<T>(bar: Parameter<T>, willProduce: (Stubber<Double>) -> Void) -> MethodStub where T: B {
            let willReturn: [Double] = []
			let given: Given = { return Given(method: .m_foo__bar_bar_5(`bar`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Double).self)
			willProduce(stubber)
			return given
        }
        public static func foo<T>(bar: Parameter<String>, willProduce: (Stubber<Array<T>>) -> Void) -> MethodStub {
            let willReturn: [Array<T>] = []
			let given: Given = { return Given(method: .m_foo__bar_bar_6(`bar`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Array<T>).self)
			willProduce(stubber)
			return given
        }
        public static func foo<T>(bar: Parameter<String>, willProduce: (Stubber<Set<T>>) -> Void) -> MethodStub {
            let willReturn: [Set<T>] = []
			let given: Given = { return Given(method: .m_foo__bar_bar_7(`bar`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Set<T>).self)
			willProduce(stubber)
			return given
        }
        public static func foo<T>(bar: Parameter<Bool>, willProduce: (Stubber<T>) -> Void) -> MethodStub where T: A {
            let willReturn: [T] = []
			let given: Given = { return Given(method: .m_foo__bar_bar_9(`bar`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (T).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func foo<T>(bar: Parameter<T>, returning: (String).Type) -> Verify { return Verify(method: .m_foo__bar_bar_1(`bar`.wrapAsGeneric()))}
        public static func foo<T>(bar: Parameter<T>, returning: (Int).Type) -> Verify { return Verify(method: .m_foo__bar_bar_2(`bar`.wrapAsGeneric()))}
        public static func foo<T>(bar: Parameter<T>, returning: (Float).Type) -> Verify where T: A { return Verify(method: .m_foo__bar_bar_4(`bar`.wrapAsGeneric()))}
        public static func foo<T>(bar: Parameter<T>, returning: (Double).Type) -> Verify where T: B { return Verify(method: .m_foo__bar_bar_5(`bar`.wrapAsGeneric()))}
        public static func foo<T>(bar: Parameter<String>, returning: (Array<T>).Type) -> Verify { return Verify(method: .m_foo__bar_bar_6(`bar`))}
        public static func foo<T>(bar: Parameter<String>, returning: (Set<T>).Type) -> Verify { return Verify(method: .m_foo__bar_bar_7(`bar`))}
        public static func foo<T>(bar: Parameter<Bool>, returning: (T).Type) -> Verify where T: A { return Verify(method: .m_foo__bar_bar_9(`bar`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func foo<T>(bar: Parameter<T>, returning: (String).Type, perform: @escaping (T) -> Void) -> Perform {
            return Perform(method: .m_foo__bar_bar_1(`bar`.wrapAsGeneric()), performs: perform)
        }
        public static func foo<T>(bar: Parameter<T>, returning: (Int).Type, perform: @escaping (T) -> Void) -> Perform {
            return Perform(method: .m_foo__bar_bar_2(`bar`.wrapAsGeneric()), performs: perform)
        }
        public static func foo<T>(bar: Parameter<T>, returning: (Float).Type, perform: @escaping (T) -> Void) -> Perform where T: A {
            return Perform(method: .m_foo__bar_bar_4(`bar`.wrapAsGeneric()), performs: perform)
        }
        public static func foo<T>(bar: Parameter<T>, returning: (Double).Type, perform: @escaping (T) -> Void) -> Perform where T: B {
            return Perform(method: .m_foo__bar_bar_5(`bar`.wrapAsGeneric()), performs: perform)
        }
        public static func foo<T>(bar: Parameter<String>, returning: (Array<T>).Type, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_foo__bar_bar_6(`bar`), performs: perform)
        }
        public static func foo<T>(bar: Parameter<String>, returning: (Set<T>).Type, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_foo__bar_bar_7(`bar`), performs: perform)
        }
        public static func foo<T>(bar: Parameter<Bool>, returning: (T).Type, perform: @escaping (Bool) -> Void) -> Perform where T: A {
            return Perform(method: .m_foo__bar_bar_9(`bar`), performs: perform)
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

// MARK: - ProtocolMethodsThatDifferOnlyInReturnType
open class ProtocolMethodsThatDifferOnlyInReturnTypeMock: ProtocolMethodsThatDifferOnlyInReturnType, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func foo(bar: String) -> String {
        addInvocation(.m_foo__bar_bar_1(Parameter<String>.value(`bar`)))
		let perform = methodPerformValue(.m_foo__bar_bar_1(Parameter<String>.value(`bar`))) as? (String) -> Void
		perform?(`bar`)
		var __value: String
		do {
		    __value = try methodReturnValue(.m_foo__bar_bar_1(Parameter<String>.value(`bar`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for foo(bar: String). Use given")
			Failure("Stub return value not specified for foo(bar: String). Use given")
		}
		return __value
    }

    open func foo(bar: String) -> Int {
        addInvocation(.m_foo__bar_bar_2(Parameter<String>.value(`bar`)))
		let perform = methodPerformValue(.m_foo__bar_bar_2(Parameter<String>.value(`bar`))) as? (String) -> Void
		perform?(`bar`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_foo__bar_bar_2(Parameter<String>.value(`bar`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for foo(bar: String). Use given")
			Failure("Stub return value not specified for foo(bar: String). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_foo__bar_bar_1(Parameter<String>)
        case m_foo__bar_bar_2(Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_foo__bar_bar_1(let lhsBar), .m_foo__bar_bar_1(let rhsBar)):
                guard Parameter.compare(lhs: lhsBar, rhs: rhsBar, with: matcher) else { return false } 
                return true 
            case (.m_foo__bar_bar_2(let lhsBar), .m_foo__bar_bar_2(let rhsBar)):
                guard Parameter.compare(lhs: lhsBar, rhs: rhsBar, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_foo__bar_bar_1(p0): return p0.intValue
            case let .m_foo__bar_bar_2(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func foo(bar: Parameter<String>, willReturn: String...) -> MethodStub {
            return Given(method: .m_foo__bar_bar_1(`bar`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func foo(bar: Parameter<String>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_foo__bar_bar_2(`bar`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func foo(bar: Parameter<String>, willProduce: (Stubber<String>) -> Void) -> MethodStub {
            let willReturn: [String] = []
			let given: Given = { return Given(method: .m_foo__bar_bar_1(`bar`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String).self)
			willProduce(stubber)
			return given
        }
        public static func foo(bar: Parameter<String>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_foo__bar_bar_2(`bar`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func foo(bar: Parameter<String>, returning: (String).Type) -> Verify { return Verify(method: .m_foo__bar_bar_1(`bar`))}
        public static func foo(bar: Parameter<String>, returning: (Int).Type) -> Verify { return Verify(method: .m_foo__bar_bar_2(`bar`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func foo(bar: Parameter<String>, returning: (String).Type, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_foo__bar_bar_1(`bar`), performs: perform)
        }
        public static func foo(bar: Parameter<String>, returning: (Int).Type, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_foo__bar_bar_2(`bar`), performs: perform)
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

// MARK: - ProtocolWithAssociatedType
open class ProtocolWithAssociatedTypeMock<T>: ProtocolWithAssociatedType, Mock where T: Sequence {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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

    public var sequence: T {
		get {	invocations.append(.p_sequence_get); return __p_sequence ?? givenGetterValue(.p_sequence_get, "ProtocolWithAssociatedTypeMock - stub value for sequence was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_sequence = newValue }
	}
	private var __p_sequence: (T)?





    open func methodWithType(t: T) -> Bool {
        addInvocation(.m_methodWithType__t_t(Parameter<T>.value(`t`)))
		let perform = methodPerformValue(.m_methodWithType__t_t(Parameter<T>.value(`t`))) as? (T) -> Void
		perform?(`t`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_methodWithType__t_t(Parameter<T>.value(`t`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithType(t: T). Use given")
			Failure("Stub return value not specified for methodWithType(t: T). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_methodWithType__t_t(Parameter<T>)
        case p_sequence_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_methodWithType__t_t(let lhsT), .m_methodWithType__t_t(let rhsT)):
                guard Parameter.compare(lhs: lhsT, rhs: rhsT, with: matcher) else { return false } 
                return true 
            case (.p_sequence_get,.p_sequence_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_methodWithType__t_t(p0): return p0.intValue
            case .p_sequence_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func sequence(getter defaultValue: T...) -> PropertyStub {
            return Given(method: .p_sequence_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func methodWithType(t: Parameter<T>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_methodWithType__t_t(`t`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithType(t: Parameter<T>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_methodWithType__t_t(`t`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodWithType(t: Parameter<T>) -> Verify { return Verify(method: .m_methodWithType__t_t(`t`))}
        public static var sequence: Verify { return Verify(method: .p_sequence_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodWithType(t: Parameter<T>, perform: @escaping (T) -> Void) -> Perform {
            return Perform(method: .m_methodWithType__t_t(`t`), performs: perform)
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

// MARK: - ProtocolWithAssociatedType2
open class ProtocolWithAssociatedType2Mock<ValueType>: ProtocolWithAssociatedType2, Mock where ValueType: StringConvertibleType {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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

    public var property: String {
		get {	invocations.append(.p_property_get); return __p_property ?? givenGetterValue(.p_property_get, "ProtocolWithAssociatedType2Mock - stub value for property was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_property = newValue }
	}
	private var __p_property: (String)?






    fileprivate enum MethodType {
        case p_property_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_property_get,.p_property_get): return true
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_property_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func property(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_property_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var property: Verify { return Verify(method: .p_property_get) }
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

// MARK: - ProtocolWithClosures
open class ProtocolWithClosuresMock: ProtocolWithClosures, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func methodThatTakes(closure: (Int) -> Int) {
        addInvocation(.m_methodThatTakes__closure_closure(Parameter<(Int) -> Int>.any))
		let perform = methodPerformValue(.m_methodThatTakes__closure_closure(Parameter<(Int) -> Int>.any)) as? ((Int) -> Int) -> Void
		perform?(`closure`)
    }

    open func methodThatTakesEscaping(closure: @escaping (Int) -> Int) {
        addInvocation(.m_methodThatTakesEscaping__closure_closure(Parameter<(Int) -> Int>.value(`closure`)))
		let perform = methodPerformValue(.m_methodThatTakesEscaping__closure_closure(Parameter<(Int) -> Int>.value(`closure`))) as? (@escaping (Int) -> Int) -> Void
		perform?(`closure`)
    }

    open func methodThatTakesCompletionBlock(completion: (Bool,Error?) -> Void) {
        addInvocation(.m_methodThatTakesCompletionBlock__completion_completion(Parameter<(Bool,Error?) -> Void>.any))
		let perform = methodPerformValue(.m_methodThatTakesCompletionBlock__completion_completion(Parameter<(Bool,Error?) -> Void>.any)) as? ((Bool,Error?) -> Void) -> Void
		perform?(`completion`)
    }


    fileprivate enum MethodType {
        case m_methodThatTakes__closure_closure(Parameter<(Int) -> Int>)
        case m_methodThatTakesEscaping__closure_closure(Parameter<(Int) -> Int>)
        case m_methodThatTakesCompletionBlock__completion_completion(Parameter<(Bool,Error?) -> Void>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_methodThatTakes__closure_closure(let lhsClosure), .m_methodThatTakes__closure_closure(let rhsClosure)):
                guard Parameter.compare(lhs: lhsClosure, rhs: rhsClosure, with: matcher) else { return false } 
                return true 
            case (.m_methodThatTakesEscaping__closure_closure(let lhsClosure), .m_methodThatTakesEscaping__closure_closure(let rhsClosure)):
                guard Parameter.compare(lhs: lhsClosure, rhs: rhsClosure, with: matcher) else { return false } 
                return true 
            case (.m_methodThatTakesCompletionBlock__completion_completion(let lhsCompletion), .m_methodThatTakesCompletionBlock__completion_completion(let rhsCompletion)):
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_methodThatTakes__closure_closure(p0): return p0.intValue
            case let .m_methodThatTakesEscaping__closure_closure(p0): return p0.intValue
            case let .m_methodThatTakesCompletionBlock__completion_completion(p0): return p0.intValue
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

        public static func methodThatTakes(closure: Parameter<(Int) -> Int>) -> Verify { return Verify(method: .m_methodThatTakes__closure_closure(`closure`))}
        public static func methodThatTakesEscaping(closure: Parameter<(Int) -> Int>) -> Verify { return Verify(method: .m_methodThatTakesEscaping__closure_closure(`closure`))}
        public static func methodThatTakesCompletionBlock(completion: Parameter<(Bool,Error?) -> Void>) -> Verify { return Verify(method: .m_methodThatTakesCompletionBlock__completion_completion(`completion`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodThatTakes(closure: Parameter<(Int) -> Int>, perform: @escaping ((Int) -> Int) -> Void) -> Perform {
            return Perform(method: .m_methodThatTakes__closure_closure(`closure`), performs: perform)
        }
        public static func methodThatTakesEscaping(closure: Parameter<(Int) -> Int>, perform: @escaping (@escaping (Int) -> Int) -> Void) -> Perform {
            return Perform(method: .m_methodThatTakesEscaping__closure_closure(`closure`), performs: perform)
        }
        public static func methodThatTakesCompletionBlock(completion: Parameter<(Bool,Error?) -> Void>, perform: @escaping ((Bool,Error?) -> Void) -> Void) -> Perform {
            return Perform(method: .m_methodThatTakesCompletionBlock__completion_completion(`completion`), performs: perform)
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

// MARK: - ProtocolWithConflictingMembers
open class ProtocolWithConflictingMembersMock: ProtocolWithConflictingMembers, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func method(withLabel value: Int) -> Bool {
        addInvocation(.m_method__withLabel_value(Parameter<Int>.value(`value`)))
		let perform = methodPerformValue(.m_method__withLabel_value(Parameter<Int>.value(`value`))) as? (Int) -> Void
		perform?(`value`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_method__withLabel_value(Parameter<Int>.value(`value`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for method(withLabel value: Int). Use given")
			Failure("Stub return value not specified for method(withLabel value: Int). Use given")
		}
		return __value
    }

    open func method(_ value: Int) -> Bool {
        addInvocation(.m_method__value(Parameter<Int>.value(`value`)))
		let perform = methodPerformValue(.m_method__value(Parameter<Int>.value(`value`))) as? (Int) -> Void
		perform?(`value`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_method__value(Parameter<Int>.value(`value`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for method(_ value: Int). Use given")
			Failure("Stub return value not specified for method(_ value: Int). Use given")
		}
		return __value
    }

    open func method(value: Int) -> Bool {
        addInvocation(.m_method__value_value(Parameter<Int>.value(`value`)))
		let perform = methodPerformValue(.m_method__value_value(Parameter<Int>.value(`value`))) as? (Int) -> Void
		perform?(`value`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_method__value_value(Parameter<Int>.value(`value`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for method(value: Int). Use given")
			Failure("Stub return value not specified for method(value: Int). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_method__withLabel_value(Parameter<Int>)
        case m_method__value(Parameter<Int>)
        case m_method__value_value(Parameter<Int>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_method__withLabel_value(let lhsValue), .m_method__withLabel_value(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            case (.m_method__value(let lhsValue), .m_method__value(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            case (.m_method__value_value(let lhsValue), .m_method__value_value(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_method__withLabel_value(p0): return p0.intValue
            case let .m_method__value(p0): return p0.intValue
            case let .m_method__value_value(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func method(withLabel value: Parameter<Int>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_method__withLabel_value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func method(_ value: Parameter<Int>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_method__value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func method(value: Parameter<Int>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_method__value_value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func method(withLabel value: Parameter<Int>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_method__withLabel_value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        public static func method(_ value: Parameter<Int>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_method__value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        public static func method(value: Parameter<Int>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_method__value_value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func method(withLabel value: Parameter<Int>) -> Verify { return Verify(method: .m_method__withLabel_value(`value`))}
        public static func method(_ value: Parameter<Int>) -> Verify { return Verify(method: .m_method__value(`value`))}
        public static func method(value: Parameter<Int>) -> Verify { return Verify(method: .m_method__value_value(`value`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func method(withLabel value: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .m_method__withLabel_value(`value`), performs: perform)
        }
        public static func method(_ value: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .m_method__value(`value`), performs: perform)
        }
        public static func method(value: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .m_method__value_value(`value`), performs: perform)
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

// MARK: - ProtocolWithCustomAttributes
open class ProtocolWithCustomAttributesMock: ProtocolWithCustomAttributes, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func methodThatTakesUser(user: UserObject) throws {
        addInvocation(.m_methodThatTakesUser__user_user(Parameter<UserObject>.value(`user`)))
		let perform = methodPerformValue(.m_methodThatTakesUser__user_user(Parameter<UserObject>.value(`user`))) as? (UserObject) -> Void
		perform?(`user`)
		do {
		    _ = try methodReturnValue(.m_methodThatTakesUser__user_user(Parameter<UserObject>.value(`user`))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }

    open func methodThatTakesArrayOfUsers(array: [UserObject]) -> Int {
        addInvocation(.m_methodThatTakesArrayOfUsers__array_array(Parameter<[UserObject]>.value(`array`)))
		let perform = methodPerformValue(.m_methodThatTakesArrayOfUsers__array_array(Parameter<[UserObject]>.value(`array`))) as? ([UserObject]) -> Void
		perform?(`array`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodThatTakesArrayOfUsers__array_array(Parameter<[UserObject]>.value(`array`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodThatTakesArrayOfUsers(array: [UserObject]). Use given")
			Failure("Stub return value not specified for methodThatTakesArrayOfUsers(array: [UserObject]). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_methodThatTakesUser__user_user(Parameter<UserObject>)
        case m_methodThatTakesArrayOfUsers__array_array(Parameter<[UserObject]>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_methodThatTakesUser__user_user(let lhsUser), .m_methodThatTakesUser__user_user(let rhsUser)):
                guard Parameter.compare(lhs: lhsUser, rhs: rhsUser, with: matcher) else { return false } 
                return true 
            case (.m_methodThatTakesArrayOfUsers__array_array(let lhsArray), .m_methodThatTakesArrayOfUsers__array_array(let rhsArray)):
                guard Parameter.compare(lhs: lhsArray, rhs: rhsArray, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_methodThatTakesUser__user_user(p0): return p0.intValue
            case let .m_methodThatTakesArrayOfUsers__array_array(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func methodThatTakesArrayOfUsers(array: Parameter<[UserObject]>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodThatTakesArrayOfUsers__array_array(`array`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodThatTakesArrayOfUsers(array: Parameter<[UserObject]>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_methodThatTakesArrayOfUsers__array_array(`array`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func methodThatTakesUser(user: Parameter<UserObject>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_methodThatTakesUser__user_user(`user`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func methodThatTakesUser(user: Parameter<UserObject>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_methodThatTakesUser__user_user(`user`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodThatTakesUser(user: Parameter<UserObject>) -> Verify { return Verify(method: .m_methodThatTakesUser__user_user(`user`))}
        public static func methodThatTakesArrayOfUsers(array: Parameter<[UserObject]>) -> Verify { return Verify(method: .m_methodThatTakesArrayOfUsers__array_array(`array`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodThatTakesUser(user: Parameter<UserObject>, perform: @escaping (UserObject) -> Void) -> Perform {
            return Perform(method: .m_methodThatTakesUser__user_user(`user`), performs: perform)
        }
        public static func methodThatTakesArrayOfUsers(array: Parameter<[UserObject]>, perform: @escaping ([UserObject]) -> Void) -> Perform {
            return Perform(method: .m_methodThatTakesArrayOfUsers__array_array(`array`), performs: perform)
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

// MARK: - ProtocolWithDeprecatedMembers
open class ProtocolWithDeprecatedMembersMock: ProtocolWithDeprecatedMembers, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func method(_ value: Int) -> Bool {
        addInvocation(.m_method__value(Parameter<Int>.value(`value`)))
		let perform = methodPerformValue(.m_method__value(Parameter<Int>.value(`value`))) as? (Int) -> Void
		perform?(`value`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_method__value(Parameter<Int>.value(`value`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for method(_ value: Int). Use given")
			Failure("Stub return value not specified for method(_ value: Int). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_method__value(Parameter<Int>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_method__value(let lhsValue), .m_method__value(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_method__value(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func method(_ value: Parameter<Int>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_method__value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func method(_ value: Parameter<Int>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_method__value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func method(_ value: Parameter<Int>) -> Verify { return Verify(method: .m_method__value(`value`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func method(_ value: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .m_method__value(`value`), performs: perform)
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

// MARK: - ProtocolWithGenericConstraints
open class ProtocolWithGenericConstraintsMock<ContainedType>: ProtocolWithGenericConstraints, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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

    public var value: ContainedType {
		get {	invocations.append(.p_value_get); return __p_value ?? givenGetterValue(.p_value_get, "ProtocolWithGenericConstraintsMock - stub value for value was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_value = newValue }
	}
	private var __p_value: (ContainedType)?





    open func extractString<U: CustomStringConvertible>() -> String? where ContainedType == Optional<U> {
        addInvocation(.m_extractString)
		let perform = methodPerformValue(.m_extractString) as? () -> Void
		perform?()
		var __value: String? = nil
		do {
		    __value = try methodReturnValue(.m_extractString).casted()
		} catch {
			// do nothing
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_extractString
        case p_value_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_extractString, .m_extractString):
                return true 
            case (.p_value_get,.p_value_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_extractString: return 0
            case .p_value_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func value(getter defaultValue: ContainedType...) -> PropertyStub {
            return Given(method: .p_value_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func extractString<U: CustomStringConvertible>(willReturn: String?...) -> MethodStub where ContainedType == Optional<U> {
            return Given(method: .m_extractString, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func extractString<U: CustomStringConvertible>(willProduce: (Stubber<String?>) -> Void) -> MethodStub where ContainedType == Optional<U> {
            let willReturn: [String?] = []
			let given: Given = { return Given(method: .m_extractString, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String?).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func extractString() -> Verify { return Verify(method: .m_extractString)}
        public static var value: Verify { return Verify(method: .p_value_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func extractString(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_extractString, performs: perform)
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

// MARK: - ProtocolWithGenericMethods
open class ProtocolWithGenericMethodsMock: ProtocolWithGenericMethods, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func methodWithGeneric<T>(lhs: T, rhs: T) -> Bool {
        addInvocation(.m_methodWithGeneric__lhs_lhsrhs_rhs(Parameter<T>.value(`lhs`).wrapAsGeneric(), Parameter<T>.value(`rhs`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_methodWithGeneric__lhs_lhsrhs_rhs(Parameter<T>.value(`lhs`).wrapAsGeneric(), Parameter<T>.value(`rhs`).wrapAsGeneric())) as? (T, T) -> Void
		perform?(`lhs`, `rhs`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_methodWithGeneric__lhs_lhsrhs_rhs(Parameter<T>.value(`lhs`).wrapAsGeneric(), Parameter<T>.value(`rhs`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithGeneric<T>(lhs: T, rhs: T). Use given")
			Failure("Stub return value not specified for methodWithGeneric<T>(lhs: T, rhs: T). Use given")
		}
		return __value
    }

    open func methodWithGenericConstraint<U>(param: [U]) -> U where U: Equatable {
        addInvocation(.m_methodWithGenericConstraint__param_param(Parameter<[U]>.value(`param`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_methodWithGenericConstraint__param_param(Parameter<[U]>.value(`param`).wrapAsGeneric())) as? ([U]) -> Void
		perform?(`param`)
		var __value: U
		do {
		    __value = try methodReturnValue(.m_methodWithGenericConstraint__param_param(Parameter<[U]>.value(`param`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithGenericConstraint<U>(param: [U]). Use given")
			Failure("Stub return value not specified for methodWithGenericConstraint<U>(param: [U]). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_methodWithGeneric__lhs_lhsrhs_rhs(Parameter<GenericAttribute>, Parameter<GenericAttribute>)
        case m_methodWithGenericConstraint__param_param(Parameter<GenericAttribute>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_methodWithGeneric__lhs_lhsrhs_rhs(let lhsLhs, let lhsRhs), .m_methodWithGeneric__lhs_lhsrhs_rhs(let rhsLhs, let rhsRhs)):
                guard Parameter.compare(lhs: lhsLhs, rhs: rhsLhs, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsRhs, rhs: rhsRhs, with: matcher) else { return false } 
                return true 
            case (.m_methodWithGenericConstraint__param_param(let lhsParam), .m_methodWithGenericConstraint__param_param(let rhsParam)):
                guard Parameter.compare(lhs: lhsParam, rhs: rhsParam, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_methodWithGeneric__lhs_lhsrhs_rhs(p0, p1): return p0.intValue + p1.intValue
            case let .m_methodWithGenericConstraint__param_param(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func methodWithGeneric<T>(lhs: Parameter<T>, rhs: Parameter<T>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_methodWithGeneric__lhs_lhsrhs_rhs(`lhs`.wrapAsGeneric(), `rhs`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithGenericConstraint<U>(param: Parameter<[U]>, willReturn: U...) -> MethodStub where U: Equatable {
            return Given(method: .m_methodWithGenericConstraint__param_param(`param`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithGeneric<T>(lhs: Parameter<T>, rhs: Parameter<T>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_methodWithGeneric__lhs_lhsrhs_rhs(`lhs`.wrapAsGeneric(), `rhs`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithGenericConstraint<U>(param: Parameter<[U]>, willProduce: (Stubber<U>) -> Void) -> MethodStub where U: Equatable {
            let willReturn: [U] = []
			let given: Given = { return Given(method: .m_methodWithGenericConstraint__param_param(`param`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (U).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodWithGeneric<T>(lhs: Parameter<T>, rhs: Parameter<T>) -> Verify { return Verify(method: .m_methodWithGeneric__lhs_lhsrhs_rhs(`lhs`.wrapAsGeneric(), `rhs`.wrapAsGeneric()))}
        public static func methodWithGenericConstraint<U>(param: Parameter<[U]>) -> Verify { return Verify(method: .m_methodWithGenericConstraint__param_param(`param`.wrapAsGeneric()))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodWithGeneric<T>(lhs: Parameter<T>, rhs: Parameter<T>, perform: @escaping (T, T) -> Void) -> Perform {
            return Perform(method: .m_methodWithGeneric__lhs_lhsrhs_rhs(`lhs`.wrapAsGeneric(), `rhs`.wrapAsGeneric()), performs: perform)
        }
        public static func methodWithGenericConstraint<U>(param: Parameter<[U]>, perform: @escaping ([U]) -> Void) -> Perform {
            return Perform(method: .m_methodWithGenericConstraint__param_param(`param`.wrapAsGeneric()), performs: perform)
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

// MARK: - ProtocolWithGenericMethodsNested
open class ProtocolWithGenericMethodsNestedMock: ProtocolWithGenericMethodsNested, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func methodWithGeneric<T>(resource: Resource<T>) -> Observable<Response<T>> {
        addInvocation(.m_methodWithGeneric__resource_resource(Parameter<Resource<T>>.value(`resource`).wrapAsGeneric()))
		let perform = methodPerformValue(.m_methodWithGeneric__resource_resource(Parameter<Resource<T>>.value(`resource`).wrapAsGeneric())) as? (Resource<T>) -> Void
		perform?(`resource`)
		var __value: Observable<Response<T>>
		do {
		    __value = try methodReturnValue(.m_methodWithGeneric__resource_resource(Parameter<Resource<T>>.value(`resource`).wrapAsGeneric())).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithGeneric<T>(resource: Resource<T>). Use given")
			Failure("Stub return value not specified for methodWithGeneric<T>(resource: Resource<T>). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_methodWithGeneric__resource_resource(Parameter<GenericAttribute>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_methodWithGeneric__resource_resource(let lhsResource), .m_methodWithGeneric__resource_resource(let rhsResource)):
                guard Parameter.compare(lhs: lhsResource, rhs: rhsResource, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_methodWithGeneric__resource_resource(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func methodWithGeneric<T>(resource: Parameter<Resource<T>>, willReturn: Observable<Response<T>>...) -> MethodStub {
            return Given(method: .m_methodWithGeneric__resource_resource(`resource`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithGeneric<T>(resource: Parameter<Resource<T>>, willProduce: (Stubber<Observable<Response<T>>>) -> Void) -> MethodStub {
            let willReturn: [Observable<Response<T>>] = []
			let given: Given = { return Given(method: .m_methodWithGeneric__resource_resource(`resource`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Observable<Response<T>>).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodWithGeneric<T>(resource: Parameter<Resource<T>>) -> Verify { return Verify(method: .m_methodWithGeneric__resource_resource(`resource`.wrapAsGeneric()))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodWithGeneric<T>(resource: Parameter<Resource<T>>, perform: @escaping (Resource<T>) -> Void) -> Perform {
            return Perform(method: .m_methodWithGeneric__resource_resource(`resource`.wrapAsGeneric()), performs: perform)
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

// MARK: - ProtocolWithInitializers
open class ProtocolWithInitializersMock: ProtocolWithInitializers, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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

    public var param: Int {
		get {	invocations.append(.p_param_get); return __p_param ?? givenGetterValue(.p_param_get, "ProtocolWithInitializersMock - stub value for param was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_param = newValue }
	}
	private var __p_param: (Int)?

    public var other: String {
		get {	invocations.append(.p_other_get); return __p_other ?? givenGetterValue(.p_other_get, "ProtocolWithInitializersMock - stub value for other was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_other = newValue }
	}
	private var __p_other: (String)?





    public required init(param: Int, other: String) { }

    public required init(param: Int) { }


    fileprivate enum MethodType {
        case p_param_get
        case p_other_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_param_get,.p_param_get): return true
            case (.p_other_get,.p_other_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_param_get: return 0
            case .p_other_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func param(getter defaultValue: Int...) -> PropertyStub {
            return Given(method: .p_param_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func other(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_other_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var param: Verify { return Verify(method: .p_param_get) }
        public static var other: Verify { return Verify(method: .p_other_get) }
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

// MARK: - ProtocolWithPropoerties
open class ProtocolWithPropoertiesMock: ProtocolWithPropoerties, Mock, StaticMock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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
    static var matcher: Matcher = Matcher.default
    static var stubbingPolicy: StubbingPolicy = .wrap
    static var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    public typealias StaticPropertyStub = StaticGiven
    public typealias StaticMethodStub = StaticGiven
    public static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    public var name: String {
		get {	invocations.append(.p_name_get); return __p_name ?? givenGetterValue(.p_name_get, "ProtocolWithPropoertiesMock - stub value for name was not defined") }
		set {	invocations.append(.p_name_set(.value(newValue))); __p_name = newValue }
	}
	private var __p_name: (String)?

    public var email: String? {
		get {	invocations.append(.p_email_get); return __p_email ?? optionalGivenGetterValue(.p_email_get, "ProtocolWithPropoertiesMock - stub value for email was not defined") }
		set {	invocations.append(.p_email_set(.value(newValue))); __p_email = newValue }
	}
	private var __p_email: (String)?


    public static var name: String {
		get {	ProtocolWithPropoertiesMock.invocations.append(.p_name_get); return ProtocolWithPropoertiesMock.__p_name ?? givenGetterValue(.p_name_get, "ProtocolWithPropoertiesMock - stub value for name was not defined") }
		set {	ProtocolWithPropoertiesMock.invocations.append(.p_name_set(.value(newValue))); ProtocolWithPropoertiesMock.__p_name = newValue }
	}
	private static var __p_name: (String)?

    public static var defaultEmail: String? {
		get {	ProtocolWithPropoertiesMock.invocations.append(.p_defaultEmail_get); return ProtocolWithPropoertiesMock.__p_defaultEmail ?? optionalGivenGetterValue(.p_defaultEmail_get, "ProtocolWithPropoertiesMock - stub value for defaultEmail was not defined") }
		set {	ProtocolWithPropoertiesMock.invocations.append(.p_defaultEmail_set(.value(newValue))); ProtocolWithPropoertiesMock.__p_defaultEmail = newValue }
	}
	private static var __p_defaultEmail: (String)?




    public static func defaultEmail(_ newValue: String!) {
        addInvocation(.sm_defaultEmail__newValue(Parameter<String?>.value(`newValue`)))
		let perform = methodPerformValue(.sm_defaultEmail__newValue(Parameter<String?>.value(`newValue`))) as? (String?) -> Void
		perform?(`newValue`)
    }

    open func name(_ newValue: String) {
        addInvocation(.m_name__newValue(Parameter<String>.value(`newValue`)))
		let perform = methodPerformValue(.m_name__newValue(Parameter<String>.value(`newValue`))) as? (String) -> Void
		perform?(`newValue`)
    }

    open func email(_ newValue: String!) {
        addInvocation(.m_email__newValue(Parameter<String?>.value(`newValue`)))
		let perform = methodPerformValue(.m_email__newValue(Parameter<String?>.value(`newValue`))) as? (String?) -> Void
		perform?(`newValue`)
    }

    fileprivate enum StaticMethodType {
        case sm_defaultEmail__newValue(Parameter<String?>)
        case p_name_get
		case p_name_set(Parameter<String>)
        case p_defaultEmail_get
		case p_defaultEmail_set(Parameter<String?>)

        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.sm_defaultEmail__newValue(let lhsNewvalue), .sm_defaultEmail__newValue(let rhsNewvalue)):
                guard Parameter.compare(lhs: lhsNewvalue, rhs: rhsNewvalue, with: matcher) else { return false } 
                return true 
            case (.p_name_get,.p_name_get): return true
			case (.p_name_set(let left),.p_name_set(let right)): return Parameter<String>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_defaultEmail_get,.p_defaultEmail_get): return true
			case (.p_defaultEmail_set(let left),.p_defaultEmail_set(let right)): return Parameter<String?>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .sm_defaultEmail__newValue(p0): return p0.intValue
                case .p_name_get: return 0
			case .p_name_set(let newValue): return newValue.intValue
                case .p_defaultEmail_get: return 0
			case .p_defaultEmail_set(let newValue): return newValue.intValue
            }
        }
    }

    open class StaticGiven: StubbedMethod {
        fileprivate var method: StaticMethodType

        private init(method: StaticMethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func name(getter defaultValue: String...) -> StaticPropertyStub {
            return StaticGiven(method: .p_name_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func defaultEmail(getter defaultValue: String?...) -> StaticPropertyStub {
            return StaticGiven(method: .p_defaultEmail_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct StaticVerify {
        fileprivate var method: StaticMethodType

        public static func defaultEmail(_ newValue: Parameter<String?>) -> StaticVerify { return StaticVerify(method: .sm_defaultEmail__newValue(`newValue`))}
        public static var name: StaticVerify { return StaticVerify(method: .p_name_get) }
		public static func name(set newValue: Parameter<String>) -> StaticVerify { return StaticVerify(method: .p_name_set(newValue)) }
        public static var defaultEmail: StaticVerify { return StaticVerify(method: .p_defaultEmail_get) }
		public static func defaultEmail(set newValue: Parameter<String?>) -> StaticVerify { return StaticVerify(method: .p_defaultEmail_set(newValue)) }
    }

    public struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        public static func defaultEmail(_ newValue: Parameter<String?>, perform: @escaping (String?) -> Void) -> StaticPerform {
            return StaticPerform(method: .sm_defaultEmail__newValue(`newValue`), performs: perform)
        }
    }

    
    fileprivate enum MethodType {
        case m_name__newValue(Parameter<String>)
        case m_email__newValue(Parameter<String?>)
        case p_name_get
		case p_name_set(Parameter<String>)
        case p_email_get
		case p_email_set(Parameter<String?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_name__newValue(let lhsNewvalue), .m_name__newValue(let rhsNewvalue)):
                guard Parameter.compare(lhs: lhsNewvalue, rhs: rhsNewvalue, with: matcher) else { return false } 
                return true 
            case (.m_email__newValue(let lhsNewvalue), .m_email__newValue(let rhsNewvalue)):
                guard Parameter.compare(lhs: lhsNewvalue, rhs: rhsNewvalue, with: matcher) else { return false } 
                return true 
            case (.p_name_get,.p_name_get): return true
			case (.p_name_set(let left),.p_name_set(let right)): return Parameter<String>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_email_get,.p_email_get): return true
			case (.p_email_set(let left),.p_email_set(let right)): return Parameter<String?>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_name__newValue(p0): return p0.intValue
            case let .m_email__newValue(p0): return p0.intValue
            case .p_name_get: return 0
			case .p_name_set(let newValue): return newValue.intValue
            case .p_email_get: return 0
			case .p_email_set(let newValue): return newValue.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func name(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_name_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func email(getter defaultValue: String?...) -> PropertyStub {
            return Given(method: .p_email_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func name(_ newValue: Parameter<String>) -> Verify { return Verify(method: .m_name__newValue(`newValue`))}
        public static func email(_ newValue: Parameter<String?>) -> Verify { return Verify(method: .m_email__newValue(`newValue`))}
        public static var name: Verify { return Verify(method: .p_name_get) }
		public static func name(set newValue: Parameter<String>) -> Verify { return Verify(method: .p_name_set(newValue)) }
        public static var email: Verify { return Verify(method: .p_email_get) }
		public static func email(set newValue: Parameter<String?>) -> Verify { return Verify(method: .p_email_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func name(_ newValue: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_name__newValue(`newValue`), performs: perform)
        }
        public static func email(_ newValue: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_email__newValue(`newValue`), performs: perform)
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

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }
    static private func methodReturnValue(_ method: StaticMethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }
    static private func givenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            Failure(message)
        }
    }
    static private func optionalGivenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
}

// MARK: - ProtocolWithStaticMembers
open class ProtocolWithStaticMembersMock: ProtocolWithStaticMembers, Mock, StaticMock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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
    static var matcher: Matcher = Matcher.default
    static var stubbingPolicy: StubbingPolicy = .wrap
    static var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    public typealias StaticPropertyStub = StaticGiven
    public typealias StaticMethodStub = StaticGiven
    public static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }


    public static var staticProperty: String {
		get {	ProtocolWithStaticMembersMock.invocations.append(.p_staticProperty_get); return ProtocolWithStaticMembersMock.__p_staticProperty ?? givenGetterValue(.p_staticProperty_get, "ProtocolWithStaticMembersMock - stub value for staticProperty was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	ProtocolWithStaticMembersMock.__p_staticProperty = newValue }
	}
	private static var __p_staticProperty: (String)?




    public static func staticMethod(param: Int) throws -> Int {
        addInvocation(.sm_staticMethod__param_param(Parameter<Int>.value(`param`)))
		let perform = methodPerformValue(.sm_staticMethod__param_param(Parameter<Int>.value(`param`))) as? (Int) -> Void
		perform?(`param`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.sm_staticMethod__param_param(Parameter<Int>.value(`param`))).casted()
		} catch MockError.notStubed {
			Failure("Stub return value not specified for staticMethod(param: Int). Use given")
		} catch {
		    throw error
		}
		return __value
    }

    fileprivate enum StaticMethodType {
        case sm_staticMethod__param_param(Parameter<Int>)
        case p_staticProperty_get

        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.sm_staticMethod__param_param(let lhsParam), .sm_staticMethod__param_param(let rhsParam)):
                guard Parameter.compare(lhs: lhsParam, rhs: rhsParam, with: matcher) else { return false } 
                return true 
            case (.p_staticProperty_get,.p_staticProperty_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .sm_staticMethod__param_param(p0): return p0.intValue
                case .p_staticProperty_get: return 0
            }
        }
    }

    open class StaticGiven: StubbedMethod {
        fileprivate var method: StaticMethodType

        private init(method: StaticMethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func staticProperty(getter defaultValue: String...) -> StaticPropertyStub {
            return StaticGiven(method: .p_staticProperty_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func staticMethod(param: Parameter<Int>, willReturn: Int...) -> StaticMethodStub {
            return StaticGiven(method: .sm_staticMethod__param_param(`param`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func staticMethod(param: Parameter<Int>, willThrow: Error...) -> StaticMethodStub {
            return StaticGiven(method: .sm_staticMethod__param_param(`param`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func staticMethod(param: Parameter<Int>, willProduce: (StubberThrows<Int>) -> Void) -> StaticMethodStub {
            let willThrow: [Error] = []
			let given: StaticGiven = { return StaticGiven(method: .sm_staticMethod__param_param(`param`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Int).self)
			willProduce(stubber)
			return given
        }
    }

    public struct StaticVerify {
        fileprivate var method: StaticMethodType

        public static func staticMethod(param: Parameter<Int>) -> StaticVerify { return StaticVerify(method: .sm_staticMethod__param_param(`param`))}
        public static var staticProperty: StaticVerify { return StaticVerify(method: .p_staticProperty_get) }
    }

    public struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        public static func staticMethod(param: Parameter<Int>, perform: @escaping (Int) -> Void) -> StaticPerform {
            return StaticPerform(method: .sm_staticMethod__param_param(`param`), performs: perform)
        }
    }

    
    fileprivate struct MethodType {
        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool { return true }
        func intValue() -> Int { return 0 }
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

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }
    static private func methodReturnValue(_ method: StaticMethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }
    static private func givenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            Failure(message)
        }
    }
    static private func optionalGivenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
}

// MARK: - ProtocolWithSubscripts
open class ProtocolWithSubscriptsMock: ProtocolWithSubscripts, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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

    public var something: Any {
		get {	invocations.append(.p_something_get); return __p_something ?? givenGetterValue(.p_something_get, "ProtocolWithSubscriptsMock - stub value for something was not defined") }
		set {	invocations.append(.p_something_set(.value(newValue))); __p_something = newValue }
	}
	private var __p_something: (Any)?





    open func aaa(_ value: Int) -> Bool {
        addInvocation(.m_aaa__value(Parameter<Int>.value(`value`)))
		let perform = methodPerformValue(.m_aaa__value(Parameter<Int>.value(`value`))) as? (Int) -> Void
		perform?(`value`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_aaa__value(Parameter<Int>.value(`value`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for aaa(_ value: Int). Use given")
			Failure("Stub return value not specified for aaa(_ value: Int). Use given")
		}
		return __value
    }

    public subscript (_ index: Int) -> String {
		get {
			addInvocation(.subscript_get_index_1(Parameter<Int>.value(`index`)))
			do {
				return try methodReturnValue(.subscript_get_index_1(Parameter<Int>.value(`index`))).casted()
			} catch {
				onFatalFailure("Stub return value not specified for subscript. Use given first."); Failure("noStubDefinedMessage")
			}
		}
		set {
			addInvocation(.subscript_set_index_1(Parameter<Int>.value(`index`), Parameter<String>.value(newValue)))
		}
	}

    public subscript (labeled index: Int) -> String {
		get {
			addInvocation(.subscript_get_labeled_index(Parameter<Int>.value(`index`)))
			do {
				return try methodReturnValue(.subscript_get_labeled_index(Parameter<Int>.value(`index`))).casted()
			} catch {
				onFatalFailure("Stub return value not specified for subscript. Use given first."); Failure("noStubDefinedMessage")
			}
		}
		set {
			addInvocation(.subscript_set_labeled_index(Parameter<Int>.value(`index`), Parameter<String>.value(newValue)))
		}
	}

    public subscript (_ x: Int, _ y: Int) -> String {
		get {
			addInvocation(.subscript_get_x_y(Parameter<Int>.value(`x`), Parameter<Int>.value(`y`)))
			do {
				return try methodReturnValue(.subscript_get_x_y(Parameter<Int>.value(`x`), Parameter<Int>.value(`y`))).casted()
			} catch {
				onFatalFailure("Stub return value not specified for subscript. Use given first."); Failure("noStubDefinedMessage")
			}
		}
		set {
			addInvocation(.subscript_set_x_y(Parameter<Int>.value(`x`), Parameter<Int>.value(`y`), Parameter<String>.value(newValue)))
		}
	}

    public subscript (_ index: String) -> String {
		get {
			addInvocation(.subscript_get_index_2(Parameter<String>.value(`index`)))
			do {
				return try methodReturnValue(.subscript_get_index_2(Parameter<String>.value(`index`))).casted()
			} catch {
				onFatalFailure("Stub return value not specified for subscript. Use given first."); Failure("noStubDefinedMessage")
			}
		}
		set {
			addInvocation(.subscript_set_index_2(Parameter<String>.value(`index`), Parameter<String>.value(newValue)))
		}
	}

    public subscript (index index: String) -> String {
		get {
			addInvocation(.subscript_get_index_index(Parameter<String>.value(`index`)))
			do {
				return try methodReturnValue(.subscript_get_index_index(Parameter<String>.value(`index`))).casted()
			} catch {
				onFatalFailure("Stub return value not specified for subscript. Use given first."); Failure("noStubDefinedMessage")
			}
		}
		set {
			addInvocation(.subscript_set_index_index(Parameter<String>.value(`index`), Parameter<String>.value(newValue)))
		}
	}

    public subscript (label name: String) -> Int {
		get {
			addInvocation(.subscript_get_label_name(Parameter<String>.value(`name`)))
			do {
				return try methodReturnValue(.subscript_get_label_name(Parameter<String>.value(`name`))).casted()
			} catch {
				onFatalFailure("Stub return value not specified for subscript. Use given first."); Failure("noStubDefinedMessage")
			}
		}
	}

    public subscript<T: Sequence>(with generic: T) -> Bool where T.Element: Equatable {
		get {
			addInvocation(.subscript_get_with_generic_1(Parameter<T>.value(`generic`).wrapAsGeneric()))
			do {
				return try methodReturnValue(.subscript_get_with_generic_1(Parameter<T>.value(`generic`).wrapAsGeneric())).casted()
			} catch {
				onFatalFailure("Stub return value not specified for subscript. Use given first."); Failure("noStubDefinedMessage")
			}
		}
		set {
			addInvocation(.subscript_set_with_generic_1(Parameter<T>.value(`generic`).wrapAsGeneric(), Parameter<Bool>.value(newValue)))
		}
	}

    public subscript<T: FloatingPoint>(with generic: T) -> Int where T: FloatingPoint {
		get {
			addInvocation(.subscript_get_with_generic_2(Parameter<T>.value(`generic`).wrapAsGeneric()))
			do {
				return try methodReturnValue(.subscript_get_with_generic_2(Parameter<T>.value(`generic`).wrapAsGeneric())).casted()
			} catch {
				onFatalFailure("Stub return value not specified for subscript. Use given first."); Failure("noStubDefinedMessage")
			}
		}
		set {
			addInvocation(.subscript_set_with_generic_2(Parameter<T>.value(`generic`).wrapAsGeneric(), Parameter<Int>.value(newValue)))
		}
	}

    public subscript<T>(_ i: Int, _ type: T.Type) -> T {
		get {
			addInvocation(.subscript_get_i_type(Parameter<Int>.value(`i`), Parameter<T.Type>.value(`type`).wrapAsGeneric()))
			do {
				return try methodReturnValue(.subscript_get_i_type(Parameter<Int>.value(`i`), Parameter<T.Type>.value(`type`).wrapAsGeneric())).casted()
			} catch {
				onFatalFailure("Stub return value not specified for subscript. Use given first."); Failure("noStubDefinedMessage")
			}
		}
		set {
			addInvocation(.subscript_set_i_type(Parameter<Int>.value(`i`), Parameter<T.Type>.value(`type`).wrapAsGeneric(), Parameter<T>.value(newValue).wrapAsGeneric()))
		}
	}

    public subscript (closure c: @escaping (Int) -> Void) -> Bool {
		get {
			addInvocation(.subscript_get_closure_c(Parameter<(Int) -> Void>.value(`c`)))
			do {
				return try methodReturnValue(.subscript_get_closure_c(Parameter<(Int) -> Void>.value(`c`))).casted()
			} catch {
				onFatalFailure("Stub return value not specified for subscript. Use given first."); Failure("noStubDefinedMessage")
			}
		}
		set {
			addInvocation(.subscript_set_closure_c(Parameter<(Int) -> Void>.value(`c`), Parameter<Bool>.value(newValue)))
		}
	}

    public subscript (same same: Int) -> Bool {
		get {
			addInvocation(.subscript_get_same_same_1(Parameter<Int>.value(`same`)))
			do {
				return try methodReturnValue(.subscript_get_same_same_1(Parameter<Int>.value(`same`))).casted()
			} catch {
				onFatalFailure("Stub return value not specified for subscript. Use given first."); Failure("noStubDefinedMessage")
			}
		}
		set {
			addInvocation(.subscript_set_same_same_1(Parameter<Int>.value(`same`), Parameter<Bool>.value(newValue)))
		}
	}

    public subscript (same same: Int) -> Int {
		get {
			addInvocation(.subscript_get_same_same_2(Parameter<Int>.value(`same`)))
			do {
				return try methodReturnValue(.subscript_get_same_same_2(Parameter<Int>.value(`same`))).casted()
			} catch {
				onFatalFailure("Stub return value not specified for subscript. Use given first."); Failure("noStubDefinedMessage")
			}
		}
		set {
			addInvocation(.subscript_set_same_same_2(Parameter<Int>.value(`same`), Parameter<Int>.value(newValue)))
		}
	}


    fileprivate enum MethodType {
        case m_aaa__value(Parameter<Int>)
        case p_something_get
		case p_something_set(Parameter<Any>)
        case subscript_get_index_1(Parameter<Int>)
		case subscript_set_index_1(Parameter<Int>, Parameter<String>)
        case subscript_get_labeled_index(Parameter<Int>)
		case subscript_set_labeled_index(Parameter<Int>, Parameter<String>)
        case subscript_get_x_y(Parameter<Int>, Parameter<Int>)
		case subscript_set_x_y(Parameter<Int>, Parameter<Int>, Parameter<String>)
        case subscript_get_index_2(Parameter<String>)
		case subscript_set_index_2(Parameter<String>, Parameter<String>)
        case subscript_get_index_index(Parameter<String>)
		case subscript_set_index_index(Parameter<String>, Parameter<String>)
        case subscript_get_label_name(Parameter<String>)
        case subscript_get_with_generic_1(Parameter<GenericAttribute>)
		case subscript_set_with_generic_1(Parameter<GenericAttribute>, Parameter<Bool>)
        case subscript_get_with_generic_2(Parameter<GenericAttribute>)
		case subscript_set_with_generic_2(Parameter<GenericAttribute>, Parameter<Int>)
        case subscript_get_i_type(Parameter<Int>, Parameter<GenericAttribute>)
		case subscript_set_i_type(Parameter<Int>, Parameter<GenericAttribute>, Parameter<GenericAttribute>)
        case subscript_get_closure_c(Parameter<(Int) -> Void>)
		case subscript_set_closure_c(Parameter<(Int) -> Void>, Parameter<Bool>)
        case subscript_get_same_same_1(Parameter<Int>)
		case subscript_set_same_same_1(Parameter<Int>, Parameter<Bool>)
        case subscript_get_same_same_2(Parameter<Int>)
		case subscript_set_same_same_2(Parameter<Int>, Parameter<Int>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_aaa__value(let lhsValue), .m_aaa__value(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            case (.p_something_get,.p_something_get): return true
			case (.p_something_set(let left),.p_something_set(let right)): return Parameter<Any>.compare(lhs: left, rhs: right, with: matcher)
            case (let .subscript_get_index_1(lhsIndex), let .subscript_get_index_1(rhsIndex)):
				guard Parameter.compare(lhs: lhsIndex, rhs: rhsIndex, with: matcher) else { return false }
				return true
			case (let .subscript_set_index_1(lhsIndex, lhsDidSet), let .subscript_set_index_1(rhsIndex, rhsDidSet)):
				guard Parameter.compare(lhs: lhsIndex, rhs: rhsIndex, with: matcher) else { return false }
				return Parameter.compare(lhs: lhsDidSet, rhs: rhsDidSet, with: matcher)
            case (let .subscript_get_labeled_index(lhsIndex), let .subscript_get_labeled_index(rhsIndex)):
				guard Parameter.compare(lhs: lhsIndex, rhs: rhsIndex, with: matcher) else { return false }
				return true
			case (let .subscript_set_labeled_index(lhsIndex, lhsDidSet), let .subscript_set_labeled_index(rhsIndex, rhsDidSet)):
				guard Parameter.compare(lhs: lhsIndex, rhs: rhsIndex, with: matcher) else { return false }
				return Parameter.compare(lhs: lhsDidSet, rhs: rhsDidSet, with: matcher)
            case (let .subscript_get_x_y(lhsX, lhsY), let .subscript_get_x_y(rhsX, rhsY)):
				guard Parameter.compare(lhs: lhsX, rhs: rhsX, with: matcher) else { return false }
				guard Parameter.compare(lhs: lhsY, rhs: rhsY, with: matcher) else { return false }
				return true
			case (let .subscript_set_x_y(lhsX, lhsY, lhsDidSet), let .subscript_set_x_y(rhsX, rhsY, rhsDidSet)):
				guard Parameter.compare(lhs: lhsX, rhs: rhsX, with: matcher) else { return false }
				guard Parameter.compare(lhs: lhsY, rhs: rhsY, with: matcher) else { return false }
				return Parameter.compare(lhs: lhsDidSet, rhs: rhsDidSet, with: matcher)
            case (let .subscript_get_index_2(lhsIndex), let .subscript_get_index_2(rhsIndex)):
				guard Parameter.compare(lhs: lhsIndex, rhs: rhsIndex, with: matcher) else { return false }
				return true
			case (let .subscript_set_index_2(lhsIndex, lhsDidSet), let .subscript_set_index_2(rhsIndex, rhsDidSet)):
				guard Parameter.compare(lhs: lhsIndex, rhs: rhsIndex, with: matcher) else { return false }
				return Parameter.compare(lhs: lhsDidSet, rhs: rhsDidSet, with: matcher)
            case (let .subscript_get_index_index(lhsIndex), let .subscript_get_index_index(rhsIndex)):
				guard Parameter.compare(lhs: lhsIndex, rhs: rhsIndex, with: matcher) else { return false }
				return true
			case (let .subscript_set_index_index(lhsIndex, lhsDidSet), let .subscript_set_index_index(rhsIndex, rhsDidSet)):
				guard Parameter.compare(lhs: lhsIndex, rhs: rhsIndex, with: matcher) else { return false }
				return Parameter.compare(lhs: lhsDidSet, rhs: rhsDidSet, with: matcher)
            case (let .subscript_get_label_name(lhsName), let .subscript_get_label_name(rhsName)):
				guard Parameter.compare(lhs: lhsName, rhs: rhsName, with: matcher) else { return false }
				return true
            case (let .subscript_get_with_generic_1(lhsGeneric), let .subscript_get_with_generic_1(rhsGeneric)):
				guard Parameter.compare(lhs: lhsGeneric, rhs: rhsGeneric, with: matcher) else { return false }
				return true
			case (let .subscript_set_with_generic_1(lhsGeneric, lhsDidSet), let .subscript_set_with_generic_1(rhsGeneric, rhsDidSet)):
				guard Parameter.compare(lhs: lhsGeneric, rhs: rhsGeneric, with: matcher) else { return false }
				return Parameter.compare(lhs: lhsDidSet, rhs: rhsDidSet, with: matcher)
            case (let .subscript_get_with_generic_2(lhsGeneric), let .subscript_get_with_generic_2(rhsGeneric)):
				guard Parameter.compare(lhs: lhsGeneric, rhs: rhsGeneric, with: matcher) else { return false }
				return true
			case (let .subscript_set_with_generic_2(lhsGeneric, lhsDidSet), let .subscript_set_with_generic_2(rhsGeneric, rhsDidSet)):
				guard Parameter.compare(lhs: lhsGeneric, rhs: rhsGeneric, with: matcher) else { return false }
				return Parameter.compare(lhs: lhsDidSet, rhs: rhsDidSet, with: matcher)
            case (let .subscript_get_i_type(lhsI, lhsType), let .subscript_get_i_type(rhsI, rhsType)):
				guard Parameter.compare(lhs: lhsI, rhs: rhsI, with: matcher) else { return false }
				guard Parameter.compare(lhs: lhsType, rhs: rhsType, with: matcher) else { return false }
				return true
			case (let .subscript_set_i_type(lhsI, lhsType, lhsDidSet), let .subscript_set_i_type(rhsI, rhsType, rhsDidSet)):
				guard Parameter.compare(lhs: lhsI, rhs: rhsI, with: matcher) else { return false }
				guard Parameter.compare(lhs: lhsType, rhs: rhsType, with: matcher) else { return false }
				return Parameter.compare(lhs: lhsDidSet, rhs: rhsDidSet, with: matcher)
            case (let .subscript_get_closure_c(lhsC), let .subscript_get_closure_c(rhsC)):
				guard Parameter.compare(lhs: lhsC, rhs: rhsC, with: matcher) else { return false }
				return true
			case (let .subscript_set_closure_c(lhsC, lhsDidSet), let .subscript_set_closure_c(rhsC, rhsDidSet)):
				guard Parameter.compare(lhs: lhsC, rhs: rhsC, with: matcher) else { return false }
				return Parameter.compare(lhs: lhsDidSet, rhs: rhsDidSet, with: matcher)
            case (let .subscript_get_same_same_1(lhsSame), let .subscript_get_same_same_1(rhsSame)):
				guard Parameter.compare(lhs: lhsSame, rhs: rhsSame, with: matcher) else { return false }
				return true
			case (let .subscript_set_same_same_1(lhsSame, lhsDidSet), let .subscript_set_same_same_1(rhsSame, rhsDidSet)):
				guard Parameter.compare(lhs: lhsSame, rhs: rhsSame, with: matcher) else { return false }
				return Parameter.compare(lhs: lhsDidSet, rhs: rhsDidSet, with: matcher)
            case (let .subscript_get_same_same_2(lhsSame), let .subscript_get_same_same_2(rhsSame)):
				guard Parameter.compare(lhs: lhsSame, rhs: rhsSame, with: matcher) else { return false }
				return true
			case (let .subscript_set_same_same_2(lhsSame, lhsDidSet), let .subscript_set_same_same_2(rhsSame, rhsDidSet)):
				guard Parameter.compare(lhs: lhsSame, rhs: rhsSame, with: matcher) else { return false }
				return Parameter.compare(lhs: lhsDidSet, rhs: rhsDidSet, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_aaa__value(p0): return p0.intValue
            case .p_something_get: return 0
			case .p_something_set(let newValue): return newValue.intValue
            case let .subscript_get_index_1(p0): return p0.intValue
			case let .subscript_set_index_1(p0, _): return p0.intValue
            case let .subscript_get_labeled_index(p0): return p0.intValue
			case let .subscript_set_labeled_index(p0, _): return p0.intValue
            case let .subscript_get_x_y(p0, p1): return p0.intValue + p1.intValue
			case let .subscript_set_x_y(p0, p1, _): return p0.intValue + p1.intValue
            case let .subscript_get_index_2(p0): return p0.intValue
			case let .subscript_set_index_2(p0, _): return p0.intValue
            case let .subscript_get_index_index(p0): return p0.intValue
			case let .subscript_set_index_index(p0, _): return p0.intValue
            case let .subscript_get_label_name(p0): return p0.intValue
            case let .subscript_get_with_generic_1(p0): return p0.intValue
			case let .subscript_set_with_generic_1(p0, _): return p0.intValue
            case let .subscript_get_with_generic_2(p0): return p0.intValue
			case let .subscript_set_with_generic_2(p0, _): return p0.intValue
            case let .subscript_get_i_type(p0, p1): return p0.intValue + p1.intValue
			case let .subscript_set_i_type(p0, p1, _): return p0.intValue + p1.intValue
            case let .subscript_get_closure_c(p0): return p0.intValue
			case let .subscript_set_closure_c(p0, _): return p0.intValue
            case let .subscript_get_same_same_1(p0): return p0.intValue
			case let .subscript_set_same_same_1(p0, _): return p0.intValue
            case let .subscript_get_same_same_2(p0): return p0.intValue
			case let .subscript_set_same_same_2(p0, _): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func something(getter defaultValue: Any...) -> PropertyStub {
            return Given(method: .p_something_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func aaa(_ value: Parameter<Int>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_aaa__value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func aaa(_ value: Parameter<Int>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_aaa__value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        public static func `subscript`(_ index: Parameter<Int>, willReturn: String...) -> SubscriptStub {
            return Given(method: .subscript_get_index_1(`index`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func `subscript`(labeled index: Parameter<Int>, willReturn: String...) -> SubscriptStub {
            return Given(method: .subscript_get_labeled_index(`index`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func `subscript`(_ x: Parameter<Int>, _ y: Parameter<Int>, willReturn: String...) -> SubscriptStub {
            return Given(method: .subscript_get_x_y(`x`, `y`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func `subscript`(_ index: Parameter<String>, willReturn: String...) -> SubscriptStub {
            return Given(method: .subscript_get_index_2(`index`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func `subscript`(index: Parameter<String>, willReturn: String...) -> SubscriptStub {
            return Given(method: .subscript_get_index_index(`index`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func `subscript`(label name: Parameter<String>, willReturn: Int...) -> SubscriptStub {
            return Given(method: .subscript_get_label_name(`name`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func `subscript`<T: Sequence>(with generic: Parameter<T>, willReturn: Bool...) -> SubscriptStub {
            return Given(method: .subscript_get_with_generic_1(`generic`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func `subscript`<T: FloatingPoint>(with generic: Parameter<T>, willReturn: Int...) -> SubscriptStub {
            return Given(method: .subscript_get_with_generic_2(`generic`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func `subscript`<T>(_ i: Parameter<Int>, _ type: Parameter<T.Type>, willReturn: T...) -> SubscriptStub {
            return Given(method: .subscript_get_i_type(`i`, `type`.wrapAsGeneric()), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func `subscript`(closure c: Parameter<(Int) -> Void>, willReturn: Bool...) -> SubscriptStub {
            return Given(method: .subscript_get_closure_c(`c`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func `subscript`(same: Parameter<Int>, willReturn: Bool...) -> SubscriptStub {
            return Given(method: .subscript_get_same_same_1(`same`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func `subscript`(same: Parameter<Int>, willReturn: Int...) -> SubscriptStub {
            return Given(method: .subscript_get_same_same_2(`same`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func aaa(_ value: Parameter<Int>) -> Verify { return Verify(method: .m_aaa__value(`value`))}
        public static var something: Verify { return Verify(method: .p_something_get) }
		public static func something(set newValue: Parameter<Any>) -> Verify { return Verify(method: .p_something_set(newValue)) }
        public static func `subscript`(_ index: Parameter<Int>) -> Verify { return Verify(method: .subscript_get_index_1(`index`))}
        public static func `subscript`(_ index: Parameter<Int>, set newValue: Parameter<String>) -> Verify { return Verify(method: .subscript_set_index_1(`index`, newValue))}
        public static func `subscript`(labeled index: Parameter<Int>) -> Verify { return Verify(method: .subscript_get_labeled_index(`index`))}
        public static func `subscript`(labeled index: Parameter<Int>, set newValue: Parameter<String>) -> Verify { return Verify(method: .subscript_set_labeled_index(`index`, newValue))}
        public static func `subscript`(_ x: Parameter<Int>, _ y: Parameter<Int>) -> Verify { return Verify(method: .subscript_get_x_y(`x`, `y`))}
        public static func `subscript`(_ x: Parameter<Int>, _ y: Parameter<Int>, set newValue: Parameter<String>) -> Verify { return Verify(method: .subscript_set_x_y(`x`, `y`, newValue))}
        public static func `subscript`(_ index: Parameter<String>) -> Verify { return Verify(method: .subscript_get_index_2(`index`))}
        public static func `subscript`(_ index: Parameter<String>, set newValue: Parameter<String>) -> Verify { return Verify(method: .subscript_set_index_2(`index`, newValue))}
        public static func `subscript`(index: Parameter<String>) -> Verify { return Verify(method: .subscript_get_index_index(`index`))}
        public static func `subscript`(index: Parameter<String>, set newValue: Parameter<String>) -> Verify { return Verify(method: .subscript_set_index_index(`index`, newValue))}
        public static func `subscript`(label name: Parameter<String>) -> Verify { return Verify(method: .subscript_get_label_name(`name`))}
        public static func `subscript`<T: Sequence>(with generic: Parameter<T>) -> Verify { return Verify(method: .subscript_get_with_generic_1(`generic`.wrapAsGeneric()))}
        public static func `subscript`<T: Sequence>(with generic: Parameter<T>, set newValue: Parameter<Bool>) -> Verify { return Verify(method: .subscript_set_with_generic_1(`generic`.wrapAsGeneric(), newValue))}
        public static func `subscript`<T: FloatingPoint>(with generic: Parameter<T>) -> Verify { return Verify(method: .subscript_get_with_generic_2(`generic`.wrapAsGeneric()))}
        public static func `subscript`<T: FloatingPoint>(with generic: Parameter<T>, set newValue: Parameter<Int>) -> Verify { return Verify(method: .subscript_set_with_generic_2(`generic`.wrapAsGeneric(), newValue))}
        public static func `subscript`<T>(_ i: Parameter<Int>, _ type: Parameter<T.Type>) -> Verify { return Verify(method: .subscript_get_i_type(`i`, `type`.wrapAsGeneric()))}
        public static func `subscript`<T>(_ i: Parameter<Int>, _ type: Parameter<T.Type>, set newValue: Parameter<T>) -> Verify { return Verify(method: .subscript_set_i_type(`i`, `type`.wrapAsGeneric(), newValue.wrapAsGeneric()))}
        public static func `subscript`(closure c: Parameter<(Int) -> Void>) -> Verify { return Verify(method: .subscript_get_closure_c(`c`))}
        public static func `subscript`(closure c: Parameter<(Int) -> Void>, set newValue: Parameter<Bool>) -> Verify { return Verify(method: .subscript_set_closure_c(`c`, newValue))}
        public static func `subscript`(same: Parameter<Int>, returning: (Bool).Type) -> Verify { return Verify(method: .subscript_get_same_same_1(`same`))}
        public static func `subscript`(same: Parameter<Int>, set newValue: Parameter<Bool>) -> Verify { return Verify(method: .subscript_set_same_same_1(`same`, newValue))}
        public static func `subscript`(same: Parameter<Int>, returning: (Int).Type) -> Verify { return Verify(method: .subscript_get_same_same_2(`same`))}
        public static func `subscript`(same: Parameter<Int>, set newValue: Parameter<Int>) -> Verify { return Verify(method: .subscript_set_same_same_2(`same`, newValue))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func aaa(_ value: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .m_aaa__value(`value`), performs: perform)
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

// MARK: - ProtocolWithThrowingMethods
open class ProtocolWithThrowingMethodsMock: ProtocolWithThrowingMethods, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func methodThatThrows() throws {
        addInvocation(.m_methodThatThrows)
		let perform = methodPerformValue(.m_methodThatThrows) as? () -> Void
		perform?()
		do {
		    _ = try methodReturnValue(.m_methodThatThrows).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }

    open func methodThatReturnsAndThrows(param: Int) throws -> Bool {
        addInvocation(.m_methodThatReturnsAndThrows__param_param(Parameter<Int>.value(`param`)))
		let perform = methodPerformValue(.m_methodThatReturnsAndThrows__param_param(Parameter<Int>.value(`param`))) as? (Int) -> Void
		perform?(`param`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_methodThatReturnsAndThrows__param_param(Parameter<Int>.value(`param`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for methodThatReturnsAndThrows(param: Int). Use given")
			Failure("Stub return value not specified for methodThatReturnsAndThrows(param: Int). Use given")
		} catch {
		    throw error
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_methodThatThrows
        case m_methodThatReturnsAndThrows__param_param(Parameter<Int>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_methodThatThrows, .m_methodThatThrows):
                return true 
            case (.m_methodThatReturnsAndThrows__param_param(let lhsParam), .m_methodThatReturnsAndThrows__param_param(let rhsParam)):
                guard Parameter.compare(lhs: lhsParam, rhs: rhsParam, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_methodThatThrows: return 0
            case let .m_methodThatReturnsAndThrows__param_param(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func methodThatReturnsAndThrows(param: Parameter<Int>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_methodThatReturnsAndThrows__param_param(`param`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodThatThrows(willThrow: Error...) -> MethodStub {
            return Given(method: .m_methodThatThrows, products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func methodThatThrows(willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_methodThatThrows, products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
        public static func methodThatReturnsAndThrows(param: Parameter<Int>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_methodThatReturnsAndThrows__param_param(`param`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func methodThatReturnsAndThrows(param: Parameter<Int>, willProduce: (StubberThrows<Bool>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_methodThatReturnsAndThrows__param_param(`param`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodThatThrows() -> Verify { return Verify(method: .m_methodThatThrows)}
        public static func methodThatReturnsAndThrows(param: Parameter<Int>) -> Verify { return Verify(method: .m_methodThatReturnsAndThrows__param_param(`param`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodThatThrows(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_methodThatThrows, performs: perform)
        }
        public static func methodThatReturnsAndThrows(param: Parameter<Int>, perform: @escaping (Int) -> Void) -> Perform {
            return Perform(method: .m_methodThatReturnsAndThrows__param_param(`param`), performs: perform)
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

// MARK: - ProtocolWithTuples
open class ProtocolWithTuplesMock: ProtocolWithTuples, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func methodThatTakesTuple(tuple: (String,Int)) -> Int {
        addInvocation(.m_methodThatTakesTuple__tuple_tuple(Parameter<(String,Int)>.value(`tuple`)))
		let perform = methodPerformValue(.m_methodThatTakesTuple__tuple_tuple(Parameter<(String,Int)>.value(`tuple`))) as? ((String,Int)) -> Void
		perform?(`tuple`)
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_methodThatTakesTuple__tuple_tuple(Parameter<(String,Int)>.value(`tuple`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodThatTakesTuple(tuple: (String,Int)). Use given")
			Failure("Stub return value not specified for methodThatTakesTuple(tuple: (String,Int)). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_methodThatTakesTuple__tuple_tuple(Parameter<(String,Int)>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_methodThatTakesTuple__tuple_tuple(let lhsTuple), .m_methodThatTakesTuple__tuple_tuple(let rhsTuple)):
                guard Parameter.compare(lhs: lhsTuple, rhs: rhsTuple, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_methodThatTakesTuple__tuple_tuple(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func methodThatTakesTuple(tuple: Parameter<(String,Int)>, willReturn: Int...) -> MethodStub {
            return Given(method: .m_methodThatTakesTuple__tuple_tuple(`tuple`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodThatTakesTuple(tuple: Parameter<(String,Int)>, willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_methodThatTakesTuple__tuple_tuple(`tuple`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodThatTakesTuple(tuple: Parameter<(String,Int)>) -> Verify { return Verify(method: .m_methodThatTakesTuple__tuple_tuple(`tuple`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodThatTakesTuple(tuple: Parameter<(String,Int)>, perform: @escaping ((String,Int)) -> Void) -> Perform {
            return Perform(method: .m_methodThatTakesTuple__tuple_tuple(`tuple`), performs: perform)
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

// MARK: - ProtocolWithWhereAfterDefinition
open class ProtocolWithWhereAfterDefinitionMock<T>: ProtocolWithWhereAfterDefinition, Mock where T: Sequence, T.Element: Equatable {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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

    public var sequence: T {
		get {	invocations.append(.p_sequence_get); return __p_sequence ?? givenGetterValue(.p_sequence_get, "ProtocolWithWhereAfterDefinitionMock - stub value for sequence was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_sequence = newValue }
	}
	private var __p_sequence: (T)?





    open func methodWithType(t: T) -> Bool {
        addInvocation(.m_methodWithType__t_t(Parameter<T>.value(`t`)))
		let perform = methodPerformValue(.m_methodWithType__t_t(Parameter<T>.value(`t`))) as? (T) -> Void
		perform?(`t`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_methodWithType__t_t(Parameter<T>.value(`t`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithType(t: T). Use given")
			Failure("Stub return value not specified for methodWithType(t: T). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_methodWithType__t_t(Parameter<T>)
        case p_sequence_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_methodWithType__t_t(let lhsT), .m_methodWithType__t_t(let rhsT)):
                guard Parameter.compare(lhs: lhsT, rhs: rhsT, with: matcher) else { return false } 
                return true 
            case (.p_sequence_get,.p_sequence_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_methodWithType__t_t(p0): return p0.intValue
            case .p_sequence_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func sequence(getter defaultValue: T...) -> PropertyStub {
            return Given(method: .p_sequence_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func methodWithType(t: Parameter<T>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_methodWithType__t_t(`t`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithType(t: Parameter<T>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_methodWithType__t_t(`t`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodWithType(t: Parameter<T>) -> Verify { return Verify(method: .m_methodWithType__t_t(`t`))}
        public static var sequence: Verify { return Verify(method: .p_sequence_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodWithType(t: Parameter<T>, perform: @escaping (T) -> Void) -> Perform {
            return Perform(method: .m_methodWithType__t_t(`t`), performs: perform)
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

// MARK: - SampleServiceType
open class SampleServiceTypeMock: SampleServiceType, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func serviceName() -> String {
        addInvocation(.m_serviceName)
		let perform = methodPerformValue(.m_serviceName) as? () -> Void
		perform?()
		var __value: String
		do {
		    __value = try methodReturnValue(.m_serviceName).casted()
		} catch {
			onFatalFailure("Stub return value not specified for serviceName(). Use given")
			Failure("Stub return value not specified for serviceName(). Use given")
		}
		return __value
    }

    open func getPoint(from point: Point) -> Point {
        addInvocation(.m_getPoint__from_point(Parameter<Point>.value(`point`)))
		let perform = methodPerformValue(.m_getPoint__from_point(Parameter<Point>.value(`point`))) as? (Point) -> Void
		perform?(`point`)
		var __value: Point
		do {
		    __value = try methodReturnValue(.m_getPoint__from_point(Parameter<Point>.value(`point`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getPoint(from point: Point). Use given")
			Failure("Stub return value not specified for getPoint(from point: Point). Use given")
		}
		return __value
    }

    open func getPoint(from tuple: (Float,Float)) -> Point {
        addInvocation(.m_getPoint__from_tuple(Parameter<(Float,Float)>.value(`tuple`)))
		let perform = methodPerformValue(.m_getPoint__from_tuple(Parameter<(Float,Float)>.value(`tuple`))) as? ((Float,Float)) -> Void
		perform?(`tuple`)
		var __value: Point
		do {
		    __value = try methodReturnValue(.m_getPoint__from_tuple(Parameter<(Float,Float)>.value(`tuple`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getPoint(from tuple: (Float,Float)). Use given")
			Failure("Stub return value not specified for getPoint(from tuple: (Float,Float)). Use given")
		}
		return __value
    }

    open func similarMethodThatDiffersOnType(_ value: Float) -> Bool {
        addInvocation(.m_similarMethodThatDiffersOnType__value_1(Parameter<Float>.value(`value`)))
		let perform = methodPerformValue(.m_similarMethodThatDiffersOnType__value_1(Parameter<Float>.value(`value`))) as? (Float) -> Void
		perform?(`value`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_similarMethodThatDiffersOnType__value_1(Parameter<Float>.value(`value`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for similarMethodThatDiffersOnType(_ value: Float). Use given")
			Failure("Stub return value not specified for similarMethodThatDiffersOnType(_ value: Float). Use given")
		}
		return __value
    }

    open func similarMethodThatDiffersOnType(_ value: Point) -> Bool {
        addInvocation(.m_similarMethodThatDiffersOnType__value_2(Parameter<Point>.value(`value`)))
		let perform = methodPerformValue(.m_similarMethodThatDiffersOnType__value_2(Parameter<Point>.value(`value`))) as? (Point) -> Void
		perform?(`value`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_similarMethodThatDiffersOnType__value_2(Parameter<Point>.value(`value`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for similarMethodThatDiffersOnType(_ value: Point). Use given")
			Failure("Stub return value not specified for similarMethodThatDiffersOnType(_ value: Point). Use given")
		}
		return __value
    }

    open func methodWithTypedef(_ scalar: Scalar) {
        addInvocation(.m_methodWithTypedef__scalar(Parameter<Scalar>.value(`scalar`)))
		let perform = methodPerformValue(.m_methodWithTypedef__scalar(Parameter<Scalar>.value(`scalar`))) as? (Scalar) -> Void
		perform?(`scalar`)
    }

    open func methodWithClosures(success function: LinearFunction) -> ClosureFabric {
        addInvocation(.m_methodWithClosures__success_function_1(Parameter<LinearFunction>.value(`function`)))
		let perform = methodPerformValue(.m_methodWithClosures__success_function_1(Parameter<LinearFunction>.value(`function`))) as? (LinearFunction) -> Void
		perform?(`function`)
		var __value: ClosureFabric
		do {
		    __value = try methodReturnValue(.m_methodWithClosures__success_function_1(Parameter<LinearFunction>.value(`function`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithClosures(success function: LinearFunction). Use given")
			Failure("Stub return value not specified for methodWithClosures(success function: LinearFunction). Use given")
		}
		return __value
    }

    open func methodWithClosures(success function: ((Scalar,Scalar) -> Scalar)?) -> ((Int) -> Void) {
        addInvocation(.m_methodWithClosures__success_function_2(Parameter<((Scalar,Scalar) -> Scalar)?>.value(`function`)))
		let perform = methodPerformValue(.m_methodWithClosures__success_function_2(Parameter<((Scalar,Scalar) -> Scalar)?>.value(`function`))) as? (((Scalar,Scalar) -> Scalar)?) -> Void
		perform?(`function`)
		var __value: (Int) -> Void
		do {
		    __value = try methodReturnValue(.m_methodWithClosures__success_function_2(Parameter<((Scalar,Scalar) -> Scalar)?>.value(`function`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodWithClosures(success function: ((Scalar,Scalar) -> Scalar)?). Use given")
			Failure("Stub return value not specified for methodWithClosures(success function: ((Scalar,Scalar) -> Scalar)?). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_serviceName
        case m_getPoint__from_point(Parameter<Point>)
        case m_getPoint__from_tuple(Parameter<(Float,Float)>)
        case m_similarMethodThatDiffersOnType__value_1(Parameter<Float>)
        case m_similarMethodThatDiffersOnType__value_2(Parameter<Point>)
        case m_methodWithTypedef__scalar(Parameter<Scalar>)
        case m_methodWithClosures__success_function_1(Parameter<LinearFunction>)
        case m_methodWithClosures__success_function_2(Parameter<((Scalar,Scalar) -> Scalar)?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_serviceName, .m_serviceName):
                return true 
            case (.m_getPoint__from_point(let lhsPoint), .m_getPoint__from_point(let rhsPoint)):
                guard Parameter.compare(lhs: lhsPoint, rhs: rhsPoint, with: matcher) else { return false } 
                return true 
            case (.m_getPoint__from_tuple(let lhsTuple), .m_getPoint__from_tuple(let rhsTuple)):
                guard Parameter.compare(lhs: lhsTuple, rhs: rhsTuple, with: matcher) else { return false } 
                return true 
            case (.m_similarMethodThatDiffersOnType__value_1(let lhsValue), .m_similarMethodThatDiffersOnType__value_1(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            case (.m_similarMethodThatDiffersOnType__value_2(let lhsValue), .m_similarMethodThatDiffersOnType__value_2(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            case (.m_methodWithTypedef__scalar(let lhsScalar), .m_methodWithTypedef__scalar(let rhsScalar)):
                guard Parameter.compare(lhs: lhsScalar, rhs: rhsScalar, with: matcher) else { return false } 
                return true 
            case (.m_methodWithClosures__success_function_1(let lhsFunction), .m_methodWithClosures__success_function_1(let rhsFunction)):
                guard Parameter.compare(lhs: lhsFunction, rhs: rhsFunction, with: matcher) else { return false } 
                return true 
            case (.m_methodWithClosures__success_function_2(let lhsFunction), .m_methodWithClosures__success_function_2(let rhsFunction)):
                guard Parameter.compare(lhs: lhsFunction, rhs: rhsFunction, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_serviceName: return 0
            case let .m_getPoint__from_point(p0): return p0.intValue
            case let .m_getPoint__from_tuple(p0): return p0.intValue
            case let .m_similarMethodThatDiffersOnType__value_1(p0): return p0.intValue
            case let .m_similarMethodThatDiffersOnType__value_2(p0): return p0.intValue
            case let .m_methodWithTypedef__scalar(p0): return p0.intValue
            case let .m_methodWithClosures__success_function_1(p0): return p0.intValue
            case let .m_methodWithClosures__success_function_2(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func serviceName(willReturn: String...) -> MethodStub {
            return Given(method: .m_serviceName, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getPoint(from point: Parameter<Point>, willReturn: Point...) -> MethodStub {
            return Given(method: .m_getPoint__from_point(`point`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getPoint(from tuple: Parameter<(Float,Float)>, willReturn: Point...) -> MethodStub {
            return Given(method: .m_getPoint__from_tuple(`tuple`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func similarMethodThatDiffersOnType(_ value: Parameter<Float>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_similarMethodThatDiffersOnType__value_1(`value`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func similarMethodThatDiffersOnType(_ value: Parameter<Point>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_similarMethodThatDiffersOnType__value_2(`value`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithClosures(success function: Parameter<LinearFunction>, willReturn: ClosureFabric...) -> MethodStub {
            return Given(method: .m_methodWithClosures__success_function_1(`function`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodWithClosures(success function: Parameter<((Scalar,Scalar) -> Scalar)?>, willReturn: (Int) -> Void...) -> MethodStub {
            return Given(method: .m_methodWithClosures__success_function_2(`function`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func serviceName(willProduce: (Stubber<String>) -> Void) -> MethodStub {
            let willReturn: [String] = []
			let given: Given = { return Given(method: .m_serviceName, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String).self)
			willProduce(stubber)
			return given
        }
        public static func getPoint(from point: Parameter<Point>, willProduce: (Stubber<Point>) -> Void) -> MethodStub {
            let willReturn: [Point] = []
			let given: Given = { return Given(method: .m_getPoint__from_point(`point`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Point).self)
			willProduce(stubber)
			return given
        }
        public static func getPoint(from tuple: Parameter<(Float,Float)>, willProduce: (Stubber<Point>) -> Void) -> MethodStub {
            let willReturn: [Point] = []
			let given: Given = { return Given(method: .m_getPoint__from_tuple(`tuple`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Point).self)
			willProduce(stubber)
			return given
        }
        public static func similarMethodThatDiffersOnType(_ value: Parameter<Float>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_similarMethodThatDiffersOnType__value_1(`value`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        public static func similarMethodThatDiffersOnType(_ value: Parameter<Point>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_similarMethodThatDiffersOnType__value_2(`value`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithClosures(success function: Parameter<LinearFunction>, willProduce: (Stubber<ClosureFabric>) -> Void) -> MethodStub {
            let willReturn: [ClosureFabric] = []
			let given: Given = { return Given(method: .m_methodWithClosures__success_function_1(`function`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (ClosureFabric).self)
			willProduce(stubber)
			return given
        }
        public static func methodWithClosures(success function: Parameter<((Scalar,Scalar) -> Scalar)?>, willProduce: (Stubber<(Int) -> Void>) -> Void) -> MethodStub {
            let willReturn: [(Int) -> Void] = []
			let given: Given = { return Given(method: .m_methodWithClosures__success_function_2(`function`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: ((Int) -> Void).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func serviceName() -> Verify { return Verify(method: .m_serviceName)}
        public static func getPoint(from point: Parameter<Point>) -> Verify { return Verify(method: .m_getPoint__from_point(`point`))}
        public static func getPoint(from tuple: Parameter<(Float,Float)>) -> Verify { return Verify(method: .m_getPoint__from_tuple(`tuple`))}
        public static func similarMethodThatDiffersOnType(_ value: Parameter<Float>) -> Verify { return Verify(method: .m_similarMethodThatDiffersOnType__value_1(`value`))}
        public static func similarMethodThatDiffersOnType(_ value: Parameter<Point>) -> Verify { return Verify(method: .m_similarMethodThatDiffersOnType__value_2(`value`))}
        public static func methodWithTypedef(_ scalar: Parameter<Scalar>) -> Verify { return Verify(method: .m_methodWithTypedef__scalar(`scalar`))}
        public static func methodWithClosures(success function: Parameter<LinearFunction>) -> Verify { return Verify(method: .m_methodWithClosures__success_function_1(`function`))}
        public static func methodWithClosures(success function: Parameter<((Scalar,Scalar) -> Scalar)?>) -> Verify { return Verify(method: .m_methodWithClosures__success_function_2(`function`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func serviceName(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_serviceName, performs: perform)
        }
        public static func getPoint(from point: Parameter<Point>, perform: @escaping (Point) -> Void) -> Perform {
            return Perform(method: .m_getPoint__from_point(`point`), performs: perform)
        }
        public static func getPoint(from tuple: Parameter<(Float,Float)>, perform: @escaping ((Float,Float)) -> Void) -> Perform {
            return Perform(method: .m_getPoint__from_tuple(`tuple`), performs: perform)
        }
        public static func similarMethodThatDiffersOnType(_ value: Parameter<Float>, perform: @escaping (Float) -> Void) -> Perform {
            return Perform(method: .m_similarMethodThatDiffersOnType__value_1(`value`), performs: perform)
        }
        public static func similarMethodThatDiffersOnType(_ value: Parameter<Point>, perform: @escaping (Point) -> Void) -> Perform {
            return Perform(method: .m_similarMethodThatDiffersOnType__value_2(`value`), performs: perform)
        }
        public static func methodWithTypedef(_ scalar: Parameter<Scalar>, perform: @escaping (Scalar) -> Void) -> Perform {
            return Perform(method: .m_methodWithTypedef__scalar(`scalar`), performs: perform)
        }
        public static func methodWithClosures(success function: Parameter<LinearFunction>, perform: @escaping (LinearFunction) -> Void) -> Perform {
            return Perform(method: .m_methodWithClosures__success_function_1(`function`), performs: perform)
        }
        public static func methodWithClosures(success function: Parameter<((Scalar,Scalar) -> Scalar)?>, perform: @escaping (((Scalar,Scalar) -> Scalar)?) -> Void) -> Perform {
            return Perform(method: .m_methodWithClosures__success_function_2(`function`), performs: perform)
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

// MARK: - SelfConstrainedProtocol
open class SelfConstrainedProtocolMock: SelfConstrainedProtocol, Mock, StaticMock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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
    static var matcher: Matcher = Matcher.default
    static var stubbingPolicy: StubbingPolicy = .wrap
    static var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    public typealias StaticPropertyStub = StaticGiven
    public typealias StaticMethodStub = StaticGiven
    public static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }





    public static func construct(param value: Int) -> Self {
        func _wrapped<__Self__>() -> __Self__ {
		addInvocation(.sm_construct__param_value(Parameter<Int>.value(`value`)))
		let perform = methodPerformValue(.sm_construct__param_value(Parameter<Int>.value(`value`))) as? (Int) -> Void
		perform?(`value`)
		var __value: __Self__
		do {
		    __value = try methodReturnValue(.sm_construct__param_value(Parameter<Int>.value(`value`))).casted()
		} catch {
			Failure("Stub return value not specified for construct(param value: Int). Use given")
		}
		return __value
		}
		return _wrapped()
    }

    open func methodReturningSelf() -> Self {
        func _wrapped<__Self__>() -> __Self__ {
		addInvocation(.m_methodReturningSelf)
		let perform = methodPerformValue(.m_methodReturningSelf) as? () -> Void
		perform?()
		var __value: __Self__
		do {
		    __value = try methodReturnValue(.m_methodReturningSelf).casted()
		} catch {
			onFatalFailure("Stub return value not specified for methodReturningSelf(). Use given")
			Failure("Stub return value not specified for methodReturningSelf(). Use given")
		}
		return __value
		}
		return _wrapped()
    }

    open func compare(with other: SelfConstrainedProtocolMock) -> Bool {
        addInvocation(.m_compare__with_other(Parameter<SelfConstrainedProtocolMock>.value(`other`)))
		let perform = methodPerformValue(.m_compare__with_other(Parameter<SelfConstrainedProtocolMock>.value(`other`))) as? (SelfConstrainedProtocolMock) -> Void
		perform?(`other`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_compare__with_other(Parameter<SelfConstrainedProtocolMock>.value(`other`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for compare(with other: SelfConstrainedProtocolMock). Use given")
			Failure("Stub return value not specified for compare(with other: SelfConstrainedProtocolMock). Use given")
		}
		return __value
    }

    open func genericMethodWithNestedSelf<T>(param: Int, second: T, other: (SelfConstrainedProtocolMock,SelfConstrainedProtocolMock)) -> Self {
        func _wrapped<__Self__>() -> __Self__ {
		addInvocation(.m_genericMethodWithNestedSelf__param_paramsecond_secondother_other(Parameter<Int>.value(`param`), Parameter<T>.value(`second`).wrapAsGeneric(), Parameter<(SelfConstrainedProtocolMock,SelfConstrainedProtocolMock)>.value(`other`)))
		let perform = methodPerformValue(.m_genericMethodWithNestedSelf__param_paramsecond_secondother_other(Parameter<Int>.value(`param`), Parameter<T>.value(`second`).wrapAsGeneric(), Parameter<(SelfConstrainedProtocolMock,SelfConstrainedProtocolMock)>.value(`other`))) as? (Int, T, (SelfConstrainedProtocolMock,SelfConstrainedProtocolMock)) -> Void
		perform?(`param`, `second`, `other`)
		var __value: __Self__
		do {
		    __value = try methodReturnValue(.m_genericMethodWithNestedSelf__param_paramsecond_secondother_other(Parameter<Int>.value(`param`), Parameter<T>.value(`second`).wrapAsGeneric(), Parameter<(SelfConstrainedProtocolMock,SelfConstrainedProtocolMock)>.value(`other`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for genericMethodWithNestedSelf<T>(param: Int, second: T, other: (SelfConstrainedProtocolMock,SelfConstrainedProtocolMock)). Use given")
			Failure("Stub return value not specified for genericMethodWithNestedSelf<T>(param: Int, second: T, other: (SelfConstrainedProtocolMock,SelfConstrainedProtocolMock)). Use given")
		}
		return __value
		}
		return _wrapped()
    }

    open func configure(with secret: String) throws -> Self {
        func _wrapped<__Self__>() throws -> __Self__ {
		addInvocation(.m_configure__with_secret(Parameter<String>.value(`secret`)))
		let perform = methodPerformValue(.m_configure__with_secret(Parameter<String>.value(`secret`))) as? (String) -> Void
		perform?(`secret`)
		var __value: __Self__
		do {
		    __value = try methodReturnValue(.m_configure__with_secret(Parameter<String>.value(`secret`))).casted()
		} catch MockError.notStubed {
			onFatalFailure("Stub return value not specified for configure(with secret: String). Use given")
			Failure("Stub return value not specified for configure(with secret: String). Use given")
		} catch {
		    throw error
		}
		return __value
		}
		return try _wrapped()
    }

    fileprivate enum StaticMethodType {
        case sm_construct__param_value(Parameter<Int>)

        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.sm_construct__param_value(let lhsValue), .sm_construct__param_value(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            }
        }

        func intValue() -> Int {
            switch self {
                case let .sm_construct__param_value(p0): return p0.intValue
            }
        }
    }

    open class StaticGiven: StubbedMethod {
        fileprivate var method: StaticMethodType

        private init(method: StaticMethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func construct(param value: Parameter<Int>, willReturn: SelfConstrainedProtocolMock...) -> StaticMethodStub {
            return StaticGiven(method: .sm_construct__param_value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func construct(param value: Parameter<Int>, willProduce: (Stubber<SelfConstrainedProtocolMock>) -> Void) -> StaticMethodStub {
            let willReturn: [SelfConstrainedProtocolMock] = []
			let given: StaticGiven = { return StaticGiven(method: .sm_construct__param_value(`value`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (SelfConstrainedProtocolMock).self)
			willProduce(stubber)
			return given
        }
    }

    public struct StaticVerify {
        fileprivate var method: StaticMethodType

        public static func construct(param value: Parameter<Int>) -> StaticVerify { return StaticVerify(method: .sm_construct__param_value(`value`))}
    }

    public struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        public static func construct(param value: Parameter<Int>, perform: @escaping (Int) -> Void) -> StaticPerform {
            return StaticPerform(method: .sm_construct__param_value(`value`), performs: perform)
        }
    }

    
    fileprivate enum MethodType {
        case m_methodReturningSelf
        case m_compare__with_other(Parameter<SelfConstrainedProtocolMock>)
        case m_genericMethodWithNestedSelf__param_paramsecond_secondother_other(Parameter<Int>, Parameter<GenericAttribute>, Parameter<(SelfConstrainedProtocolMock,SelfConstrainedProtocolMock)>)
        case m_configure__with_secret(Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_methodReturningSelf, .m_methodReturningSelf):
                return true 
            case (.m_compare__with_other(let lhsOther), .m_compare__with_other(let rhsOther)):
                guard Parameter.compare(lhs: lhsOther, rhs: rhsOther, with: matcher) else { return false } 
                return true 
            case (.m_genericMethodWithNestedSelf__param_paramsecond_secondother_other(let lhsParam, let lhsSecond, let lhsOther), .m_genericMethodWithNestedSelf__param_paramsecond_secondother_other(let rhsParam, let rhsSecond, let rhsOther)):
                guard Parameter.compare(lhs: lhsParam, rhs: rhsParam, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsSecond, rhs: rhsSecond, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsOther, rhs: rhsOther, with: matcher) else { return false } 
                return true 
            case (.m_configure__with_secret(let lhsSecret), .m_configure__with_secret(let rhsSecret)):
                guard Parameter.compare(lhs: lhsSecret, rhs: rhsSecret, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_methodReturningSelf: return 0
            case let .m_compare__with_other(p0): return p0.intValue
            case let .m_genericMethodWithNestedSelf__param_paramsecond_secondother_other(p0, p1, p2): return p0.intValue + p1.intValue + p2.intValue
            case let .m_configure__with_secret(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func methodReturningSelf(willReturn: SelfConstrainedProtocolMock...) -> MethodStub {
            return Given(method: .m_methodReturningSelf, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func compare(with other: Parameter<SelfConstrainedProtocolMock>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_compare__with_other(`other`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func genericMethodWithNestedSelf<T>(param: Parameter<Int>, second: Parameter<T>, other: Parameter<(SelfConstrainedProtocolMock,SelfConstrainedProtocolMock)>, willReturn: SelfConstrainedProtocolMock...) -> MethodStub {
            return Given(method: .m_genericMethodWithNestedSelf__param_paramsecond_secondother_other(`param`, `second`.wrapAsGeneric(), `other`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func configure(with secret: Parameter<String>, willReturn: SelfConstrainedProtocolMock...) -> MethodStub {
            return Given(method: .m_configure__with_secret(`secret`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func methodReturningSelf(willProduce: (Stubber<SelfConstrainedProtocolMock>) -> Void) -> MethodStub {
            let willReturn: [SelfConstrainedProtocolMock] = []
			let given: Given = { return Given(method: .m_methodReturningSelf, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (SelfConstrainedProtocolMock).self)
			willProduce(stubber)
			return given
        }
        public static func compare(with other: Parameter<SelfConstrainedProtocolMock>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_compare__with_other(`other`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
        public static func genericMethodWithNestedSelf<T>(param: Parameter<Int>, second: Parameter<T>, other: Parameter<(SelfConstrainedProtocolMock,SelfConstrainedProtocolMock)>, willProduce: (Stubber<SelfConstrainedProtocolMock>) -> Void) -> MethodStub {
            let willReturn: [SelfConstrainedProtocolMock] = []
			let given: Given = { return Given(method: .m_genericMethodWithNestedSelf__param_paramsecond_secondother_other(`param`, `second`.wrapAsGeneric(), `other`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (SelfConstrainedProtocolMock).self)
			willProduce(stubber)
			return given
        }
        public static func configure(with secret: Parameter<String>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_configure__with_secret(`secret`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func configure(with secret: Parameter<String>, willProduce: (StubberThrows<SelfConstrainedProtocolMock>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_configure__with_secret(`secret`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (SelfConstrainedProtocolMock).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func methodReturningSelf() -> Verify { return Verify(method: .m_methodReturningSelf)}
        public static func compare(with other: Parameter<SelfConstrainedProtocolMock>) -> Verify { return Verify(method: .m_compare__with_other(`other`))}
        public static func genericMethodWithNestedSelf<T>(param: Parameter<Int>, second: Parameter<T>, other: Parameter<(SelfConstrainedProtocolMock,SelfConstrainedProtocolMock)>) -> Verify { return Verify(method: .m_genericMethodWithNestedSelf__param_paramsecond_secondother_other(`param`, `second`.wrapAsGeneric(), `other`))}
        public static func configure(with secret: Parameter<String>) -> Verify { return Verify(method: .m_configure__with_secret(`secret`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func methodReturningSelf(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_methodReturningSelf, performs: perform)
        }
        public static func compare(with other: Parameter<SelfConstrainedProtocolMock>, perform: @escaping (SelfConstrainedProtocolMock) -> Void) -> Perform {
            return Perform(method: .m_compare__with_other(`other`), performs: perform)
        }
        public static func genericMethodWithNestedSelf<T>(param: Parameter<Int>, second: Parameter<T>, other: Parameter<(SelfConstrainedProtocolMock,SelfConstrainedProtocolMock)>, perform: @escaping (Int, T, (SelfConstrainedProtocolMock,SelfConstrainedProtocolMock)) -> Void) -> Perform {
            return Perform(method: .m_genericMethodWithNestedSelf__param_paramsecond_secondother_other(`param`, `second`.wrapAsGeneric(), `other`), performs: perform)
        }
        public static func configure(with secret: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_configure__with_secret(`secret`), performs: perform)
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

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }
    static private func methodReturnValue(_ method: StaticMethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }
    static private func givenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            Failure(message)
        }
    }
    static private func optionalGivenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
}

// MARK: - ShouldAllowNoStubDefined
open class ShouldAllowNoStubDefinedMock: ShouldAllowNoStubDefined, Mock, StaticMock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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
    static var matcher: Matcher = Matcher.default
    static var stubbingPolicy: StubbingPolicy = .wrap
    static var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst
    static private var invocations: [StaticMethodType] = []
    static private var methodReturnValues: [StaticGiven] = []
    static private var methodPerformValues: [StaticPerform] = []
    public typealias StaticPropertyStub = StaticGiven
    public typealias StaticMethodStub = StaticGiven
    public static func clear() {
        invocations = []
        methodReturnValues = []
        methodPerformValues = []
    }

    public var property: Int? {
		get {	invocations.append(.p_property_get); return __p_property ?? optionalGivenGetterValue(.p_property_get, "ShouldAllowNoStubDefinedMock - stub value for property was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_property = newValue }
	}
	private var __p_property: (Int)?


    public static var property: Int? {
		get {	ShouldAllowNoStubDefinedMock.invocations.append(.p_property_get); return ShouldAllowNoStubDefinedMock.__p_property ?? optionalGivenGetterValue(.p_property_get, "ShouldAllowNoStubDefinedMock - stub value for property was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	ShouldAllowNoStubDefinedMock.__p_property = newValue }
	}
	private static var __p_property: (Int)?




    public static func voidMethod(_ key: String) {
        addInvocation(.sm_voidMethod__key(Parameter<String>.value(`key`)))
		let perform = methodPerformValue(.sm_voidMethod__key(Parameter<String>.value(`key`))) as? (String) -> Void
		perform?(`key`)
    }

    public static func throwingVoidMethod(_ key: String) throws {
        addInvocation(.sm_throwingVoidMethod__key(Parameter<String>.value(`key`)))
		let perform = methodPerformValue(.sm_throwingVoidMethod__key(Parameter<String>.value(`key`))) as? (String) -> Void
		perform?(`key`)
		do {
		    _ = try methodReturnValue(.sm_throwingVoidMethod__key(Parameter<String>.value(`key`))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }

    public static func optionalMethod(_ key: String) -> Int? {
        addInvocation(.sm_optionalMethod__key(Parameter<String>.value(`key`)))
		let perform = methodPerformValue(.sm_optionalMethod__key(Parameter<String>.value(`key`))) as? (String) -> Void
		perform?(`key`)
		var __value: Int? = nil
		do {
		    __value = try methodReturnValue(.sm_optionalMethod__key(Parameter<String>.value(`key`))).casted()
		} catch {
			// do nothing
		}
		return __value
    }

    public static func optionalThrowingMethod(_ key: String) -> Int? {
        addInvocation(.sm_optionalThrowingMethod__key(Parameter<String>.value(`key`)))
		let perform = methodPerformValue(.sm_optionalThrowingMethod__key(Parameter<String>.value(`key`))) as? (String) -> Void
		perform?(`key`)
		var __value: Int? = nil
		do {
		    __value = try methodReturnValue(.sm_optionalThrowingMethod__key(Parameter<String>.value(`key`))).casted()
		} catch {
			// do nothing
		}
		return __value
    }

    open func voidMethod(_ key: String) {
        addInvocation(.m_voidMethod__key(Parameter<String>.value(`key`)))
		let perform = methodPerformValue(.m_voidMethod__key(Parameter<String>.value(`key`))) as? (String) -> Void
		perform?(`key`)
    }

    open func throwingVoidMethod(_ key: String) throws {
        addInvocation(.m_throwingVoidMethod__key(Parameter<String>.value(`key`)))
		let perform = methodPerformValue(.m_throwingVoidMethod__key(Parameter<String>.value(`key`))) as? (String) -> Void
		perform?(`key`)
		do {
		    _ = try methodReturnValue(.m_throwingVoidMethod__key(Parameter<String>.value(`key`))).casted() as Void
		} catch MockError.notStubed {
			// do nothing
		} catch {
		    throw error
		}
    }

    open func optionalMethod(_ key: String) -> Int? {
        addInvocation(.m_optionalMethod__key(Parameter<String>.value(`key`)))
		let perform = methodPerformValue(.m_optionalMethod__key(Parameter<String>.value(`key`))) as? (String) -> Void
		perform?(`key`)
		var __value: Int? = nil
		do {
		    __value = try methodReturnValue(.m_optionalMethod__key(Parameter<String>.value(`key`))).casted()
		} catch {
			// do nothing
		}
		return __value
    }

    open func optionalThrowingMethod(_ key: String) -> Int? {
        addInvocation(.m_optionalThrowingMethod__key(Parameter<String>.value(`key`)))
		let perform = methodPerformValue(.m_optionalThrowingMethod__key(Parameter<String>.value(`key`))) as? (String) -> Void
		perform?(`key`)
		var __value: Int? = nil
		do {
		    __value = try methodReturnValue(.m_optionalThrowingMethod__key(Parameter<String>.value(`key`))).casted()
		} catch {
			// do nothing
		}
		return __value
    }

    public subscript (_ x: Int) -> Int? {
		get {
			addInvocation(.subscript_get_x(Parameter<Int>.value(`x`)))
			do {
				return try methodReturnValue(.subscript_get_x(Parameter<Int>.value(`x`))).casted()
			} catch {
				return nil
			}
		}
	}

    fileprivate enum StaticMethodType {
        case sm_voidMethod__key(Parameter<String>)
        case sm_throwingVoidMethod__key(Parameter<String>)
        case sm_optionalMethod__key(Parameter<String>)
        case sm_optionalThrowingMethod__key(Parameter<String>)
        case p_property_get

        static func compareParameters(lhs: StaticMethodType, rhs: StaticMethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.sm_voidMethod__key(let lhsKey), .sm_voidMethod__key(let rhsKey)):
                guard Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher) else { return false } 
                return true 
            case (.sm_throwingVoidMethod__key(let lhsKey), .sm_throwingVoidMethod__key(let rhsKey)):
                guard Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher) else { return false } 
                return true 
            case (.sm_optionalMethod__key(let lhsKey), .sm_optionalMethod__key(let rhsKey)):
                guard Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher) else { return false } 
                return true 
            case (.sm_optionalThrowingMethod__key(let lhsKey), .sm_optionalThrowingMethod__key(let rhsKey)):
                guard Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher) else { return false } 
                return true 
            case (.p_property_get,.p_property_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
                case let .sm_voidMethod__key(p0): return p0.intValue
                case let .sm_throwingVoidMethod__key(p0): return p0.intValue
                case let .sm_optionalMethod__key(p0): return p0.intValue
                case let .sm_optionalThrowingMethod__key(p0): return p0.intValue
                case .p_property_get: return 0
            }
        }
    }

    open class StaticGiven: StubbedMethod {
        fileprivate var method: StaticMethodType

        private init(method: StaticMethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func property(getter defaultValue: Int?...) -> StaticPropertyStub {
            return StaticGiven(method: .p_property_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func optionalMethod(_ key: Parameter<String>, willReturn: Int?...) -> StaticMethodStub {
            return StaticGiven(method: .sm_optionalMethod__key(`key`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func optionalThrowingMethod(_ key: Parameter<String>, willReturn: Int?...) -> StaticMethodStub {
            return StaticGiven(method: .sm_optionalThrowingMethod__key(`key`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func optionalMethod(_ key: Parameter<String>, willProduce: (Stubber<Int?>) -> Void) -> StaticMethodStub {
            let willReturn: [Int?] = []
			let given: StaticGiven = { return StaticGiven(method: .sm_optionalMethod__key(`key`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int?).self)
			willProduce(stubber)
			return given
        }
        public static func optionalThrowingMethod(_ key: Parameter<String>, willProduce: (Stubber<Int?>) -> Void) -> StaticMethodStub {
            let willReturn: [Int?] = []
			let given: StaticGiven = { return StaticGiven(method: .sm_optionalThrowingMethod__key(`key`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int?).self)
			willProduce(stubber)
			return given
        }
        public static func throwingVoidMethod(_ key: Parameter<String>, willThrow: Error...) -> StaticMethodStub {
            return StaticGiven(method: .sm_throwingVoidMethod__key(`key`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func throwingVoidMethod(_ key: Parameter<String>, willProduce: (StubberThrows<Void>) -> Void) -> StaticMethodStub {
            let willThrow: [Error] = []
			let given: StaticGiven = { return StaticGiven(method: .sm_throwingVoidMethod__key(`key`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
    }

    public struct StaticVerify {
        fileprivate var method: StaticMethodType

        public static func voidMethod(_ key: Parameter<String>) -> StaticVerify { return StaticVerify(method: .sm_voidMethod__key(`key`))}
        public static func throwingVoidMethod(_ key: Parameter<String>) -> StaticVerify { return StaticVerify(method: .sm_throwingVoidMethod__key(`key`))}
        public static func optionalMethod(_ key: Parameter<String>) -> StaticVerify { return StaticVerify(method: .sm_optionalMethod__key(`key`))}
        public static func optionalThrowingMethod(_ key: Parameter<String>) -> StaticVerify { return StaticVerify(method: .sm_optionalThrowingMethod__key(`key`))}
        public static var property: StaticVerify { return StaticVerify(method: .p_property_get) }
    }

    public struct StaticPerform {
        fileprivate var method: StaticMethodType
        var performs: Any

        public static func voidMethod(_ key: Parameter<String>, perform: @escaping (String) -> Void) -> StaticPerform {
            return StaticPerform(method: .sm_voidMethod__key(`key`), performs: perform)
        }
        public static func throwingVoidMethod(_ key: Parameter<String>, perform: @escaping (String) -> Void) -> StaticPerform {
            return StaticPerform(method: .sm_throwingVoidMethod__key(`key`), performs: perform)
        }
        public static func optionalMethod(_ key: Parameter<String>, perform: @escaping (String) -> Void) -> StaticPerform {
            return StaticPerform(method: .sm_optionalMethod__key(`key`), performs: perform)
        }
        public static func optionalThrowingMethod(_ key: Parameter<String>, perform: @escaping (String) -> Void) -> StaticPerform {
            return StaticPerform(method: .sm_optionalThrowingMethod__key(`key`), performs: perform)
        }
    }

    
    fileprivate enum MethodType {
        case m_voidMethod__key(Parameter<String>)
        case m_throwingVoidMethod__key(Parameter<String>)
        case m_optionalMethod__key(Parameter<String>)
        case m_optionalThrowingMethod__key(Parameter<String>)
        case p_property_get
        case subscript_get_x(Parameter<Int>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_voidMethod__key(let lhsKey), .m_voidMethod__key(let rhsKey)):
                guard Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher) else { return false } 
                return true 
            case (.m_throwingVoidMethod__key(let lhsKey), .m_throwingVoidMethod__key(let rhsKey)):
                guard Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher) else { return false } 
                return true 
            case (.m_optionalMethod__key(let lhsKey), .m_optionalMethod__key(let rhsKey)):
                guard Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher) else { return false } 
                return true 
            case (.m_optionalThrowingMethod__key(let lhsKey), .m_optionalThrowingMethod__key(let rhsKey)):
                guard Parameter.compare(lhs: lhsKey, rhs: rhsKey, with: matcher) else { return false } 
                return true 
            case (.p_property_get,.p_property_get): return true
            case (let .subscript_get_x(lhsX), let .subscript_get_x(rhsX)):
				guard Parameter.compare(lhs: lhsX, rhs: rhsX, with: matcher) else { return false }
				return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_voidMethod__key(p0): return p0.intValue
            case let .m_throwingVoidMethod__key(p0): return p0.intValue
            case let .m_optionalMethod__key(p0): return p0.intValue
            case let .m_optionalThrowingMethod__key(p0): return p0.intValue
            case .p_property_get: return 0
            case let .subscript_get_x(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func property(getter defaultValue: Int?...) -> PropertyStub {
            return Given(method: .p_property_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func optionalMethod(_ key: Parameter<String>, willReturn: Int?...) -> MethodStub {
            return Given(method: .m_optionalMethod__key(`key`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func optionalThrowingMethod(_ key: Parameter<String>, willReturn: Int?...) -> MethodStub {
            return Given(method: .m_optionalThrowingMethod__key(`key`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func optionalMethod(_ key: Parameter<String>, willProduce: (Stubber<Int?>) -> Void) -> MethodStub {
            let willReturn: [Int?] = []
			let given: Given = { return Given(method: .m_optionalMethod__key(`key`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int?).self)
			willProduce(stubber)
			return given
        }
        public static func optionalThrowingMethod(_ key: Parameter<String>, willProduce: (Stubber<Int?>) -> Void) -> MethodStub {
            let willReturn: [Int?] = []
			let given: Given = { return Given(method: .m_optionalThrowingMethod__key(`key`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int?).self)
			willProduce(stubber)
			return given
        }
        public static func `subscript`(_ x: Parameter<Int>, willReturn: Int?...) -> SubscriptStub {
            return Given(method: .subscript_get_x(`x`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func throwingVoidMethod(_ key: Parameter<String>, willThrow: Error...) -> MethodStub {
            return Given(method: .m_throwingVoidMethod__key(`key`), products: willThrow.map({ StubProduct.throw($0) }))
        }
        public static func throwingVoidMethod(_ key: Parameter<String>, willProduce: (StubberThrows<Void>) -> Void) -> MethodStub {
            let willThrow: [Error] = []
			let given: Given = { return Given(method: .m_throwingVoidMethod__key(`key`), products: willThrow.map({ StubProduct.throw($0) })) }()
			let stubber = given.stubThrows(for: (Void).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func voidMethod(_ key: Parameter<String>) -> Verify { return Verify(method: .m_voidMethod__key(`key`))}
        public static func throwingVoidMethod(_ key: Parameter<String>) -> Verify { return Verify(method: .m_throwingVoidMethod__key(`key`))}
        public static func optionalMethod(_ key: Parameter<String>) -> Verify { return Verify(method: .m_optionalMethod__key(`key`))}
        public static func optionalThrowingMethod(_ key: Parameter<String>) -> Verify { return Verify(method: .m_optionalThrowingMethod__key(`key`))}
        public static var property: Verify { return Verify(method: .p_property_get) }
        public static func `subscript`(_ x: Parameter<Int>) -> Verify { return Verify(method: .subscript_get_x(`x`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func voidMethod(_ key: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_voidMethod__key(`key`), performs: perform)
        }
        public static func throwingVoidMethod(_ key: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_throwingVoidMethod__key(`key`), performs: perform)
        }
        public static func optionalMethod(_ key: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_optionalMethod__key(`key`), performs: perform)
        }
        public static func optionalThrowingMethod(_ key: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_optionalThrowingMethod__key(`key`), performs: perform)
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

    static public func given(_ method: StaticGiven) {
        methodReturnValues.append(method)
    }

    static public func perform(_ method: StaticPerform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    static public func verify(_ method: StaticVerify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let invocations = matchingCalls(method.method)
        MockyAssert(count.matches(invocations.count), "Expected: \(count) invocations of `\(method.method)`, but was: \(invocations.count)", file: file, line: line)
    }

    static private func addInvocation(_ call: StaticMethodType) {
        invocations.append(call)
    }
    static private func methodReturnValue(_ method: StaticMethodType) throws -> StubProduct {
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    static private func methodPerformValue(_ method: StaticMethodType) -> Any? {
        let matched = methodPerformValues.reversed().first { StaticMethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher) }
        return matched?.performs
    }
    static private func matchingCalls(_ method: StaticMethodType) -> [StaticMethodType] {
        return invocations.filter { StaticMethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher) }
    }
    static private func matchingCalls(_ method: StaticVerify) -> Int {
        return matchingCalls(method.method).count
    }
    static private func givenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            Failure(message)
        }
    }
    static private func optionalGivenGetterValue<T>(_ method: StaticMethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
}

// MARK: - SimpleProtocolThatInheritsOtherProtocols
open class SimpleProtocolThatInheritsOtherProtocolsMock: SimpleProtocolThatInheritsOtherProtocols, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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

    public var property: String {
		get {	invocations.append(.p_property_get); return __p_property ?? givenGetterValue(.p_property_get, "SimpleProtocolThatInheritsOtherProtocolsMock - stub value for property was not defined") }
		set {	invocations.append(.p_property_set(.value(newValue))); __p_property = newValue }
	}
	private var __p_property: (String)?

    public var weakProperty: AnyObject! {
		get {	invocations.append(.p_weakProperty_get); return __p_weakProperty ?? optionalGivenGetterValue(.p_weakProperty_get, "SimpleProtocolThatInheritsOtherProtocolsMock - stub value for weakProperty was not defined") }
		set {	invocations.append(.p_weakProperty_set(.value(newValue))); __p_weakProperty = newValue }
	}
	private var __p_weakProperty: (AnyObject)?

    public var propertyGetOnly: String {
		get {	invocations.append(.p_propertyGetOnly_get); return __p_propertyGetOnly ?? givenGetterValue(.p_propertyGetOnly_get, "SimpleProtocolThatInheritsOtherProtocolsMock - stub value for propertyGetOnly was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_propertyGetOnly = newValue }
	}
	private var __p_propertyGetOnly: (String)?

    public var propertyOptional: Int? {
		get {	invocations.append(.p_propertyOptional_get); return __p_propertyOptional ?? optionalGivenGetterValue(.p_propertyOptional_get, "SimpleProtocolThatInheritsOtherProtocolsMock - stub value for propertyOptional was not defined") }
		set {	invocations.append(.p_propertyOptional_set(.value(newValue))); __p_propertyOptional = newValue }
	}
	private var __p_propertyOptional: (Int)?

    public var propertyImplicit: Int! {
		get {	invocations.append(.p_propertyImplicit_get); return __p_propertyImplicit ?? optionalGivenGetterValue(.p_propertyImplicit_get, "SimpleProtocolThatInheritsOtherProtocolsMock - stub value for propertyImplicit was not defined") }
		set {	invocations.append(.p_propertyImplicit_set(.value(newValue))); __p_propertyImplicit = newValue }
	}
	private var __p_propertyImplicit: (Int)?





    open func simpleMethod() {
        addInvocation(.m_simpleMethod)
		let perform = methodPerformValue(.m_simpleMethod) as? () -> Void
		perform?()
    }

    open func simpleMehtodThatReturns() -> Int {
        addInvocation(.m_simpleMehtodThatReturns)
		let perform = methodPerformValue(.m_simpleMehtodThatReturns) as? () -> Void
		perform?()
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_simpleMehtodThatReturns).casted()
		} catch {
			onFatalFailure("Stub return value not specified for simpleMehtodThatReturns(). Use given")
			Failure("Stub return value not specified for simpleMehtodThatReturns(). Use given")
		}
		return __value
    }

    open func simpleMehtodThatReturns(param: String) -> String {
        addInvocation(.m_simpleMehtodThatReturns__param_param(Parameter<String>.value(`param`)))
		let perform = methodPerformValue(.m_simpleMehtodThatReturns__param_param(Parameter<String>.value(`param`))) as? (String) -> Void
		perform?(`param`)
		var __value: String
		do {
		    __value = try methodReturnValue(.m_simpleMehtodThatReturns__param_param(Parameter<String>.value(`param`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for simpleMehtodThatReturns(param: String). Use given")
			Failure("Stub return value not specified for simpleMehtodThatReturns(param: String). Use given")
		}
		return __value
    }

    open func simpleMehtodThatReturns(optionalParam: String?) -> String? {
        addInvocation(.m_simpleMehtodThatReturns__optionalParam_optionalParam(Parameter<String?>.value(`optionalParam`)))
		let perform = methodPerformValue(.m_simpleMehtodThatReturns__optionalParam_optionalParam(Parameter<String?>.value(`optionalParam`))) as? (String?) -> Void
		perform?(`optionalParam`)
		var __value: String? = nil
		do {
		    __value = try methodReturnValue(.m_simpleMehtodThatReturns__optionalParam_optionalParam(Parameter<String?>.value(`optionalParam`))).casted()
		} catch {
			// do nothing
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_simpleMethod
        case m_simpleMehtodThatReturns
        case m_simpleMehtodThatReturns__param_param(Parameter<String>)
        case m_simpleMehtodThatReturns__optionalParam_optionalParam(Parameter<String?>)
        case p_property_get
		case p_property_set(Parameter<String>)
        case p_weakProperty_get
		case p_weakProperty_set(Parameter<AnyObject?>)
        case p_propertyGetOnly_get
        case p_propertyOptional_get
		case p_propertyOptional_set(Parameter<Int?>)
        case p_propertyImplicit_get
		case p_propertyImplicit_set(Parameter<Int?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_simpleMethod, .m_simpleMethod):
                return true 
            case (.m_simpleMehtodThatReturns, .m_simpleMehtodThatReturns):
                return true 
            case (.m_simpleMehtodThatReturns__param_param(let lhsParam), .m_simpleMehtodThatReturns__param_param(let rhsParam)):
                guard Parameter.compare(lhs: lhsParam, rhs: rhsParam, with: matcher) else { return false } 
                return true 
            case (.m_simpleMehtodThatReturns__optionalParam_optionalParam(let lhsOptionalparam), .m_simpleMehtodThatReturns__optionalParam_optionalParam(let rhsOptionalparam)):
                guard Parameter.compare(lhs: lhsOptionalparam, rhs: rhsOptionalparam, with: matcher) else { return false } 
                return true 
            case (.p_property_get,.p_property_get): return true
			case (.p_property_set(let left),.p_property_set(let right)): return Parameter<String>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_weakProperty_get,.p_weakProperty_get): return true
			case (.p_weakProperty_set(let left),.p_weakProperty_set(let right)): return Parameter<AnyObject?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_propertyGetOnly_get,.p_propertyGetOnly_get): return true
            case (.p_propertyOptional_get,.p_propertyOptional_get): return true
			case (.p_propertyOptional_set(let left),.p_propertyOptional_set(let right)): return Parameter<Int?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_propertyImplicit_get,.p_propertyImplicit_get): return true
			case (.p_propertyImplicit_set(let left),.p_propertyImplicit_set(let right)): return Parameter<Int?>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_simpleMethod: return 0
            case .m_simpleMehtodThatReturns: return 0
            case let .m_simpleMehtodThatReturns__param_param(p0): return p0.intValue
            case let .m_simpleMehtodThatReturns__optionalParam_optionalParam(p0): return p0.intValue
            case .p_property_get: return 0
			case .p_property_set(let newValue): return newValue.intValue
            case .p_weakProperty_get: return 0
			case .p_weakProperty_set(let newValue): return newValue.intValue
            case .p_propertyGetOnly_get: return 0
            case .p_propertyOptional_get: return 0
			case .p_propertyOptional_set(let newValue): return newValue.intValue
            case .p_propertyImplicit_get: return 0
			case .p_propertyImplicit_set(let newValue): return newValue.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func property(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_property_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func weakProperty(getter defaultValue: AnyObject?...) -> PropertyStub {
            return Given(method: .p_weakProperty_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func propertyGetOnly(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_propertyGetOnly_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func propertyOptional(getter defaultValue: Int?...) -> PropertyStub {
            return Given(method: .p_propertyOptional_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func propertyImplicit(getter defaultValue: Int?...) -> PropertyStub {
            return Given(method: .p_propertyImplicit_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func simpleMehtodThatReturns(willReturn: Int...) -> MethodStub {
            return Given(method: .m_simpleMehtodThatReturns, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func simpleMehtodThatReturns(param: Parameter<String>, willReturn: String...) -> MethodStub {
            return Given(method: .m_simpleMehtodThatReturns__param_param(`param`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func simpleMehtodThatReturns(optionalParam: Parameter<String?>, willReturn: String?...) -> MethodStub {
            return Given(method: .m_simpleMehtodThatReturns__optionalParam_optionalParam(`optionalParam`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func simpleMehtodThatReturns(willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_simpleMehtodThatReturns, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func simpleMehtodThatReturns(param: Parameter<String>, willProduce: (Stubber<String>) -> Void) -> MethodStub {
            let willReturn: [String] = []
			let given: Given = { return Given(method: .m_simpleMehtodThatReturns__param_param(`param`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String).self)
			willProduce(stubber)
			return given
        }
        public static func simpleMehtodThatReturns(optionalParam: Parameter<String?>, willProduce: (Stubber<String?>) -> Void) -> MethodStub {
            let willReturn: [String?] = []
			let given: Given = { return Given(method: .m_simpleMehtodThatReturns__optionalParam_optionalParam(`optionalParam`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String?).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func simpleMethod() -> Verify { return Verify(method: .m_simpleMethod)}
        public static func simpleMehtodThatReturns() -> Verify { return Verify(method: .m_simpleMehtodThatReturns)}
        public static func simpleMehtodThatReturns(param: Parameter<String>) -> Verify { return Verify(method: .m_simpleMehtodThatReturns__param_param(`param`))}
        public static func simpleMehtodThatReturns(optionalParam: Parameter<String?>) -> Verify { return Verify(method: .m_simpleMehtodThatReturns__optionalParam_optionalParam(`optionalParam`))}
        public static var property: Verify { return Verify(method: .p_property_get) }
		public static func property(set newValue: Parameter<String>) -> Verify { return Verify(method: .p_property_set(newValue)) }
        public static var weakProperty: Verify { return Verify(method: .p_weakProperty_get) }
		public static func weakProperty(set newValue: Parameter<AnyObject?>) -> Verify { return Verify(method: .p_weakProperty_set(newValue)) }
        public static var propertyGetOnly: Verify { return Verify(method: .p_propertyGetOnly_get) }
        public static var propertyOptional: Verify { return Verify(method: .p_propertyOptional_get) }
		public static func propertyOptional(set newValue: Parameter<Int?>) -> Verify { return Verify(method: .p_propertyOptional_set(newValue)) }
        public static var propertyImplicit: Verify { return Verify(method: .p_propertyImplicit_get) }
		public static func propertyImplicit(set newValue: Parameter<Int?>) -> Verify { return Verify(method: .p_propertyImplicit_set(newValue)) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func simpleMethod(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_simpleMethod, performs: perform)
        }
        public static func simpleMehtodThatReturns(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_simpleMehtodThatReturns, performs: perform)
        }
        public static func simpleMehtodThatReturns(param: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_simpleMehtodThatReturns__param_param(`param`), performs: perform)
        }
        public static func simpleMehtodThatReturns(optionalParam: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_simpleMehtodThatReturns__optionalParam_optionalParam(`optionalParam`), performs: perform)
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

// MARK: - SimpleProtocolUsingCollections
open class SimpleProtocolUsingCollectionsMock: SimpleProtocolUsingCollections, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func getArray() -> [Int] {
        addInvocation(.m_getArray)
		let perform = methodPerformValue(.m_getArray) as? () -> Void
		perform?()
		var __value: [Int]
		do {
		    __value = try methodReturnValue(.m_getArray).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getArray(). Use given")
			Failure("Stub return value not specified for getArray(). Use given")
		}
		return __value
    }

    open func map(array: [String], param: Int) -> [Int: String] {
        addInvocation(.m_map__array_arrayparam_param(Parameter<[String]>.value(`array`), Parameter<Int>.value(`param`)))
		let perform = methodPerformValue(.m_map__array_arrayparam_param(Parameter<[String]>.value(`array`), Parameter<Int>.value(`param`))) as? ([String], Int) -> Void
		perform?(`array`, `param`)
		var __value: [Int: String]
		do {
		    __value = try methodReturnValue(.m_map__array_arrayparam_param(Parameter<[String]>.value(`array`), Parameter<Int>.value(`param`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for map(array: [String], param: Int). Use given")
			Failure("Stub return value not specified for map(array: [String], param: Int). Use given")
		}
		return __value
    }

    open func use(dictionary: [Int: String]) -> [Int: String] {
        addInvocation(.m_use__dictionary_dictionary(Parameter<[Int: String]>.value(`dictionary`)))
		let perform = methodPerformValue(.m_use__dictionary_dictionary(Parameter<[Int: String]>.value(`dictionary`))) as? ([Int: String]) -> Void
		perform?(`dictionary`)
		var __value: [Int: String]
		do {
		    __value = try methodReturnValue(.m_use__dictionary_dictionary(Parameter<[Int: String]>.value(`dictionary`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for use(dictionary: [Int: String]). Use given")
			Failure("Stub return value not specified for use(dictionary: [Int: String]). Use given")
		}
		return __value
    }

    open func verify(set: Set<Int>) -> Bool {
        addInvocation(.m_verify__set_set(Parameter<Set<Int>>.value(`set`)))
		let perform = methodPerformValue(.m_verify__set_set(Parameter<Set<Int>>.value(`set`))) as? (Set<Int>) -> Void
		perform?(`set`)
		var __value: Bool
		do {
		    __value = try methodReturnValue(.m_verify__set_set(Parameter<Set<Int>>.value(`set`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for verify(set: Set<Int>). Use given")
			Failure("Stub return value not specified for verify(set: Set<Int>). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getArray
        case m_map__array_arrayparam_param(Parameter<[String]>, Parameter<Int>)
        case m_use__dictionary_dictionary(Parameter<[Int: String]>)
        case m_verify__set_set(Parameter<Set<Int>>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_getArray, .m_getArray):
                return true 
            case (.m_map__array_arrayparam_param(let lhsArray, let lhsParam), .m_map__array_arrayparam_param(let rhsArray, let rhsParam)):
                guard Parameter.compare(lhs: lhsArray, rhs: rhsArray, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsParam, rhs: rhsParam, with: matcher) else { return false } 
                return true 
            case (.m_use__dictionary_dictionary(let lhsDictionary), .m_use__dictionary_dictionary(let rhsDictionary)):
                guard Parameter.compare(lhs: lhsDictionary, rhs: rhsDictionary, with: matcher) else { return false } 
                return true 
            case (.m_verify__set_set(let lhsSet), .m_verify__set_set(let rhsSet)):
                guard Parameter.compare(lhs: lhsSet, rhs: rhsSet, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_getArray: return 0
            case let .m_map__array_arrayparam_param(p0, p1): return p0.intValue + p1.intValue
            case let .m_use__dictionary_dictionary(p0): return p0.intValue
            case let .m_verify__set_set(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getArray(willReturn: [Int]...) -> MethodStub {
            return Given(method: .m_getArray, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func map(array: Parameter<[String]>, param: Parameter<Int>, willReturn: [Int: String]...) -> MethodStub {
            return Given(method: .m_map__array_arrayparam_param(`array`, `param`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func use(dictionary: Parameter<[Int: String]>, willReturn: [Int: String]...) -> MethodStub {
            return Given(method: .m_use__dictionary_dictionary(`dictionary`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func verify(set: Parameter<Set<Int>>, willReturn: Bool...) -> MethodStub {
            return Given(method: .m_verify__set_set(`set`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getArray(willProduce: (Stubber<[Int]>) -> Void) -> MethodStub {
            let willReturn: [[Int]] = []
			let given: Given = { return Given(method: .m_getArray, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: ([Int]).self)
			willProduce(stubber)
			return given
        }
        public static func map(array: Parameter<[String]>, param: Parameter<Int>, willProduce: (Stubber<[Int: String]>) -> Void) -> MethodStub {
            let willReturn: [[Int: String]] = []
			let given: Given = { return Given(method: .m_map__array_arrayparam_param(`array`, `param`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: ([Int: String]).self)
			willProduce(stubber)
			return given
        }
        public static func use(dictionary: Parameter<[Int: String]>, willProduce: (Stubber<[Int: String]>) -> Void) -> MethodStub {
            let willReturn: [[Int: String]] = []
			let given: Given = { return Given(method: .m_use__dictionary_dictionary(`dictionary`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: ([Int: String]).self)
			willProduce(stubber)
			return given
        }
        public static func verify(set: Parameter<Set<Int>>, willProduce: (Stubber<Bool>) -> Void) -> MethodStub {
            let willReturn: [Bool] = []
			let given: Given = { return Given(method: .m_verify__set_set(`set`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Bool).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getArray() -> Verify { return Verify(method: .m_getArray)}
        public static func map(array: Parameter<[String]>, param: Parameter<Int>) -> Verify { return Verify(method: .m_map__array_arrayparam_param(`array`, `param`))}
        public static func use(dictionary: Parameter<[Int: String]>) -> Verify { return Verify(method: .m_use__dictionary_dictionary(`dictionary`))}
        public static func verify(set: Parameter<Set<Int>>) -> Verify { return Verify(method: .m_verify__set_set(`set`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getArray(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getArray, performs: perform)
        }
        public static func map(array: Parameter<[String]>, param: Parameter<Int>, perform: @escaping ([String], Int) -> Void) -> Perform {
            return Perform(method: .m_map__array_arrayparam_param(`array`, `param`), performs: perform)
        }
        public static func use(dictionary: Parameter<[Int: String]>, perform: @escaping ([Int: String]) -> Void) -> Perform {
            return Perform(method: .m_use__dictionary_dictionary(`dictionary`), performs: perform)
        }
        public static func verify(set: Parameter<Set<Int>>, perform: @escaping (Set<Int>) -> Void) -> Perform {
            return Perform(method: .m_verify__set_set(`set`), performs: perform)
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

// MARK: - SimpleProtocolWithBothMethodsAndProperties
open class SimpleProtocolWithBothMethodsAndPropertiesMock: SimpleProtocolWithBothMethodsAndProperties, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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

    public var property: String {
		get {	invocations.append(.p_property_get); return __p_property ?? givenGetterValue(.p_property_get, "SimpleProtocolWithBothMethodsAndPropertiesMock - stub value for property was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_property = newValue }
	}
	private var __p_property: (String)?





    open func simpleMethod() -> String {
        addInvocation(.m_simpleMethod)
		let perform = methodPerformValue(.m_simpleMethod) as? () -> Void
		perform?()
		var __value: String
		do {
		    __value = try methodReturnValue(.m_simpleMethod).casted()
		} catch {
			onFatalFailure("Stub return value not specified for simpleMethod(). Use given")
			Failure("Stub return value not specified for simpleMethod(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_simpleMethod
        case p_property_get

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_simpleMethod, .m_simpleMethod):
                return true 
            case (.p_property_get,.p_property_get): return true
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_simpleMethod: return 0
            case .p_property_get: return 0
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func property(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_property_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

        public static func simpleMethod(willReturn: String...) -> MethodStub {
            return Given(method: .m_simpleMethod, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func simpleMethod(willProduce: (Stubber<String>) -> Void) -> MethodStub {
            let willReturn: [String] = []
			let given: Given = { return Given(method: .m_simpleMethod, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func simpleMethod() -> Verify { return Verify(method: .m_simpleMethod)}
        public static var property: Verify { return Verify(method: .p_property_get) }
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func simpleMethod(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_simpleMethod, performs: perform)
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

// MARK: - SimpleProtocolWithMethods
open class SimpleProtocolWithMethodsMock: SimpleProtocolWithMethods, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func simpleMethod() {
        addInvocation(.m_simpleMethod)
		let perform = methodPerformValue(.m_simpleMethod) as? () -> Void
		perform?()
    }

    open func simpleMehtodThatReturns() -> Int {
        addInvocation(.m_simpleMehtodThatReturns)
		let perform = methodPerformValue(.m_simpleMehtodThatReturns) as? () -> Void
		perform?()
		var __value: Int
		do {
		    __value = try methodReturnValue(.m_simpleMehtodThatReturns).casted()
		} catch {
			onFatalFailure("Stub return value not specified for simpleMehtodThatReturns(). Use given")
			Failure("Stub return value not specified for simpleMehtodThatReturns(). Use given")
		}
		return __value
    }

    open func simpleMehtodThatReturns(param: String) -> String {
        addInvocation(.m_simpleMehtodThatReturns__param_param(Parameter<String>.value(`param`)))
		let perform = methodPerformValue(.m_simpleMehtodThatReturns__param_param(Parameter<String>.value(`param`))) as? (String) -> Void
		perform?(`param`)
		var __value: String
		do {
		    __value = try methodReturnValue(.m_simpleMehtodThatReturns__param_param(Parameter<String>.value(`param`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for simpleMehtodThatReturns(param: String). Use given")
			Failure("Stub return value not specified for simpleMehtodThatReturns(param: String). Use given")
		}
		return __value
    }

    open func simpleMehtodThatReturns(optionalParam: String?) -> String? {
        addInvocation(.m_simpleMehtodThatReturns__optionalParam_optionalParam(Parameter<String?>.value(`optionalParam`)))
		let perform = methodPerformValue(.m_simpleMehtodThatReturns__optionalParam_optionalParam(Parameter<String?>.value(`optionalParam`))) as? (String?) -> Void
		perform?(`optionalParam`)
		var __value: String? = nil
		do {
		    __value = try methodReturnValue(.m_simpleMehtodThatReturns__optionalParam_optionalParam(Parameter<String?>.value(`optionalParam`))).casted()
		} catch {
			// do nothing
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_simpleMethod
        case m_simpleMehtodThatReturns
        case m_simpleMehtodThatReturns__param_param(Parameter<String>)
        case m_simpleMehtodThatReturns__optionalParam_optionalParam(Parameter<String?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_simpleMethod, .m_simpleMethod):
                return true 
            case (.m_simpleMehtodThatReturns, .m_simpleMehtodThatReturns):
                return true 
            case (.m_simpleMehtodThatReturns__param_param(let lhsParam), .m_simpleMehtodThatReturns__param_param(let rhsParam)):
                guard Parameter.compare(lhs: lhsParam, rhs: rhsParam, with: matcher) else { return false } 
                return true 
            case (.m_simpleMehtodThatReturns__optionalParam_optionalParam(let lhsOptionalparam), .m_simpleMehtodThatReturns__optionalParam_optionalParam(let rhsOptionalparam)):
                guard Parameter.compare(lhs: lhsOptionalparam, rhs: rhsOptionalparam, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_simpleMethod: return 0
            case .m_simpleMehtodThatReturns: return 0
            case let .m_simpleMehtodThatReturns__param_param(p0): return p0.intValue
            case let .m_simpleMehtodThatReturns__optionalParam_optionalParam(p0): return p0.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func simpleMehtodThatReturns(willReturn: Int...) -> MethodStub {
            return Given(method: .m_simpleMehtodThatReturns, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func simpleMehtodThatReturns(param: Parameter<String>, willReturn: String...) -> MethodStub {
            return Given(method: .m_simpleMehtodThatReturns__param_param(`param`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func simpleMehtodThatReturns(optionalParam: Parameter<String?>, willReturn: String?...) -> MethodStub {
            return Given(method: .m_simpleMehtodThatReturns__optionalParam_optionalParam(`optionalParam`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func simpleMehtodThatReturns(willProduce: (Stubber<Int>) -> Void) -> MethodStub {
            let willReturn: [Int] = []
			let given: Given = { return Given(method: .m_simpleMehtodThatReturns, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Int).self)
			willProduce(stubber)
			return given
        }
        public static func simpleMehtodThatReturns(param: Parameter<String>, willProduce: (Stubber<String>) -> Void) -> MethodStub {
            let willReturn: [String] = []
			let given: Given = { return Given(method: .m_simpleMehtodThatReturns__param_param(`param`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String).self)
			willProduce(stubber)
			return given
        }
        public static func simpleMehtodThatReturns(optionalParam: Parameter<String?>, willProduce: (Stubber<String?>) -> Void) -> MethodStub {
            let willReturn: [String?] = []
			let given: Given = { return Given(method: .m_simpleMehtodThatReturns__optionalParam_optionalParam(`optionalParam`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String?).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func simpleMethod() -> Verify { return Verify(method: .m_simpleMethod)}
        public static func simpleMehtodThatReturns() -> Verify { return Verify(method: .m_simpleMehtodThatReturns)}
        public static func simpleMehtodThatReturns(param: Parameter<String>) -> Verify { return Verify(method: .m_simpleMehtodThatReturns__param_param(`param`))}
        public static func simpleMehtodThatReturns(optionalParam: Parameter<String?>) -> Verify { return Verify(method: .m_simpleMehtodThatReturns__optionalParam_optionalParam(`optionalParam`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func simpleMethod(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_simpleMethod, performs: perform)
        }
        public static func simpleMehtodThatReturns(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_simpleMehtodThatReturns, performs: perform)
        }
        public static func simpleMehtodThatReturns(param: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_simpleMehtodThatReturns__param_param(`param`), performs: perform)
        }
        public static func simpleMehtodThatReturns(optionalParam: Parameter<String?>, perform: @escaping (String?) -> Void) -> Perform {
            return Perform(method: .m_simpleMehtodThatReturns__optionalParam_optionalParam(`optionalParam`), performs: perform)
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

// MARK: - SimpleProtocolWithProperties
open class SimpleProtocolWithPropertiesMock: SimpleProtocolWithProperties, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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

    public var property: String {
		get {	invocations.append(.p_property_get); return __p_property ?? givenGetterValue(.p_property_get, "SimpleProtocolWithPropertiesMock - stub value for property was not defined") }
		set {	invocations.append(.p_property_set(.value(newValue))); __p_property = newValue }
	}
	private var __p_property: (String)?

    public var weakProperty: AnyObject! {
		get {	invocations.append(.p_weakProperty_get); return __p_weakProperty ?? optionalGivenGetterValue(.p_weakProperty_get, "SimpleProtocolWithPropertiesMock - stub value for weakProperty was not defined") }
		set {	invocations.append(.p_weakProperty_set(.value(newValue))); __p_weakProperty = newValue }
	}
	private var __p_weakProperty: (AnyObject)?

    public var propertyGetOnly: String {
		get {	invocations.append(.p_propertyGetOnly_get); return __p_propertyGetOnly ?? givenGetterValue(.p_propertyGetOnly_get, "SimpleProtocolWithPropertiesMock - stub value for propertyGetOnly was not defined") }
		@available(*, deprecated, message: "Using setters on readonly variables is deprecated, and will be removed in 3.1. Use Given to define stubbed property return value.")
		set {	__p_propertyGetOnly = newValue }
	}
	private var __p_propertyGetOnly: (String)?

    public var propertyOptional: Int? {
		get {	invocations.append(.p_propertyOptional_get); return __p_propertyOptional ?? optionalGivenGetterValue(.p_propertyOptional_get, "SimpleProtocolWithPropertiesMock - stub value for propertyOptional was not defined") }
		set {	invocations.append(.p_propertyOptional_set(.value(newValue))); __p_propertyOptional = newValue }
	}
	private var __p_propertyOptional: (Int)?

    public var propertyImplicit: Int! {
		get {	invocations.append(.p_propertyImplicit_get); return __p_propertyImplicit ?? optionalGivenGetterValue(.p_propertyImplicit_get, "SimpleProtocolWithPropertiesMock - stub value for propertyImplicit was not defined") }
		set {	invocations.append(.p_propertyImplicit_set(.value(newValue))); __p_propertyImplicit = newValue }
	}
	private var __p_propertyImplicit: (Int)?






    fileprivate enum MethodType {
        case p_property_get
		case p_property_set(Parameter<String>)
        case p_weakProperty_get
		case p_weakProperty_set(Parameter<AnyObject?>)
        case p_propertyGetOnly_get
        case p_propertyOptional_get
		case p_propertyOptional_set(Parameter<Int?>)
        case p_propertyImplicit_get
		case p_propertyImplicit_set(Parameter<Int?>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.p_property_get,.p_property_get): return true
			case (.p_property_set(let left),.p_property_set(let right)): return Parameter<String>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_weakProperty_get,.p_weakProperty_get): return true
			case (.p_weakProperty_set(let left),.p_weakProperty_set(let right)): return Parameter<AnyObject?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_propertyGetOnly_get,.p_propertyGetOnly_get): return true
            case (.p_propertyOptional_get,.p_propertyOptional_get): return true
			case (.p_propertyOptional_set(let left),.p_propertyOptional_set(let right)): return Parameter<Int?>.compare(lhs: left, rhs: right, with: matcher)
            case (.p_propertyImplicit_get,.p_propertyImplicit_get): return true
			case (.p_propertyImplicit_set(let left),.p_propertyImplicit_set(let right)): return Parameter<Int?>.compare(lhs: left, rhs: right, with: matcher)
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case .p_property_get: return 0
			case .p_property_set(let newValue): return newValue.intValue
            case .p_weakProperty_get: return 0
			case .p_weakProperty_set(let newValue): return newValue.intValue
            case .p_propertyGetOnly_get: return 0
            case .p_propertyOptional_get: return 0
			case .p_propertyOptional_set(let newValue): return newValue.intValue
            case .p_propertyImplicit_get: return 0
			case .p_propertyImplicit_set(let newValue): return newValue.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }

        public static func property(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_property_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func weakProperty(getter defaultValue: AnyObject?...) -> PropertyStub {
            return Given(method: .p_weakProperty_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func propertyGetOnly(getter defaultValue: String...) -> PropertyStub {
            return Given(method: .p_propertyGetOnly_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func propertyOptional(getter defaultValue: Int?...) -> PropertyStub {
            return Given(method: .p_propertyOptional_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }
        public static func propertyImplicit(getter defaultValue: Int?...) -> PropertyStub {
            return Given(method: .p_propertyImplicit_get, products: defaultValue.map({ StubProduct.return($0 as Any) }))
        }

    }

    public struct Verify {
        fileprivate var method: MethodType

        public static var property: Verify { return Verify(method: .p_property_get) }
		public static func property(set newValue: Parameter<String>) -> Verify { return Verify(method: .p_property_set(newValue)) }
        public static var weakProperty: Verify { return Verify(method: .p_weakProperty_get) }
		public static func weakProperty(set newValue: Parameter<AnyObject?>) -> Verify { return Verify(method: .p_weakProperty_set(newValue)) }
        public static var propertyGetOnly: Verify { return Verify(method: .p_propertyGetOnly_get) }
        public static var propertyOptional: Verify { return Verify(method: .p_propertyOptional_get) }
		public static func propertyOptional(set newValue: Parameter<Int?>) -> Verify { return Verify(method: .p_propertyOptional_set(newValue)) }
        public static var propertyImplicit: Verify { return Verify(method: .p_propertyImplicit_get) }
		public static func propertyImplicit(set newValue: Parameter<Int?>) -> Verify { return Verify(method: .p_propertyImplicit_set(newValue)) }
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

// MARK: - UserNetworkType
open class UserNetworkTypeMock: UserNetworkType, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    public required init(config: NetworkConfig) { }

    public required init(baseUrl: String) { }

    open func getUser(for id: String, completion: (User?) -> Void) {
        addInvocation(.m_getUser__for_idcompletion_completion(Parameter<String>.value(`id`), Parameter<(User?) -> Void>.any))
		let perform = methodPerformValue(.m_getUser__for_idcompletion_completion(Parameter<String>.value(`id`), Parameter<(User?) -> Void>.any)) as? (String, (User?) -> Void) -> Void
		perform?(`id`, `completion`)
    }

    open func getUserEscaping(for id: String, completion: @escaping (User?,Error?) -> Void) {
        addInvocation(.m_getUserEscaping__for_idcompletion_completion(Parameter<String>.value(`id`), Parameter<(User?,Error?) -> Void>.value(`completion`)))
		let perform = methodPerformValue(.m_getUserEscaping__for_idcompletion_completion(Parameter<String>.value(`id`), Parameter<(User?,Error?) -> Void>.value(`completion`))) as? (String, @escaping (User?,Error?) -> Void) -> Void
		perform?(`id`, `completion`)
    }

    open func doSomething(prop: @autoclosure () -> String) {
        addInvocation(.m_doSomething__prop_prop(Parameter<() -> String>.any))
		let perform = methodPerformValue(.m_doSomething__prop_prop(Parameter<() -> String>.any)) as? (@autoclosure () -> String) -> Void
		perform?(`prop`())
    }

    open func testDefaultValues(value: String) {
        addInvocation(.m_testDefaultValues__value_value(Parameter<String>.value(`value`)))
		let perform = methodPerformValue(.m_testDefaultValues__value_value(Parameter<String>.value(`value`))) as? (String) -> Void
		perform?(`value`)
    }


    fileprivate enum MethodType {
        case m_getUser__for_idcompletion_completion(Parameter<String>, Parameter<(User?) -> Void>)
        case m_getUserEscaping__for_idcompletion_completion(Parameter<String>, Parameter<(User?,Error?) -> Void>)
        case m_doSomething__prop_prop(Parameter<() -> String>)
        case m_testDefaultValues__value_value(Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_getUser__for_idcompletion_completion(let lhsId, let lhsCompletion), .m_getUser__for_idcompletion_completion(let rhsId, let rhsCompletion)):
                guard Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            case (.m_getUserEscaping__for_idcompletion_completion(let lhsId, let lhsCompletion), .m_getUserEscaping__for_idcompletion_completion(let rhsId, let rhsCompletion)):
                guard Parameter.compare(lhs: lhsId, rhs: rhsId, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsCompletion, rhs: rhsCompletion, with: matcher) else { return false } 
                return true 
            case (.m_doSomething__prop_prop(let lhsProp), .m_doSomething__prop_prop(let rhsProp)):
                guard Parameter.compare(lhs: lhsProp, rhs: rhsProp, with: matcher) else { return false } 
                return true 
            case (.m_testDefaultValues__value_value(let lhsValue), .m_testDefaultValues__value_value(let rhsValue)):
                guard Parameter.compare(lhs: lhsValue, rhs: rhsValue, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_getUser__for_idcompletion_completion(p0, p1): return p0.intValue + p1.intValue
            case let .m_getUserEscaping__for_idcompletion_completion(p0, p1): return p0.intValue + p1.intValue
            case let .m_doSomething__prop_prop(p0): return p0.intValue
            case let .m_testDefaultValues__value_value(p0): return p0.intValue
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

        public static func getUser(for id: Parameter<String>, completion: Parameter<(User?) -> Void>) -> Verify { return Verify(method: .m_getUser__for_idcompletion_completion(`id`, `completion`))}
        public static func getUserEscaping(for id: Parameter<String>, completion: Parameter<(User?,Error?) -> Void>) -> Verify { return Verify(method: .m_getUserEscaping__for_idcompletion_completion(`id`, `completion`))}
        public static func doSomething(prop: Parameter<() -> String>) -> Verify { return Verify(method: .m_doSomething__prop_prop(`prop`))}
        public static func testDefaultValues(value: Parameter<String>) -> Verify { return Verify(method: .m_testDefaultValues__value_value(`value`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getUser(for id: Parameter<String>, completion: Parameter<(User?) -> Void>, perform: @escaping (String, (User?) -> Void) -> Void) -> Perform {
            return Perform(method: .m_getUser__for_idcompletion_completion(`id`, `completion`), performs: perform)
        }
        public static func getUserEscaping(for id: Parameter<String>, completion: Parameter<(User?,Error?) -> Void>, perform: @escaping (String, @escaping (User?,Error?) -> Void) -> Void) -> Perform {
            return Perform(method: .m_getUserEscaping__for_idcompletion_completion(`id`, `completion`), performs: perform)
        }
        public static func doSomething(prop: Parameter<() -> String>, perform: @escaping (@autoclosure () -> String) -> Void) -> Perform {
            return Perform(method: .m_doSomething__prop_prop(`prop`), performs: perform)
        }
        public static func testDefaultValues(value: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_testDefaultValues__value_value(`value`), performs: perform)
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

// MARK: - UserStorageType
open class UserStorageTypeMock: UserStorageType, Mock {
    init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
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





    open func surname(for name: String) -> String {
        addInvocation(.m_surname__for_name(Parameter<String>.value(`name`)))
		let perform = methodPerformValue(.m_surname__for_name(Parameter<String>.value(`name`))) as? (String) -> Void
		perform?(`name`)
		var __value: String
		do {
		    __value = try methodReturnValue(.m_surname__for_name(Parameter<String>.value(`name`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for surname(for name: String). Use given")
			Failure("Stub return value not specified for surname(for name: String). Use given")
		}
		return __value
    }

    open func storeUser(name: String, surname: String) {
        addInvocation(.m_storeUser__name_namesurname_surname(Parameter<String>.value(`name`), Parameter<String>.value(`surname`)))
		let perform = methodPerformValue(.m_storeUser__name_namesurname_surname(Parameter<String>.value(`name`), Parameter<String>.value(`surname`))) as? (String, String) -> Void
		perform?(`name`, `surname`)
    }


    fileprivate enum MethodType {
        case m_surname__for_name(Parameter<String>)
        case m_storeUser__name_namesurname_surname(Parameter<String>, Parameter<String>)

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Bool {
            switch (lhs, rhs) {
            case (.m_surname__for_name(let lhsName), .m_surname__for_name(let rhsName)):
                guard Parameter.compare(lhs: lhsName, rhs: rhsName, with: matcher) else { return false } 
                return true 
            case (.m_storeUser__name_namesurname_surname(let lhsName, let lhsSurname), .m_storeUser__name_namesurname_surname(let rhsName, let rhsSurname)):
                guard Parameter.compare(lhs: lhsName, rhs: rhsName, with: matcher) else { return false } 
                guard Parameter.compare(lhs: lhsSurname, rhs: rhsSurname, with: matcher) else { return false } 
                return true 
            default: return false
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_surname__for_name(p0): return p0.intValue
            case let .m_storeUser__name_namesurname_surname(p0, p1): return p0.intValue + p1.intValue
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func surname(for name: Parameter<String>, willReturn: String...) -> MethodStub {
            return Given(method: .m_surname__for_name(`name`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func surname(for name: Parameter<String>, willProduce: (Stubber<String>) -> Void) -> MethodStub {
            let willReturn: [String] = []
			let given: Given = { return Given(method: .m_surname__for_name(`name`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (String).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func surname(for name: Parameter<String>) -> Verify { return Verify(method: .m_surname__for_name(`name`))}
        public static func storeUser(name: Parameter<String>, surname: Parameter<String>) -> Verify { return Verify(method: .m_storeUser__name_namesurname_surname(`name`, `surname`))}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func surname(for name: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_surname__for_name(`name`), performs: perform)
        }
        public static func storeUser(name: Parameter<String>, surname: Parameter<String>, perform: @escaping (String, String) -> Void) -> Perform {
            return Perform(method: .m_storeUser__name_namesurname_surname(`name`, `surname`), performs: perform)
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

