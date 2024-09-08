//
//  WebAuthenticationPresenter.swift
//  receiptor
//
//  Created by Omkar Malpure on 26/08/24.
//

import SwiftUI
import AuthenticationServices

class WebAuthenticationPresentationContextProvider: NSObject, ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return UIApplication.shared.windows.first ?? ASPresentationAnchor()
    }
}



struct WebAuthenticationPresenter: UIViewControllerRepresentable {
    let authSession: ASWebAuthenticationSession
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        authSession.presentationContextProvider = context.coordinator
        authSession.start()
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, ASWebAuthenticationPresentationContextProviding {
        func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            return scene?.windows.first ?? UIWindow()
        }
    }
}
