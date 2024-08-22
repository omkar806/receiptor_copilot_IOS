//
//  SignUpSignInView.swift
//  receiptor_copilot_latest
//
//  Created by Omkar Malpure on 15/08/24.
//

import SwiftUI

struct SignUpSignInView: View {
    var body: some View {
        ZStack {
//            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Receiptor")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.1, green: 0.3, blue: 0.6))
                
                Text("Get rewarded for\nYour data")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.1, green: 0.3, blue: 0.6))
                
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
                    
                    Button(action: {}) {
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
                        Text("Register with Email")
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
                    Text("Already have an account?")
                    Button(action: {}) {
                        Text("Log in")
                            .fontWeight(.bold)
                    }
                }
                .font(.footnote)
                .foregroundColor(Color(red: 0.1, green: 0.3, blue: 0.6))
                
//                Text("By continuing, I agree to Gener8's\nTerms of Use and Privacy Policy")
//                    .font(.caption)
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(.gray)
            }
            .padding()
        }
    }
}

#Preview {
    SignUpSignInView()
}
