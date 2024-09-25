//
//  HomeScreenView.swift
//  receiptor
//
//  Created by Omkar Malpure on 11/09/24.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var Myactivity : Bool = false
    @State private var rotation: Double = 0.0
//    @Binding var navigationPath: NavigationPath
    var user_name : String
    var body: some View {
        ScrollView{
        VStack{
            
            HStack{
                Text("Good afternoon \n \(user_name)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.5))
                    .frame(alignment:.top)
                    .padding(.horizontal)
                    .padding(.top,30)
                
                
                Spacer()
                Button{
                    
                }label: {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .shadow(color: Color.gray.opacity(0.5), radius: 2, x: 0, y: 1)
                        
                        Image(systemName: "gearshape")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                    }
                    .frame(width: 40, height: 40)
                    .padding(.top,30)
                    .padding(.horizontal,20)
                }
                
                
            }
            
            
            ZStack{
                Circle()
                    .stroke(
                        AngularGradient(
                            gradient: Gradient(colors: [Color.blue, Color.purple, Color.blue]), // Gradient colors
                            center: .center,
                            angle: .degrees(rotation)
                        ),
                        style: StrokeStyle(lineWidth: 15, lineCap: .round)
                    )
                    .frame(width: 195,height: 250)
                    .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false), value: rotation)
                    .onAppear {
                        rotation = 360.0 // Rotate full circle
                    }
                
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 50)
                            .fill(Color(CGColor(red: 235/255, green: 245/255,blue: 255/255, alpha: 1)))
                            .shadow(color : Color.gray.opacity(0.5),radius: 10)
                            .frame(width: 140,height: 45)
                        
                        HStack{
                            Text("My Activity")
                                .font(.system(size: 14))
                                .foregroundStyle(Color(red: 0.3, green: 0.3, blue: 0.5))
                                .fontWeight(.semibold)
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(red: 0.3, green: 0.3, blue: 0.5))
                        }
                    }
                    
                }.offset(y: 85)
                    .onTapGesture {
                        self.Myactivity = true
                    }
            }
            
            
            
        }.sheet(isPresented: $Myactivity){
            EmptyView()
        }
    }
    }
}

#Preview {
    HomeScreenView(user_name: "")
}
