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
            ConnectingGmail()
//            Receipt_Radar_Onboarding_View()
//            ConnectingGmail()
//            EmailLinkView()
//            HomeScreen()
//            ContentView()
                .preferredColorScheme(.light)
//            SignUpSignInView()
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
        }
    }
}
