//
//  receiptorApp.swift
//  receiptor
//
//  Created by Omkar Malpure on 22/08/24.
//

import SwiftUI
import GoogleSignIn
@main
struct receiptorApp: App {
    var body: some Scene {

        WindowGroup {
//            ContentView()
            HomeScreen()
                .preferredColorScheme(.light)
//            SignUpSignInView()
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}
