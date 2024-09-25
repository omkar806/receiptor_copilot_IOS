//
//  WelcomeQuestCard.swift
//  receiptor_copilot
//
//  Created by Omkar Malpure on 14/08/24.
//

import SwiftUI

struct WelcomeQuestCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.blue.opacity(0.2))
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Welcome quest")
                        .font(.headline)
                    Text("Add connections\nfrom below 👇")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Button(action: {
                        // Start quest action
                    }) {
                        Text("Start quest")
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                    .padding(.top, 5)
                }
                
                Spacer()
                
                Image("treasure_chest") // Replace with your actual image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                
                Text("+ 50.00")
                    .font(.caption)
                    .padding(5)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .offset(x: -30, y: -30)
            }
            .padding()
        }
    }
}

#Preview {
    WelcomeQuestCard()
}
