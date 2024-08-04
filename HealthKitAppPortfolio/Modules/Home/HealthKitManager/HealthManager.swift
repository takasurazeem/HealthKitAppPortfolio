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
    
    @Published var activities: [Activity] = []
    
    init(
        logger: Logger = ConsoleLogger(category: "HealthManager") // I am against putting default values but this is injected at so many places I don't want to go there and pass it...
    ) {
        self.logger = logger

        let steps = HKQuantityType(.stepCount)
        let calories = HKQuantityType(.activeEnergyBurned)
        let healthTypes: Set = [steps, calories]
#if targetEnvironment(simulator)
        activities = [
            Activity(
                id: 0,
                title: "Today steps",
                subtitle: "Goal: 10,000",
                imageName: "figure.walk",
                amount: 12314.formattedString,
                iconColor: .green
            ),
            Activity(
                id: 1,
                title: "Today calories",
                subtitle: "Goal: 300",
                imageName: "flame",
                amount: 130.formattedString,
                iconColor: .red
            )
        ]
#else
        Task {
            do {
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
                fetchTodaySteps()
                fetchTodayCalories()
            } catch {
                print(logger.error("\(error)"))
            }
        }
#endif
    }
    
    func fetchTodaySteps() {
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDayForToday, end: Date())
        
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) {
            [weak self] _,
            result,
            error in
            guard let self else { return }
            if let error {
                logger.error("Error fetching today's steps: \(error)")
                return
            }
            if let result {
                let sum = result.sumQuantity()?.doubleValue(for: .count()) ?? 0.0
                DispatchQueue.main.async {
                    self.activities.append(
                        Activity(
                            id: 0,
                            title: "Today steps",
                            subtitle: "Goal: 10,000",
                            imageName: "figure.walk",
                            amount: sum.formattedString,
                            iconColor: .green
                        )
                    )
                }
            }
        }
        healthStore.execute(query)
    }
    
    func fetchTodayCalories() {
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDayForToday, end: Date())
        let query = HKStatisticsQuery(quantityType: HKQuantityType(.activeEnergyBurned), quantitySamplePredicate: predicate) {
            [weak self] _,
            result,
            error in
            guard let self = self else { return }
            if let error {
                logger.error("Error fetching today's calories: \(error)")
                return
            }
            if let result {
                let calories = result.sumQuantity()?.doubleValue(for: .kilocalorie()) ?? 0.0
                DispatchQueue.main.async {
                    self.activities
                        .append(
                            Activity(
                                id: 1,
                                title: "Today calories",
                                subtitle: "Goal: 300",
                                imageName: "flame",
                                amount: calories.formattedString,
                                iconColor: .red
                            )
                        )
                }
            }
        }
        healthStore.execute(query)
    }
}
