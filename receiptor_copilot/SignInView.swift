//
//  SignInView.swift
//  receiptor
//
//  Created by Omkar Malpure on 03/09/24.
//

import SwiftUI

struct SignInView: View {
    
    
    var body: some View {
        ZStack {
            //            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                
                Text("Receiptor")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.4))
                    .padding(.top)
                    
                VStack{
                    Text("Welcome back")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.4))
                        .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                    Text("Are you ready to start \n earning rewards ? ")
                    
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                }.frame(maxWidth: .infinity , maxHeight: .infinity)
                VStack(spacing: 10) {
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "applelogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 30)
                            Text("Continue with Apple")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                    }
                    
//                    Button{
//                        print("test")
//                        SignlogInWithGoogle()
//                    }
//                label:{
//                    HStack {
//                        Image(.googleLogo)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 30, height: 30)// You'll need to add this image to your assets
//                        Text("Continue with Google")
//                    }
//                    
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.white)
//                    .foregroundColor(.black)
//                    .cornerRadius(8)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 50)
//                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
//                    )
//                }
                    NavigationLink{
//                        Task{
//                            let test = await SignlogInWithGoogle()
//                        }
//                        
                      
                        
                        
                        
                    }label: {
                        HStack {
                            Image(.googleLogo)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)// You'll need to add this image to your assets
                            Text("Continue with Google")
                        }
                        
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                    }
                    
                    
                    
                    
                    //
                    Button(action: {}) {
                        HStack {
                            Image(.facebookLogo)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:35,height: 30)// You'll need to add this image to your assets
                            Text("Continue with Facebook")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                    }
                    
                    Button(action: {}) {
                        Text("Log in with Email")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(Color(red: 0.1, green: 0.3, blue: 0.6))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                    }
                    
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Don't have an account ?")
                    Button(action: {}) {
                        Text("Sign up")
                            .fontWeight(.bold)
                            .underline()
                    }
                }
                .font(.footnote)
                .foregroundColor(Color(red: 0.1, green: 0.3, blue: 0.6))
                
            }
//            .padding()
        }
    }
    
}
#Preview {
    SignInView()
}
