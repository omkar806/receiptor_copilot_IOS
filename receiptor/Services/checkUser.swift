//
//  checkUser.swift
//  receiptor
//
//  Created by Omkar Malpure on 07/09/24.
//

import Foundation

import Supabase
// Now use the ID token to sign in with Supabase
func checkuser(idToken:String , access_token:String , user_name:String) async->Bool {
    

        var check : Bool = false
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
        let check_user_id  = try await SupabaseManager.shared.client.from("users").select("receiptor_id").eq("receiptor_id", value: user_id).execute()

        // checking if the data is present or not
        
        do {
           
            
            if check_user_id.status == 200 {
                check = true
                let usr_ = Userdefaults(user_id: user_id, user_name: user_name)
                usr_.default_Storage()
                print("returning fron fetch")
                return true
            }
            
            
        }
        

        if !check {
            let  ins = try await SupabaseManager.shared.client.from("users").insert(Users(receiptor_id: user_id, name: user_name, email: authResponse.user.email ?? "")).execute()

            do{
                
                if ins.status == 201 {
                    let usr = Userdefaults(user_id: user_id, user_name: user_name)
                    usr.default_Storage()
                    print("returning from ins")
                    return true
                }
                
            }
            
            
            
        }
        
    } catch {
        DispatchQueue.main.async {
            print( "Supabase Auth Error: \(error.localizedDescription)")
        }
    }
        
    return false

}
