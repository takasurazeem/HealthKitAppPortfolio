//
//  Double+formattedString.swift
//  HealthKitAppPortfolio
//
//  Created by Takasur Azeem on 8/5/24.
//


import Foundation

extension Double {
    var formattedString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
