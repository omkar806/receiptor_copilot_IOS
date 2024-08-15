//
//  EmailLinkView.swift
//  receiptor_copilot
//
//  Created by Omkar Malpure on 15/08/24.
//

import SwiftUI



struct EmailLinkView: View {
    var body: some View {

        NavigationView {
            
            ZStack{

//                WaveBackground()
            VStack(spacing: 20) {
                
                CircleIcon()
                HStack{
                    Text("Link your email")
                        .font(.title)
                        .fontWeight(.bold)


                }
                
                ContinueButton(text: "Continue with Google", icon: "google_icon", color: .white)
                ContinueButton(text: "Continue with Outlook", icon: "outlook_icon", color: Color(UIColor(red: 0/255, green: 120/255, blue: 212/255, alpha: 1)))
                ContinueButton(text: "Continue with Yahoo", icon: "yahoo_icon", color: .purple)
                
                Text("Or enter email")
                    .foregroundColor(.blue)
            }
        }
            .padding()

            .navigationBarItems(leading: BackButton())
        }
    }
}

struct WaveBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                
                path.move(to: CGPoint(x: 0, y: height))
                
                path.addCurve(
                    to: CGPoint(x: width, y: height),
                    control1: CGPoint(x: width * 0.3, y: height * 0.7),
                    control2: CGPoint(x: width * 0.7, y: height * 1.2)
                )
                
                path.addLine(to: CGPoint(x: width, y: 0))
                path.addLine(to: CGPoint(x: 0, y: 0))
                path.closeSubpath()
            }
            .fill(LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.green.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ))
        }
    }
}

struct CircleIcon: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 150, height: 150)
            
            Image(.emailLinkView)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 50)
                .foregroundColor(.white)
        }
    }
}

struct ContinueButton: View {
    let text: String
    let icon: String
    let color: Color
    
    var body: some View {
        Button(action: {}) {
            HStack {
                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                Text(text)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}

struct BackButton: View {
    var body: some View {
        Button(action: {}) {
            Image(systemName: "chevron.left")
                .foregroundColor(.blue)
        }
    }
}


#Preview {
    EmailLinkView()
}
