//
//  Date+StartOfDay.swift
//  HealthKitAppPortfolio
//
//  Created by Takasur Azeem on 8/5/24.
//

import Foundation

extension Date {
    static var startOfDayForToday: Date {
        Calendar.current.startOfDay(for: Date())
    }
}
