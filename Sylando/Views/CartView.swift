//
//  CartView.swift
//  Sylando
//
//  Created by Jeff Braun on 01.09.25.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var shirtsViewModel: ShirtsViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.65, green: 0.85, blue: 1.0),
                        Color(red: 0.45, green: 0.75, blue: 0.95),
                        Color(red: 0.60, green: 0.55, blue: 0.90)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .ignoresSafeArea()
                
                List {
                    ForEach(shirtsViewModel.cart) { shirt in
                        ShirtRowView(
                            shirt: shirt,
                            onAddToCart: nil,
                            onDelete: { shirtsViewModel.removeFromCart(shirt) },
                            deleteIcon: "cart.badge.minus"
                        )
                    }
                }
                .scrollContentBackground(.hidden)
                .background(.clear)
                .shadow(color: Color.primary.opacity(0.2), radius: 4, x: 2, y: 2)
            }
            .navigationTitle("Cart")
            .safeAreaInset(edge: .bottom) {
                NavigationLink {
                    UserInfoView(shirtsViewModel: shirtsViewModel)
                } label: {
                    Text("Buy")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .font(.headline)
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .padding(.vertical)
                }
                .background(.ultraThinMaterial)
                .disabled(shirtsViewModel.cart.isEmpty)
            }
        }
    }
}

//#Preview {
//    CartView()
//}
