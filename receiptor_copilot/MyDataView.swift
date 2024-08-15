//
//  MyDataView.swift
//  receiptor_copilot_latest
//
//  Created by Omkar Malpure on 15/08/24.
//

import SwiftUI

struct MyDataView: View {
    @State private var isReceiptRadarPresented = false
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
                            isReceiptRadarPresented = true
                        }
                    
                    ConnectionItem(icon: "safari", title: "Supercharge Safari", subtitle: "Earn rewards from browsing", points: "850")
                    ConnectionItem(icon: "google.logo", title: "My Google data", subtitle: "Discover what Google tracks", points: nil)
                }
                .padding()
            }
            
            .navigationBarHidden(true)
            .background(Color(UIColor.systemBackground))
            .fullScreenCover(isPresented: $isReceiptRadarPresented) {
                Receipt_Radar_Onboarding_View()
            }
            
            TabBar()
        }.navigationBarBackButtonHidden(true)
    }
}

struct TabBar: View {
    var body: some View {
        HStack {
            TabBarItem(icon: "house", text: "Home")
            TabBarItem(icon: "chart.bar", text: "My Data", isSelected: true)
            TabBarItem(icon: "gift", text: "Rewards")
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
    }
}

struct TabBarItem: View {
    let icon: String
    let text: String
    var isSelected: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .foregroundColor(isSelected ? .blue : .gray)
            Text(text)
                .font(.caption)
                .foregroundColor(isSelected ? .blue : .gray)
        }
    }
}



#Preview {
    MyDataView()
}
