//
//  Logger.swift
//  SwiftLogger
//
//  Created by Sauvik Dolui on 03/05/2017.
//  Copyright © 2016 Innofied Solutions Pvt. Ltd. All rights reserved.
//

import Foundation

public final class LoggerInHouse {
    
    public enum LogEvent: Int {
        case none
        case error
        case warning
        case info
        case debug
        case verbose
        
        var description: String {
            switch self {
            case .none:
                return ""
            case .debug:
                return "[🚥]"
            case .error:
                return "[💉]"
            case .info:
                return "[🔈]"
            case .verbose:
                return "[🔬]"
            case .warning:
                return "[🙅‍♂️]"
            }
        }
    }
    
    static let instance = LoggerInHouse()
    
    var levelFilter: LogEvent = .verbose
    
    private init() { }
    
    static var dateFormat = "hh:mm:ssSSS"
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    private func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last ?? ""
    }
    
    func log(message: String,
             event: LogEvent,
             fileName: String = #file,
             line: Int = #line,
             funcName: String = #function) {
        
        #if DEBUG
        if shouldDisplay(logLevel: event) {
            print("\(Date().toString()) \(event.description)[\(sourceFileName(filePath: fileName))]:\(line) :: \(message)")
        }
        #endif
    }
    
    private func shouldDisplay(logLevel: LogEvent) -> Bool {
        return logLevel <= levelFilter
    }
}

internal extension Date {
    func toString() -> String {
        return LoggerInHouse.dateFormatter.string(from: self as Date)
    }
}

extension LoggerInHouse.LogEvent: Comparable {
    static public func < (lhs: LoggerInHouse.LogEvent, rhs: LoggerInHouse.LogEvent) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
