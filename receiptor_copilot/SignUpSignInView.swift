//
//  SignUpSignInView.swift
//  receiptor_copilot_latest
//
//  Created by Omkar Malpure on 15/08/24.
//

import SwiftUI
import AuthenticationServices



struct SignUpSignInView: View {
    @State private var isAuthenticated = false
    @State private var isPresenting = false
    @State private var authSession: ASWebAuthenticationSession?
    private let contextProvider = WebAuthenticationPresentationContextProvider()
    @State private var access_token_ = ""
    @State private var idToken = ""
    @State private var user_name = ""
    @State private var selection : String?  = ""
    @State private var isLoading = false

    var body: some View {
        
        
        NavigationView {
            ZStack {
                //            Color.white.edgesIgnoringSafeArea(.all)
                
                NavigationLink(destination:MyDataView() , tag:"DataUsageView" , selection: $selection
                ){EmptyView()}
                
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
                        
                        Button{
                             let _ = SignlogInWithGoogle{
                                access_token,idToken,user_name in
                                if let token = access_token{
                                    self.access_token_ = token
                                    self.idToken = idToken!
                                    self.user_name = user_name!
                                    print("Access_token \(access_token)")
                                    print("idToken , \(idToken)")
                                    print("user_name\(user_name)")
                                    let Ch = checkuser(idToken: self.idToken, access_token: self.access_token_, user_name: self.user_name)
                                    if Ch {
                                        self.selection = "DataUsageView"
                                    }
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    let Ch = checkuser(idToken: self.idToken, access_token: self.access_token_, user_name: self.user_name)
                                     if Ch {
                                        self.selection = "DataUsageView"
                                        }
                                    isLoading = false
                                        }
                                    
                                    
                                }
                            }
                           
                
                            
                            
                        }label: {
                            if isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                    .scaleEffect(1.5)
                            }
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
                        
                    }.sheet(isPresented: $isPresenting) {
                        if let authSession = authSession {
                            WebAuthenticationPresenter(authSession: authSession)
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
                    
                }
                .padding()
            }
            
        }
    }

    func authenticateWithGoogle() {
        guard let authURL = URL(string: "https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=53407187172-m1b14dps5b3b10eol4pip5f3p2gn1ce8.apps.googleusercontent.com&redirect_uri=https://omkar008-receipt-radar-test.hf.space/test&scope=openid%20profile%20email%20https://www.googleapis.com/auth/gmail.readonly&access_type=offline") else { return }

        authSession = ASWebAuthenticationSession(url: authURL, callbackURLScheme: nil) { callbackURL, error in
            DispatchQueue.main.async {
                // Dismiss the sheet
                self.isPresenting = false
                
                if let error = error {
                    print("Authentication error: \(error.localizedDescription)")
                    return
                }
            }

            
            guard let callbackURL = callbackURL else { return }
            
            // Process the callback URL
            print("Callback URL: \(callbackURL.absoluteString)")
            // Handle the authentication result here
            // You might want to set isAuthenticated to true here if auth was successful
            if callbackURL.absoluteString.starts(with: "https://omkar008-receipt-radar-test.hf.space/test") {
                // Authentication was successful
                self.isAuthenticated = true
                print("Authentication successful")
                // Handle successful authentication (e.g., store tokens, update UI)
            } else {
                // Authentication failed or was cancelled
                print("Authentication failed or was cancelled")
            }
            
            
        }
        authSession!.presentationContextProvider = contextProvider
        authSession!.prefersEphemeralWebBrowserSession = true
        
        DispatchQueue.main.async {
            authSession!.start()
        }
        isPresenting = true
    }
    


    
}




#Preview {
    SignUpSignInView()
}
