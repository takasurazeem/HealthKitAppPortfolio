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
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            VStack(spacing: 20) {
                ViewThatFits {
                    normalLaytout
                    layoutForCornerCases
                }
                
                Text(activity.amount)
                    .font(.system(size: 24))
            }
            .padding()
        }
    }
    
    var normalLaytout: some View {
        HStack(alignment: .top ) {
            VStack(alignment: .leading, spacing: 5) {
                Text(activity.title)
                    .font(.system(size: 16, weight: .bold))
                Text(activity.subtitle)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(Color.gray)
            }
            
            Spacer()
            
            Image(systemName: activity.imageName)
                .foregroundStyle(activity.iconColor)
                
        }
    }
    
    var layoutForCornerCases: some View {
        VStack(alignment: .center, spacing: 5) {
            Text(activity.title)
                .font(.system(size: 16, weight: .bold))
            Text(activity.subtitle)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(Color.gray)
            
            Image(systemName: activity.imageName)
                .foregroundStyle(activity.iconColor)
        }
    }
}

#Preview {
    HomeView(viewModel: HealthManager())
}
