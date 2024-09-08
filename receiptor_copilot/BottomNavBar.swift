//
//  BottomNavBar.swift
//  receiptor
//
//  Created by Omkar Malpure on 08/09/24.
//

import SwiftUI

struct BottomNavBar: View {
    @Binding var  selectedTab : Int
    @State private var showRewardsPopup = false
    var body: some View {
        
        
        
        
        
        VStack{
            Rectangle()
                .fill(Color.black.opacity(0.1))
                .frame(height: 1)
            
        HStack{
            
            VStack{
                Image(systemName: "house.fill")
                    .font(.system(size: 24))
                    .foregroundColor(selectedTab == 1 ? .blue : .gray)
                
                Text("Home")
                    .font(.caption)
                    .foregroundColor(selectedTab == 1 ? .blue : .gray)
            }.padding()
                .onTapGesture {
                    self.selectedTab = 1
                }
            
            Spacer()
            
            VStack{
                Image(systemName: "circle.fill")
                    .font(.system(size: 24))
                    .foregroundColor(selectedTab == 2 ? .blue : .gray)
                
                Text("My Data")
                    .font(.caption)
                    .foregroundColor(selectedTab == 2 ? .blue : .gray)
            }.padding(.all)
                .onTapGesture {
                    self.selectedTab = 2
                }
            
            Spacer()
            
            VStack{
                Image(systemName: "gift.fill")
                    .font(.system(size: 24))
                    .foregroundColor(selectedTab == 3 ? .blue : .gray)
                
                Text("Rewards")
                    .font(.caption)
                    .foregroundColor(selectedTab == 3 ? .blue : .gray)
            }
            .onTapGesture {
                if self.selectedTab == 1 {
                    self.selectedTab =  1
                }
                else{
                    self.selectedTab = 2
                }
                self.showRewardsPopup = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.showRewardsPopup = false
                }
            }
        }.frame(maxWidth: .infinity)
            .background(
                
//                Color(.lightGray).opacity(0.4)
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white.opacity(0.7),
//                        Color.gray.opacity(0.7)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                
            )
            .overlay(
                PopupView(isPresented: $showRewardsPopup)
            )
    }
            
    }
}

//#Preview {
//    BottomNavBar(selectedTab: selectedTab)
//}
