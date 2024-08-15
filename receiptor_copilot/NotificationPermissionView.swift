//
//  NotificationPermissionView.swift
//  receiptor_copilot
//
//  Created by Omkar Malpure on 15/08/24.
//

import SwiftUI


struct NotificationPermissionView: View {
    @State private var isShowingSettings = false
    
    var body: some View {
        VStack(spacing: 20) {
            
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 250, height: 250)
                    .overlay(
                        NotificationBanner()
                            
                    )
                
            
           
            
            
            Text("We hate spammy\nnotifications too")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(UIColor(red: 0/255, green: 51/255, blue: 100/255, alpha: 1)))
                .padding(.top,20)
            
            Text("We'll only notify you if...")
                .padding(.top,20)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color(UIColor(red: 0/255, green: 51/255, blue: 100/255, alpha: 1)))
            
            VStack(alignment: .leading, spacing: 20) {
                NotificationReason(icon: "🎁", text: "You can redeem a reward")
                NotificationReason(icon: "💰", text: "Bonus points are available")
                NotificationReason(icon: "⏰", text: "It's time to share your data")
            }
            
            Spacer()
            
            Button(action: {
                isShowingSettings = true
            }) {
                Text("Allow notifications")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(UIColor(red: 10/255, green: 90/255, blue: 190/255, alpha: 1)))
                    .cornerRadius(50)
            }
            .sheet(isPresented: $isShowingSettings) {
                if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                    SafariView(url: settingsUrl)
                }
            }
            
            Button("Maybe later") {
                // Handle "Maybe later" action
            }.fontWeight(.bold)
            .foregroundColor(Color(UIColor(red: 0/255, green: 51/255, blue: 100/255, alpha: 1)))
        }.navigationBarBackButtonHidden()
        .padding()
    }
}

struct NotificationBanner: View {
    var body: some View {
        HStack {
            Image(systemName: "app.fill")
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading) {
                Text("Reward unlocked 🎁")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("Redeem an Amazon giftcard")
                    .font(.caption)
            }
            
            Spacer()
            
            Text("2m ago")
                .font(.caption2)
                .foregroundColor(.purple)
        }
        .padding(10)
        .frame(width:300,height:60)
        .background(Color(UIColor(red: 200/255, green: 140/255, blue: 200/255, alpha: 1)).opacity(1.0))
        
        .cornerRadius(20)
        .shadow(radius: 5)
        
    }
}

struct NotificationReason: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack {
            Text(icon)
            Text(text)
//                .fontWeight(.bold)
                .foregroundStyle(Color(UIColor(red: 0/255, green: 51/255, blue: 100/255, alpha: 1)))
        }
    }
}


#Preview {
    NotificationPermissionView()
}
