//
//  ConsoleLogger.swift
//  HealthKitAppPortfolio
//
//  Created by Takasur Azeem on 8/5/24.
//


//
//  ConsoleLogger.swift
//  RestRoomFinder
//
//  Created by Takasur Azeem on 10/06/2024.
//

import os
import Foundation

class ConsoleLogger: Logger {
    private let subsystem: String
    private let category: String
    private let logger: OSLog

    init(
        subsystem: String = Bundle.main.bundleIdentifier ?? "default.subsystem",
        category: String
    ) {
        self.subsystem = subsystem
        self.category = category
        self.logger = OSLog(subsystem: subsystem, category: category)
    }

    func debug(_ message: String) {
        #if DEBUG
        os_log("%{public}@", log: logger, type: .debug, message)
        #endif
    }

    func info(_ message: String) {
        #if DEBUG
        os_log("%{public}@", log: logger, type: .info, message)
        #endif
    }

    func error(_ message: String) {
        #if DEBUG
        os_log("%{public}@", log: logger, type: .error, message)
        #endif
    }

    func fault(_ message: String) {
        #if DEBUG
        os_log("%{public}@", log: logger, type: .fault, message)
        #endif
    }
}
