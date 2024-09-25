//
//  EmailLinkView.swift
//  receiptor_copilot
//
//  Created by Omkar Malpure on 15/08/24.
//

import SwiftUI
import Supabase


struct EmailLinkView: View {
    @State private var navigationPath = NavigationPath()
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {

            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.7), Color.blue.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                   
                VStack(spacing: 20) {
                    
                    CircleIcon()
                    HStack{
                        Text("Link your email")
                            .font(.system(size: 37))
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.horizontal,30)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                    }
                    VStack{
                        NavigationLink(destination: ConnectingGmail()){
                            HStack {
                                Image(.googleLogo)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 25)// You'll need to add this image to your assets
                                Text("Continue with Google")
                                    .fontWeight(.semibold)
                            }
                            
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(50)
                            .shadow(radius: 8)
                            .padding(.horizontal,15)
                        }
                        
                        Button{
                            showAlert = true
                        }label: {
                            HStack {
                                Image(.microsoftOutlookIcon)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 25)// You'll need to add this image to your assets
                                Text("Continue with Outlook")
                                    .fontWeight(.semibold)
                            }
                            
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(50)
                            .padding(.horizontal,15)
                            .shadow(radius: 8)
                        }.padding(.top,15)
                        
                        
                        Button{
                            showAlert = true
                        }label: {
                            HStack {
                                Image(.yahooSvgrepoCom)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 25)// You'll need to add this image to your assets
                                Text("Continue with Yahoo")
                                    .fontWeight(.semibold)
                            }
                            
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(50)
                            .padding(.horizontal,15)
                            .shadow(radius: 8)
                            
                        }.padding(.top,15)
                    }
                    .padding(.top,30)
                    
                    Text("Or enter email")
                        .foregroundColor(.blue)
                        .frame(maxHeight: .infinity,alignment: .bottom)
                    
                }.alert(isPresented: $showAlert) {
                    Alert(title: Text("Coming Soon!"), message: Text("This feature will be available shortly."), dismissButton: .default(Text("Got it!")))
                }
            }
            
         
        }.navigationBarBackButtonHidden()

            }
    
    }




struct CircleIcon: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 240, height: 240)
            
            Image(.emailLinkView)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 80)
                .foregroundColor(.white)
        }
    }
}





#Preview {
    EmailLinkView()
}
