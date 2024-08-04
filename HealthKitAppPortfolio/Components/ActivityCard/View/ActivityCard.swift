//
//  ActivityCard.swift
//  HealthKitAppPortfolio
//
//  Created by Takasur Azeem on 8/4/24.
//

import SwiftUI

struct ActivityCard: View {
    let activity: Activity
    var body: some View {
        VStack {
            VStack (alignment: .leading) {
                HStack {
                    Text(activity.title)
                        .bold()
                    Spacer()
                    Image(systemName: activity.imageName)
                        .foregroundStyle(activity.iconColor)
                }
                Text(activity.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(Color.gray)
            }
            .padding(.top)
            Text(activity.activityMeasure)
                .bold()
                .font(.title3)
                .padding(.top, 10)
            Spacer()
        }
        .padding(.horizontal, 16)
        .frame(maxHeight: .infinity)
        .background(Color.gray.opacity(0.12))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    VStack {
        HStack {
            ActivityCard(activity: .todaySteps)
            ActivityCard(activity: .todayCalories)
        }
        .padding(.horizontal)
        .frame(height: 135)
        Spacer()
    }
    .padding(.top, 44)
}
