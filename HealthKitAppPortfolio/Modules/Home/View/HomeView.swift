//
//  ContentView.swift
//  HealthKitAppPortfolio
//
//  Created by Takasur Azeem on 8/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ActivityCard(activity: .todaySteps)
                .frame(width: 135, height: 200)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
