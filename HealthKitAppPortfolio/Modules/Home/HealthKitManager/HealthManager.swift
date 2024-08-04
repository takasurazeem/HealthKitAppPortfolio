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
                fetchTodaySteps()
            } catch {
                print(logger.error("\(error)"))
            }
        }
    }
    
    func fetchTodaySteps() {
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDayForToday, end: Date())
        
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { [weak self] _, result, error in
            guard let self else { return }
            if let error {
                logger.error("\(error)")
                return
            }
            if let result {
                let sum = result.sumQuantity()?.doubleValue(for: .count())
                logger.debug("\(sum ?? 0.0)")
            }
        }
        healthStore.execute(query)
    }
}
