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
            HomeView(viewModel: healthManager)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tabs.home)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
                .tag(Tabs.profile)
        }
    }
}

#Preview {
    AppMainEntryPoint(healthManager: HealthManager())
}
 
