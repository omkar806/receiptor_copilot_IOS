//
//  receiptor_token.swift
//  receiptor
//
//  Created by Omkar Malpure on 11/09/24.
//

import Foundation


struct insert_receipt_token_v1 : Encodable {
    
    let access_token : String
    let receiptor_id : String
    let email : String
    let refresh_token : String
    
}
