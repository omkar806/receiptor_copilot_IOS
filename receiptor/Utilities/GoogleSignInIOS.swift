//
//  GoogleSignInIOS.swift
//  receiptor
//
//  Created by Omkar Malpure on 26/08/24.
//

import Foundation
import GoogleSignIn
import Auth


func signInWithGoogleIOS(completion : @escaping (String? , String?,String?) -> Void)  {
    guard let presentingViewController =   (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {
        print( "Unable to get root view controller")
        return
    }


    GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController,hint: nil , additionalScopes: ["https://www.googleapis.com/auth/gmail.readonly"]) { signInResult, error in
        
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
        let gmail_access_token = user.accessToken.tokenString
//        let gmail_refresh_token = user.refreshToken.tokenString
        let gmail_refresh_token  = "abcd"
        let email = user.fetcherAuthorizer.userEmail
        completion(gmail_access_token,gmail_refresh_token,email)
    }
}



