//
//  DataUsageView.swift
//  receiptor_copilot
//
//  Created by Omkar Malpure on 14/08/24.
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

struct DataUsageView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showSafari = false
    @State private var urlToLoad: URL?
    @Environment(\.openURL) var openURL
    let privacyPolicyURL = URL(string: "https://www.apple.com")!
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("What we do with your data")
                    
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading,16)
                Spacer()
                Button(action: {
                    // Add dismissal action here
                    dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
//                        .background(Color.blue.opacity(0.2))
                        .background(
                            RoundedRectangle(cornerRadius: 20) // Adjust radius for rounded effect
                                .fill(Color.blue.opacity(0.2)) // Blue background with opacity
                        )
                        .padding(.horizontal)
                }
            }
            
            Image(.lock) // Replace with your actual image name
                
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(10)
                .clipShape(RoundedRectangle(cornerRadius: 20)) // Make the edges circular
                .padding(.horizontal,10)

             
            
            Text("By sharing your data  we unlock value for you.")
                .padding(.horizontal , 10)
                .font(.title2)
                .fontWeight(.bold)
            
            VStack(alignment: .leading, spacing: 20) {
                BulletPoint(text: "We protect your personal data and keep it secure")
                BulletPoint(text: "We remove personally identifiable information and combine it with data from the rest of our users")
                BulletPoint(text: "When we share that data with our partners it becomes valuable for market insights")
                BulletPoint(text: "We commercialise this data on your behalf and share that value with you, by giving you points and rewards")
                BulletPoint(text: "You will never intentionally be targeted as an individual by any of our partners")
            }.padding(.horizontal)
            
            
            Button(action: {
                showSafari = true
            }) {
                Text("View our privacy policy")
                    .foregroundColor(.blue)
                    .padding(.horizontal,25)
            }
            
//            Link("View our privacy policy", destination: privacyPolicyURL)
//                .foregroundColor(.blue)
            

        }.sheet(isPresented:$showSafari){
            SafariView(url: privacyPolicyURL)
                .foregroundColor(.blue)
        }
    }
    
    
    
    struct BulletPoint: View {
        let text: String
        
        var body: some View {
            HStack(alignment: .top) {
                Text("•")
                    .font(.headline)
                Text(text)
            }
        }
    }
    
}

#Preview {
    DataUsageView()
}
