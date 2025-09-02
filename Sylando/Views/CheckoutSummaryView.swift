//
//  CheckSummaryView.swift
//  Sylando
//
//  Created by Jeff Braun on 01.09.25.
//

import SwiftUI

struct CheckoutSummaryView: View {
    
    @EnvironmentObject var shirtsViewModel: ShirtsViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    @EnvironmentObject var userViewModel: UserInfoViewModel
    
    @Binding var selectedTab: Int
    @Binding var path: NavigationPath
    
    @State private var showConfirmation = false
    
    private var totalText: String {
        cartViewModel.totalPrice.formatted(.currency(code: "EUR"))
    }
    
    var body: some View {
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
                Section {
                    ForEach(cartViewModel.cartItems) { shirt in
                        HStack {
                            Text(shirt.title)
                            Spacer()
                            Text(shirt.size.title)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                
                Section {
                    Text(userViewModel.userInfo.name)
                    Text(userViewModel.userInfo.street)
                    Text(userViewModel.userInfo.city)
                } header: {
                    Text("Personal Details")
                }
                
                Section {
                    HStack {
                        Text("Total:")
                        Spacer()
                        Text(totalText)
                            .font(.body.monospacedDigit())
                    }
                }
                
                Section {
                    Button {
                        showConfirmation = true
                        cartViewModel.clearCart()
                        userViewModel.reset()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            showConfirmation = false
                            selectedTab = 0
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                cartViewModel.path = NavigationPath()
                            }
                            
                        }
                       
//                        confirmPurchase()
                    } label: {
                        Text("Buy now!")
                            .foregroundStyle(.tint)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            .background(.clear)
            
            // MARK: PURCHASE OVERLAY
            if showConfirmation {
                PurchaseConfirmationView()
                    .transition(.opacity.combined(with: .scale))
                    .zIndex(1)
            }
        }
        .navigationTitle("Summary")
        .navigationBarTitleDisplayMode(.large)
    }
    
//    private func confirmPurchase() {
//        showConfirmation = true
//        cartViewModel.completePurchase(userViewModel: userViewModel)
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            showConfirmation = false
//            path = NavigationPath()
//            selectedTab = 0
//        }
//    }
}
