//
//  AppMainEntryPoint.swift
//  HealthKitAppPortfolio
//
//  Created by Takasur Azeem on 8/4/24.
//

import SwiftUI

struct AppMainEntryPoint: View {
    @State private var selectedTab: Tabs = .home
    @ObservedObject private var healthManager: HealthManager
    
    init(healthManager: HealthManager) {
        self.healthManager = healthManager
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", systemImage: "house", value: .home) {
                HomeView(viewModel: healthManager)
            }
            Tab("Profile", systemImage: "person", value: .profile) {
                ProfileView()
            }
        }
    }
}

#Preview {
    AppMainEntryPoint(healthManager: HealthManager())
}
 
