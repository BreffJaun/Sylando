//
//  ShirtRowView.swift
//  Sylando
//
//  Created by Jeff Braun on 01.09.25.
//

import SwiftUI

struct ShirtRowView: View {
    
    let shirt: Shirt
    let onAddToCart: (() -> Void)?
    let onDelete: (() -> Void)?
    let deleteIcon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(shirt.title)
                    .foregroundStyle(.primary)
                    .font(.headline)
                Spacer()
                Text(String(format: "%.2f €", shirt.price))
                    .foregroundStyle(.primary)
                    .font(.headline)
            }
            HStack {
                Text("Size: \(shirt.size.title)")
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
            }
        }
        .padding(.vertical, 8)
        .swipeActions(edge: .trailing) {
            if let onDelete {
                Button(role: .destructive) {
                    onDelete()
                } label: {
                    Label("Remove", systemImage: deleteIcon)
                }
                .tint(.red)
            }

            if let onAddToCart {
                Button {
                    onAddToCart()
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)
                } label: {
                    Label("Add to Cart", systemImage: "cart.badge.plus")
                }
                .tint(.accentColor)
            }
        }
    }
}

//#Preview {
//    ShirtRowView()
//}
