//
//  Supabase_Google_LogIn.swift
//  receiptor
//
//  Created by Omkar Malpure on 25/09/24.
//

import Foundation
import GoogleSignIn
import Auth

func SignlogInWithGoogle(completion:@escaping (String?,String?,String?)  -> Void )  {
    
        guard let presentingViewController =   (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {
            print( "Unable to get root view controller")
            return
        }
    
    GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
        
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
        let user_name = signInResult.user.profile?.givenName
        
        // Now use the ID token to sign in with Supabase
        completion(access_token , idToken,user_name)
        
        
    
        }
    
}
