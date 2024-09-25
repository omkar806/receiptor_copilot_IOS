//
//  UserDefaults.swift
//  receiptor
//
//  Created by Omkar Malpure on 11/09/24.
//

import Foundation


class Userdefaults{
    let user_id : String
    let user_name : String
    //initialising the user_id
    init(user_id : String,user_name:String){
        self.user_id = user_id
        self.user_name = user_name
    }
    
    
     func default_Storage(){
        UserDefaults.standard.set(self.user_id, forKey: "user_id")
         UserDefaults.standard.set(self.user_name,forKey: "user_name")
    }
    
    
}
