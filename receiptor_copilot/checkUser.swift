//
//  checkUser.swift
//  receiptor
//
//  Created by Omkar Malpure on 07/09/24.
//

import Foundation

import Supabase
// Now use the ID token to sign in with Supabase
func checkuser(idToken:String , access_token:String , user_name:String)->Bool {
    Task{
    do {
        let authResponse = try await SupabaseManager.shared.client.auth.signInWithIdToken(
            credentials: OpenIDConnectCredentials(
                provider: .google,
                idToken: idToken,
                accessToken: access_token
                
            )
        )
        print(authResponse.user.id)
        
        let user_id = authResponse.user.id.uuidString
        var check_user_id = try await SupabaseManager.shared.client.from("users").select("receiptor_id").execute()
        
        print(check_user_id)
        return true
        //        if check_user_id == "None"{
        //            _ = try await SupabaseManager.shared.client.from("users").insert(Users(receiptor_id: user_id, name: user_name, email: authResponse.user.email ?? "")).execute()
        //
        //                        DispatchQueue.main.async {
        //                            print("Signed in with Supabase: \(authResponse.user.email ?? "Unknown")")
        //                        }
        //                    }
        
    } catch {
        DispatchQueue.main.async {
            print( "Supabase Auth Error: \(error.localizedDescription)")
        }
    }
        return true
}
    return true
}
