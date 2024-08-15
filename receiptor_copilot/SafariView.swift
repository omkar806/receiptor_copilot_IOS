//
//  SafariView.swift
//  receiptor_copilot
//
//  Created by Omkar Malpure on 15/08/24.
//

import SwiftUI

import SafariServices


struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        // No updates needed
    }
}


//#Preview {
//    SafariView()
//}
