//
//  HomeView.swift
//  HealthKitAppPortfolio
//
//  Created by Takasur Azeem on 8/4/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel: HealthManager
    private let navigationTitles = [
        "Welcome",
        "Marhaba مرحبا"
    ]
    @State private var selectedNavigationTitleIndex = 0
    
    init(viewModel: HealthManager) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(navigationTitles[selectedNavigationTitleIndex])
                    .padding()
                    .foregroundColor(.secondary)
                    .font(.largeTitle)
                    .animation(.easeIn(duration: 1.0), value: selectedNavigationTitleIndex)
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                    ForEach(viewModel.activities) { activity in
                        ActivityCard(activity: activity)
                    }
                }
                .padding()
            }
            .navigationTitle(navigationTitles[selectedNavigationTitleIndex])
            .toolbar(.hidden)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .onAppear {
            startWelcomeTimer()
        }
    }
    
    func startWelcomeTimer() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            withAnimation {
                selectedNavigationTitleIndex = (selectedNavigationTitleIndex + 1) % navigationTitles.count
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HealthManager())
}
