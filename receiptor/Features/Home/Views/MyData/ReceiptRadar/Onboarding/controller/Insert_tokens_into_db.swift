//
//  Insert_tokens_into_db.swift
//  receiptor
//
//  Created by Omkar Malpure on 25/09/24.
//

import Foundation
import Supabase

func insert_tokens_db(receiptor_id_:String,email_:String , access_token_:String , refresh_token_:String) async{
    
    do {
        let resp_ = try  await SupabaseManager.shared.client.from("receipt_radar_tokens").insert(insert_receipt_token_v1(access_token: access_token_ , receiptor_id: receiptor_id_, email:email_ , refresh_token: refresh_token_))
            .execute()
    }
    catch{
        print("Error \(error.localizedDescription)")
    }
    
}
