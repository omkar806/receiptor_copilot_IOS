//
//  HowItWorksView.swift
//  receiptor_copilot
//
//  Created by Omkar Malpure on 14/08/24.
//

import SwiftUI


struct HowItWorksView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showNextScreen = false
    @State private var privacyNoticeButton = false
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(.howitowrksView1)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .foregroundColor(.gray)

                    .padding()

                Text("How does this work?")
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 15) {
                    HowItWorksRow(image: "envelope", text: "Link your email account and allow permissions")
                    HowItWorksRow(image: "dollarsign.circle", text: "Automatically earn points from your receipts")
                    HowItWorksRow(image: "lock.shield", text: "Your receipts will be kept private and secure")
                }
                .padding()

                HStack{
                    Text("Unlock the value in your data,")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    Button{
                        privacyNoticeButton=true
                    }label: {
                        Text(" Find out how.")
                            .font(.footnote)
                    }
                }
                



                Button(action: {
                    showNextScreen = true
                }) {
                    Text("I understand, let's go!")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                NavigationLink(destination:ContentView()){
                    Text("Maybe later")
                }.foregroundColor(.blue)

            }
            .sheet(isPresented:$privacyNoticeButton){
                DataUsageView()
            }
            .padding()
            .navigationBarItems(leading:
//                presentationMode.wrappedValue.dismiss()
                                NavigationLink(destination:ContentView()){
                                HStack {
                                    Image(systemName: "chevron.left")
                                    Text("My Data")
                                }
                                .foregroundColor(.blue)
            }
            )
        }
        .navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HowItWorksRow: View {
    let image: String
    let text: String

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: image)
                .foregroundColor(.blue)
            Text(text)
                .font(.subheadline)
        }
    }
}


#Preview {
    HowItWorksView()
}
