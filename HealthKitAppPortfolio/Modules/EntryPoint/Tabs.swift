//
//  Tabs.swift
//  HealthKitAppPortfolio
//
//  Created by Takasur Azeem on 8/4/24.
//


enum Tabs: String, Equatable, Hashable, Identifiable {
    var id: String { self.rawValue }

    case home
    case profile
}
