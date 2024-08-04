//
//  HomeView.swift
//  HealthKitAppPortfolio
//
//  Created by Takasur Azeem on 8/4/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel: HealthManager
    
    init(viewModel: HealthManager) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
            ForEach(viewModel.activities) { activity in
                ActivityCard(activity: activity)
            }
        }
        .padding()
    }
}

#Preview {
    HomeView(viewModel: HealthManager())
}
