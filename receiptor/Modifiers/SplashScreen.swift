//
//  SplashScreen.swift
//  receiptor
//
//  Created by Omkar Malpure on 25/09/24.
//

import SwiftUI
import Supabase

struct SplashScreen: View {
    @State var scaleAmount: CGFloat = 1
    @State private var goToNextView = false
    var receiptor_id : String
    var email : String
    var access_token:String
    var refresh_token:String
    @State private var isLoading = false
    @State private var showSigningInText = false
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Image(.receiptor)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(scaleAmount)
                    .frame(width: 80)
                
                if showSigningInText {
                    Text("**Fetching your Receipts Securely**")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .transition(.opacity) // Fade in animation for the text
                }
                
            }.onAppear {
                

                
                withAnimation(.easeOut(duration: 0.3)) {
                    scaleAmount = 0.5 // Slightly shrink the image
                }
                
                // Bring it back to its original size, and then enlarge the logo
                withAnimation(.easeInOut(duration: 1).delay(0.3)) {
                    scaleAmount = 1.0 // Back to original size before growing
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        showSigningInText = true // Trigger the text to show
                    }
                }
                
                Task{
                    await insert_tokens_db(receiptor_id_: receiptor_id, email_: email, access_token_: access_token, refresh_token_: refresh_token)
                    print("Completed inserting the data")
                    isLoading = true
                }
                // Do somehing after the animation is done
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    if isLoading {
                        goToNextView = true
                    }
                    
                }
             
            }.navigationBarBackButtonHidden()
            .navigationDestination(isPresented: $goToNextView){
                ReceiptsView()
            }
            
            
        }

        
    }
}

//#Preview {
//    SplashScreen()
//}
