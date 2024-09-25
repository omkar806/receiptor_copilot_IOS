//
//  HomeScreen.swift
//  receiptor
//
//  Created by Omkar Malpure on 08/09/24.
//

import SwiftUI

struct HomeScreen: View {
    var user_name : String
    @State private var selectedTab: Bool = false // Default tab is Home
    @State private var navigationPath = NavigationPath()
    var body: some View {
        
            
                TabView{
                HomeScreenView(user_name: user_name)
                    .tabItem(){
                        Image(systemName: "house.fill")
                            .font(.system(size: 24))
                        
                        Text("Home")
                            .font(.caption)
                    }
                MyDataView()
                    .tabItem(){
                        Image(systemName: "circle.fill")
                        .font(.system(size: 24))
                        
                        Text("My Data")
                            .font(.caption)
                    }
                
                RewardView()
                
                    .tabItem(){
                        VStack{
                            Image(systemName: "gift.fill")
                                .font(.system(size: 24))
                            Text("Rewards")
                                .font(.caption)
                        }.onTapGesture {
                            selectedTab = true
                        }
                    }
                
            }.alert("Not availabe currently",isPresented : $selectedTab){
                
            }message: {
                Text("Coming Soon !")
            }
        
        .navigationBarBackButtonHidden()
    }
}



#Preview {
    HomeScreen(user_name: "")
}
