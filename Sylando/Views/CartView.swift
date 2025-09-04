//
//  CartView.swift
//  Sylando
//
//  Created by Jeff Braun on 01.09.25.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var shirtsViewModel: ShirtsViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    
    @Binding var selectedTab: Int
    
    
    var body: some View {
        NavigationStack(path: $cartViewModel.path) {
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
                if cartViewModel.cartItems.isEmpty {
                    ContentUnavailableView {
                        Label("Cart is empty", systemImage: "cart")
                    } description: {
                        Text("Add items to your cart to be...happy 😎")
                    }
                    .padding(.top, 50)
                }
                List {
                    ForEach(cartViewModel.cartItems) { shirt in
                        ShirtRowView(
                            shirt: shirt,
                            onAddToCart: nil,
                            onDelete: { cartViewModel.removeFromCart(shirt) },
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
                Button { // anstatt des vorhrigen NavigationLinks
                    cartViewModel.path.append(CartRoute.userInfo)
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
                .disabled(cartViewModel.cartItems.isEmpty)
            }
            .navigationDestination(for: CartRoute.self) { route in
                switch route {
                case .userInfo:
                    UserInfoView(selectedTab: $selectedTab, path: $cartViewModel.path)
                    
                case .summary:
                    CheckoutSummaryView(selectedTab: $selectedTab, path: $cartViewModel.path)
                }
            }
        }
    }
}

//#Preview {
//    CartView()
//}
