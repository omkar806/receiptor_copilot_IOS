//
//  EmailLinkView.swift
//  receiptor_copilot
//
//  Created by Omkar Malpure on 15/08/24.
//

import SwiftUI



struct EmailLinkView: View {
    @State private var navigationPath = NavigationPath()

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
                        Button{
                            
                            //action
                            signInWithGoogleIOS {
                                access_token , refresh_token , email  in
                                let receiptor_id = UserDefaults.standard.string(forKey: "user_id") ?? ""
                                print(receiptor_id)
                                if receiptor_id != ""{
                                    print("inside task")
                                    Task{
                                        print("inside task")
                                     
                                           let  insert_ = try await SupabaseManager.shared.client.from("receipt_radar_tokens").insert(insert_receipt_token(access_token: access_token ?? "null", receiptor_id: receiptor_id, email:email ?? "null" , refresh_token: refresh_token ?? "null"))
                                                .execute()
                                            print(insert_.status)
                                            print("Completed inserting the data")
                                        
                                        
                                    }
                                }
                            }
//
                            
                        }
                    label:{
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
