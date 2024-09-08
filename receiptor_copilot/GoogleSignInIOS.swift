//
//  GoogleSignInIOS.swift
//  receiptor
//
//  Created by Omkar Malpure on 26/08/24.
//

import Foundation
import GoogleSignIn
import Auth


func signInWithGoogleIOS() {
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
          let window = windowScene.windows.first,
          let rootViewController = window.rootViewController else {
        print("Unable to get root view controller")
        return
    }

    GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController,hint: nil , additionalScopes: ["https://www.googleapis.com/auth/gmail.readonly"]) { signInResult, error in
        
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }
        
        guard let signInResult = signInResult else {
            print("Sign-in result is nil")
            return
        }
        
        // If sign in succeeded, display the app's main content View.
        let user = signInResult.user
        print(user.accessToken.tokenString)
        print(user.refreshToken.tokenString)
        print("Signed in as \(user.profile?.name ?? "Unknown")")

    }
}


func SignlogInWithGoogle(completion:@escaping (String?,String?,String?)  -> Void ) {
    
        guard let presentingViewController =   (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {
            print( "Unable to get root view controller")
            return
        }
    
    GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
        Task {
        if let error = error {
            print( "Google Sign-In Error: \(error.localizedDescription)")
            return
        }
        
        guard let signInResult = signInResult,
              let idToken = signInResult.user.idToken?.tokenString else {
            print( "Failed to get ID token from Google Sign-In")
            return
        }
        let access_token = signInResult.user.accessToken.tokenString
        let user_name = signInResult.user.profile?.name
        let photo = signInResult.user.profile?.imageURL(withDimension: 20)
        
        // Now use the ID token to sign in with Supabase
        completion(access_token , idToken,user_name)
        
        
    }
        }
    
}

//func signInwithGoogle() {
//    Task{
//        do{
//            _ = try await SupabaseManager.shared.client.auth.signInWithOAuth(provider: .google)
//            
//        } catch{
//            print("Error while signin : \(error.localizedDescription)")
//        }
//    }
//}
