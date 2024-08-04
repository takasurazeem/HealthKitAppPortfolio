//
//  AppMainEntryPoint.swift
//  HealthKitAppPortfolio
//
//  Created by Takasur Azeem on 8/4/24.
//

import SwiftUI

struct AppMainEntryPoint: View {
    @State private var selectedTab: Tabs = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", systemImage: "house", value: .home) {
                HomeView()
            }
            Tab("Profile", systemImage: "person", value: .profile) {
                ProfileView()
            }
        }
    }
}

#Preview {
    AppMainEntryPoint()
}
 
