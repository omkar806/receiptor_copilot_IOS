//
//  ConnectingGmail.swift
//  receiptor
//
//  Created by Omkar Malpure on 12/09/24.
//

import SwiftUI

struct ConnectingGmail: View {
    @State private var googlesignIncompleted = false
    @State private var isLoading = false
    @State private var _id = ""
    @State private var _email = ""
    @State private var _access_token = ""
    @State private var _refresh_token = ""
    var body: some View {
        
        
        NavigationStack {
        VStack{
            
            Image(.gmail4848)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundColor(.blue)
                .padding()
                .background(Circle()
                    .frame(width: 150 , height: 150)
                    .foregroundStyle(Color.white))
                .shadow(radius: 0.7)
        }.padding(.top,50)
        VStack{
            Text("Connecting Gmail")
                .font(.system(size: 33))
                .fontWeight(.semibold)
                .padding(.horizontal,15)
                .frame(maxWidth:.infinity , alignment: .leading)
                .foregroundColor(Color(UIColor(red: 0/255.0, green: 50/255.0, blue: 120/255.0, alpha: 1)))
            
            
            Text("📲 Google will send you notification about this \n new connection to Receiptor, you don't need to do anything")
                .padding(.top,20)
                .padding(.horizontal)
                .foregroundColor(Color(UIColor(red: 0/255.0, green: 50/255.0, blue: 120/255.0, alpha: 1)))
            
            
            
            
            Text("🔒 Your receipts will be **kept private** and **secure**")
                .padding(.top,20)
                .padding(.leading,7)
                .foregroundColor(Color(UIColor(red: 0/255.0, green: 50/255.0, blue: 120/255.0, alpha: 1)))
            
            
            Text("🚨 This will only work if you have **2 step**")
                .padding(.top,20)
                .padding(.trailing, 55)
                .foregroundColor(Color(UIColor(red: 0/255.0, green: 50/255.0, blue: 120/255.0, alpha: 1)))
            
            Text("**verification enabled** for your google account")
                .foregroundColor(Color(UIColor(red: 0/255.0, green: 50/255.0, blue: 120/255.0, alpha: 1)))
        }.padding(.top, 50)
        
        VStack{
            Button{
                
                signInWithGoogleIOS {
                    access_token , refresh_token , email  in
                    let receiptor_id = UserDefaults.standard.string(forKey: "user_id") ?? ""
                    print(receiptor_id)
                    
                    Task{
                        print("inside task")
                        
//                        googlesignIncompleted = true
                        _access_token = access_token!
                        _email = email!
                        _id = receiptor_id
                        _refresh_token = refresh_token!

                        isLoading = true
                        
                        
                        
                    
                    }
                    
                }
            }label: {
                VStack{
                    Text("Sign in to Google")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(UIColor(red: 10/255, green: 90/255, blue: 190/255, alpha: 1)))
                        .cornerRadius(50)
                    
                }.padding(.horizontal,17)
                
            }
            
            
            Button{
                print("go back")
            }label:{
                Text("Maybe later")
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(UIColor(red: 10/255, green: 90/255, blue: 190/255, alpha: 1)))
            }.padding(.top,17)
        }.padding(.top,50)
          .navigationDestination(isPresented: $isLoading){
              SplashScreen(receiptor_id: _id, email: _email, access_token: _access_token, refresh_token: _refresh_token)
                }
           
//                .navigationDestination(isPresented: $googlesignIncompleted){
//                    ReceiptsView()
//                }
                
           
        }
  }
}

#Preview {
    ConnectingGmail()
}
