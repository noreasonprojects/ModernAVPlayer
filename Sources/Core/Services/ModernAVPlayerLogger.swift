// The MIT License (MIT)
//
// ModernAVPlayer
// Copyright (c) 2018 Raphael Ankierman <raphael.ankierman@radiofrance.com>
//
// ModernAVPlayerLogger.swift
// Created by raphael ankierman on 26/07/2018.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

public enum LoggerDomain: CustomStringConvertible {
    case state
    case service
    case error
    case warning
    case lifecycleService
    case lifecycleState
    
    public var description: String {
        switch self {
        case .error:
            return "[💉]"
        case .service:
            return "[🔬]"
        case .lifecycleService:
            return "[🔬 🚥]"
        case .state:
            return "[🔈]"
        case .lifecycleState:
            return "[🔈 🚥]"
        case .warning:
            return "[🙅‍♂️]"
        }
    }
}

final class LoggerParamSetup {
    var config: PlayerConfiguration?
}

final class ModernAVPlayerLogger {
    
    static let setup = LoggerParamSetup()
    
    // MARK: Singleton
    
    static let instance = ModernAVPlayerLogger()
    
    // MARK: Input
    
    var domains: [LoggerDomain]!
    
    // MARK: Private variables
    
    private let dateFormat = "hh:mm:ssSSS"
    
    private let formatter = DateFormatter()
    
    // MARK: Init
    
    private init() {
        let param = ModernAVPlayerLogger.setup.config
        
        guard let configuration = param
            else { assertionFailure("should provide configuration to logger"); return }
        
        domains = configuration.loggerDomains
        setupDateFormatter(dateFormat: configuration.loggerDateFormat)
    }
    
    private func setupDateFormatter(dateFormat: String) {
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
    }
    
    private func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last ?? ""
    }
    
    func log(message: String,
             domain: LoggerDomain,
             fileName: String = #file,
             line: Int = #line,
             funcName: String = #function) {
        
        guard domains.contains(domain) else { return }
        print("\(formatter.string(from: Date())) \(domain.description)[\(sourceFileName(filePath: fileName))]:\(line) :: \(message)")
    }
}
