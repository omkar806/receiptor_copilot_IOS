//
//  ConnectionItem.swift
//  receiptor_copilot
//
//  Created by Omkar Malpure on 14/08/24.
//

import SwiftUI

struct ConnectionItem: View {
    let icon: String
    let title: String
    let subtitle: String
    let points: String?
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundStyle(.black)
                    .font(.headline)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            if let points = points {
                Text("Set up now for up to \(points)")
                    .font(.caption)
                    .foregroundColor(.orange)
            } else {
                Text("Set up now")
                    .font(.caption)
                    .foregroundColor(.orange)
            }
            
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

#Preview {
    ConnectionItem(icon:"receipt.radar", title:"Receipt Radar", subtitle:"Turn your receipts into rewards", points: "850")
}
