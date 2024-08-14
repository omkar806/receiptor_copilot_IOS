//
//  ReceiptsView.swift
//  receiptor_copilot
//
//  Created by Omkar Malpure on 14/08/24.
//

import SwiftUI

struct ReceiptsView: View {
    @State private var searchText = ""
    @State private var receipts: [Receipt] = [
        Receipt(brandName: "Raymond", brandLogo: URL(string:"https://cdn.comparably.com/26369405/l/348056/company_logo_348056.png")!, date: "11.Aug.2023", time: "6:45pm"),
        Receipt(brandName: "Indian Terrain", brandLogo: URL(string:"https://cdn.comparably.com/26369405/l/348056/company_logo_348056.png")!, date: "11.Aug.2023", time: "6:45pm"),
        Receipt(brandName: "Amazon", brandLogo: URL(string:"https://cdn.comparably.com/27414917/l/25287_logo_amazon.png")!, date: "12.Aug.2023", time: "2:30pm")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                
//                List(receipts) { receipt in
//                    ReceiptRow(receipt: receipt)
//                }
                ScrollView {
                    LazyVStack {
                        
                            ForEach(receipts) { receipt in
                                NavigationLink(destination:ReceiptDetailView()){
                                    ReceiptRow(receipt: receipt)
                                        .padding(.horizontal)
                                        .buttonStyle(PlainButtonStyle())
                                }
                            }
                        
                    }
                }
            }
            .navigationTitle("Receipts")
            .navigationBarItems(trailing: addButton)
        }
    }
    
    private var addButton: some View {
        Button(action: addGmailAccount) {
            Image(systemName: "plus")
        }
    }
    
    private func addGmailAccount() {
        // Implement Gmail OAuth2 flow here
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search brand receipts", text: $text)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct ReceiptRow: View {
    let receipt: Receipt
    
    var body: some View {
        HStack {
            AsyncImage(url: receipt.brandLogo) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(8)
                case .failure:
                    Image(systemName: "photo")
                        .foregroundColor(.gray)
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading) {
                Text(receipt.brandName)
                    .font(.headline)
                    .foregroundStyle(.black)
                Text("\(receipt.date) | \(receipt.time)")
                    .font(.subheadline)
//                    .foreColor(.gray)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
        }
        .padding(.vertical, 8)
    }
}

struct Receipt: Identifiable {
    let id = UUID()
    let brandName: String
    let brandLogo: URL
    let date: String
    let time: String
}

#Preview {
    ReceiptsView()
}
