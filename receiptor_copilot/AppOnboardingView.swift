//
//  AppOnboardingView.swift
//  receiptor_copilot
//
//  Created by Omkar Malpure on 15/08/24.
//

import SwiftUI


struct AppOnboardingView: View {
    @State private var animatedText = ""
    @State private var currentTextIndex = 0
    let textOptions = ["Google", "Gmail"]
    
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Receiptor")
                    .font(.system(size: 48))
                    .fontWeight(.bold)
                    .foregroundColor(Color(UIColor(red: 0/255, green: 51/255, blue: 100/255, alpha: 1)))
                    .padding(.top, 25)
                
//                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Earn from your")
                        .font(.system(size: 38))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(UIColor(red: 0/255, green: 51/255, blue: 100/255, alpha: 1)))
                        .padding(.top,100)
                    
                    HStack(spacing: 0) {
                        animatedTextView()
                        
                        Text(" data.")
                            .font(.system(size: 38))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(UIColor(red: 0/255, green: 51/255, blue: 100/255, alpha: 1)))
                            
                    }
                }
                
                Text("Start being rewarded today")
                    .font(.system(size: 20))
                    .foregroundColor(Color(UIColor(red: 0/255, green: 51/255, blue: 100/255, alpha: 1)))
                    .padding(.top , 21)
                
                Spacer()
                
                Button(action: {
                    // Action for "Get started" button
                }) {
                    Text("Get started")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    // Action for "I already have an account" button
                }) {
                    Text("I already have an account")
                        .fontWeight(.medium)
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
        .onAppear {
            animateText()
        }
    }
    
    @ViewBuilder
    func animatedTextView() -> some View {
        switch animatedText {
        case "Google":
            HStack(spacing: 0) {
                Text("G").foregroundColor(Color(red: 66/255, green: 133/255, blue: 244/255)).font(.system(size: 38)).fontWeight(.semibold)
                Text("o").foregroundColor(Color(red: 219/255, green: 68/255, blue: 55/255)).font(.system(size: 38)).fontWeight(.semibold)
                Text("o").foregroundColor(Color(red: 244/255, green: 180/255, blue: 0/255)).font(.system(size: 38)).fontWeight(.semibold)
                Text("g").foregroundColor(Color(red: 66/255, green: 133/255, blue: 244/255)).font(.system(size: 38)).fontWeight(.semibold)
                Text("l").foregroundColor(Color(red: 15/255, green: 157/255, blue: 88/255)).font(.system(size: 38)).fontWeight(.semibold)
                Text("e").foregroundColor(Color(red: 219/255, green: 68/255, blue: 55/255)).font(.system(size: 38)).fontWeight(.semibold)
            }
            .font(.system(size: 24, weight: .semibold))
        case "Gmail":
            HStack(spacing: 0) {
                Text("G").foregroundColor(Color(red: 66/255, green: 133/255, blue: 244/255)).font(.system(size: 38)).fontWeight(.semibold)
                Text("m").foregroundColor(Color(red: 219/255, green: 68/255, blue: 55/255)).font(.system(size: 38)).fontWeight(.semibold)
                Text("a").foregroundColor(Color(red: 244/255, green: 180/255, blue: 0/255)).font(.system(size: 38)).fontWeight(.semibold)
                Text("i").foregroundColor(Color(red: 66/255, green: 133/255, blue: 244/255)).font(.system(size: 38)).fontWeight(.semibold)
                Text("l").foregroundColor(Color(red: 15/255, green: 157/255, blue: 88/255)).font(.system(size: 38)).fontWeight(.semibold)
//                Text("e").foregroundColor(Color(red: 219/255, green: 68/255, blue: 55/255))
            }
            .font(.system(size: 24, weight: .semibold))
        case "Safari":
            Text(animatedText)
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(Color(red: 0/255, green: 122/255, blue: 255/255))
        default:
            Text(animatedText)
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(Color(red: 0/255, green: 51/255, blue: 160/255))
        }
    }
    
    
    func animateText() {
        Timer.scheduledTimer(withTimeInterval: 2.5, repeats: true) { timer in
            withAnimation(.easeInOut(duration: 0.5)) {
                self.animatedText = ""
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeInOut(duration: 0.4)) {
                    self.animatedText = self.textOptions[self.currentTextIndex]
                }
                self.currentTextIndex = (self.currentTextIndex + 1) % self.textOptions.count
            }
        }
    }
}



#Preview {
    AppOnboardingView()
}
