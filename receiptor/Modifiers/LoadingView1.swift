//
//  LoadingView1.swift
//  
//
//  Created by Omkar Malpure on 25/09/24.
//

import SwiftUI

struct LoadingView1: View {
    var body: some View {
        VStack {
            ProgressView() // SwiftUI's built-in activity indicator
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(1.5) // Make it larger if desired
            Text("Loading...")
                .font(.headline)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.5))
        .foregroundColor(.white)
        .edgesIgnoringSafeArea(.all)
    }
}
#Preview {
    LoadingView1()
}
