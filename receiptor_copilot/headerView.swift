//
//  headerView.swift
//  receiptor_copilot
//
//  Created by Omkar Malpure on 14/08/24.
//

import SwiftUI

struct headerView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack {
            Image(systemName: "cart")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
            Text("Receipt Radar")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
            }
        }
        .padding(.top, 50)
        .padding(.horizontal)
    }
}

#Preview {
    headerView()
}
