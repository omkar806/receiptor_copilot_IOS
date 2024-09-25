//
//  Supabase_Init.swift
//  receiptor
//
//  Created by Omkar Malpure on 26/08/24.
//

import SwiftUI
import Supabase

class SupabaseManager {
    static let shared = SupabaseManager()
    
    let client: SupabaseClient
    
    private init() {
        client = SupabaseClient(
            supabaseURL: URL(string: "https://nkkjkjgyvtyncsonubba.supabase.co")!,
            supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5ra2pramd5dnR5bmNzb251YmJhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjQ2ODExNjEsImV4cCI6MjA0MDI1NzE2MX0.lGNzuN5BeZa1p1sCZ0PxKiKnxpEoYW95BHi_litk15M"
        )
        
    }
}
