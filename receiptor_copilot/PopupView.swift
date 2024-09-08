//
//  PopupView.swift
//  receiptor
//
//  Created by Omkar Malpure on 08/09/24.
//

import SwiftUI

struct PopupView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        if isPresented {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isPresented = false
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 20))
                    }
                    .padding(.trailing, 8)
                    .padding(.top, 8)
                }
                
                Text("Coming Soon!")
                    .padding()
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 20)
            .padding(.horizontal)
            .transition(.move(edge: .top).combined(with: .opacity))
            .zIndex(1)
        }
    }
}

//#Preview {
//    PopupView()
//}
