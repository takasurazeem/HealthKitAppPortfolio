//
//  Activity.swift
//  HealthKitAppPortfolio
//
//  Created by Takasur Azeem on 8/4/24.
//

import Foundation
import SwiftUICore

struct Activity {
    let title: String
    let subtitle: String
    let imageName: String
    let activityMeasure: String
    let iconColor: Color
    
    // example activities
    static var activities: [Activity] = [
        Activity(title: "Today steps", subtitle: "Goal 10,000", imageName: "figure.walk", activityMeasure: "12,123", iconColor: .green),
        Activity(title: "Today calories", subtitle: "Goal 900", imageName: "flame", activityMeasure: "1241", iconColor: .red)
    ]
    
    static var todaySteps: Activity {
        Activity(title: "Today Steps", subtitle: "Goal 10,000", imageName: "figure.walk", activityMeasure: "12,123", iconColor: .green)
    }
    static var todayCalories: Activity {
        Activity(title: "Today calories", subtitle: "Goal 900", imageName: "flame", activityMeasure: "1,241", iconColor: .red)
    }
}
