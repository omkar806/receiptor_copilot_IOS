//
//  ConnectingGmail.swift
//  receiptor
//
//  Created by Omkar Malpure on 12/09/24.
//

import SwiftUI

struct ConnectingGmail: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 130 , height: 130,alignment: .top)
                .foregroundStyle(Color.white)
                .shadow(radius: 2)
            
            
            Image(.gmail4848)
                .frame(width: 150,height: 150)
        }.frame(maxWidth: .infinity , maxHeight: .infinity , alignment: .top)
            .padding(.top,30)
        VStack{
            Text("Connecting Gmail")
                .font(.system(size: 33))
                .fontWeight(.semibold)
                .padding(.horizontal,15)
                .frame(maxWidth:.infinity , alignment: .leading)
            
            Text("Google will send you notification about this \n new connection to Receiptor, you don't need to do anything")
                .padding(.top,20)
            
            
            Text("Your receipts will be **kept private**  and **secure**")
                .padding(.top,20)
  
        }
        
        VStack{
            Button{
                print("test")
            }label: {
                VStack{
                    Text("Sign in to Google")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal,15)
                        .background(Color(UIColor(red: 10/255, green: 90/255, blue: 190/255, alpha: 1)))
                        .cornerRadius(50)
                }
            }
            
            
            Button{
                print("go back")
            }label:{
                Text("Maybe later")
                    .foregroundStyle(Color(UIColor(red: 10/255, green: 90/255, blue: 190/255, alpha: 1)))
            }
        }.frame(maxWidth: .infinity , maxHeight: .infinity,alignment: .bottom)
    }
}

#Preview {
    ConnectingGmail()
}
