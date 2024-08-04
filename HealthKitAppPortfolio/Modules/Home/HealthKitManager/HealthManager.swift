//
//  HealthManager.swift
//  HealthKitAppPortfolio
//
//  Created by Takasur Azeem on 8/4/24.
//

import Foundation
import HealthKit

class HealthManager: ObservableObject {
    
    let healthStore = HKHealthStore()
    let logger: Logger
    
    init(
        logger: Logger = ConsoleLogger(category: "HealthManager") // I am against putting default values but this is injected at so many places I don't want to go there and pass it...
    ) {
        self.logger = logger

        let steps = HKQuantityType(.stepCount)
        let healthTypes: Set = [steps]
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
            } catch {
                print(logger.error("\(error)"))
            }
        }
    }
}
