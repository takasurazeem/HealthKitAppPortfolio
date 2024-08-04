//
//  Activity.swift
//  HealthKitAppPortfolio
//
//  Created by Takasur Azeem on 8/4/24.
//

import Foundation
import SwiftUICore

struct Activity: Identifiable {
    let id: Int
    
    let title: String
    let subtitle: String
    let imageName: String
    let amount: String
    let iconColor: Color
    
    // example activities
    static var activities: [Activity] = [
        Activity(id: 0, title: "Today steps", subtitle: "Goal 10,000", imageName: "figure.walk", amount: "12,123", iconColor: .green),
        Activity(id: 1, title: "Today calories", subtitle: "Goal 900", imageName: "flame", amount: "1241", iconColor: .red)
    ]
    
    static var todaySteps: Activity {
        Activity(id: 0, title: "Today steps", subtitle: "Goal 10,000", imageName: "figure.walk", amount: "12,123", iconColor: .green)
    }
    static var todayCalories: Activity {
        Activity(id: 1, title: "Today calories", subtitle: "Goal 900", imageName: "flame", amount: "1241", iconColor: .red)
    }
}
