//
//  RewardView.swift
//  receiptor
//
//  Created by Omkar Malpure on 08/09/24.
//

import SwiftUI

struct RewardView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("My Data")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Find out what companies know about you and earn points 🏆")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    WelcomeQuestCard()
                    
                    Text("Add connections")
                        .font(.headline)
                    
                        ConnectionItem(icon: ".howitowrksView1", title: "Receipt Radar", subtitle: "Turn your receipts into rewards", points: "850")
                        .onTapGesture {
//                            isReceiptRadarPresented = true
                        }
//
                    ConnectionItem(icon: "safari", title: "Supercharge Safari", subtitle: "Earn rewards from browsing", points: "850")
                    ConnectionItem(icon: "google.logo", title: "My Google data", subtitle: "Discover what Google tracks", points: nil)
                }
                .padding()
            }
            
            .navigationBarHidden(true)
            .background(Color(UIColor.systemBackground))
//            .fullScreenCover(isPresented: $isReceiptRadarPresented) {
//                Receipt_Radar_Onboarding_View()
//            }
            
            TabBar()
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RewardView()
}
