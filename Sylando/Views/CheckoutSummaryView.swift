//
//  CheckSummaryView.swift
//  Sylando
//
//  Created by Jeff Braun on 01.09.25.
//

import SwiftUI

struct CheckoutSummaryView: View {
    
    @ObservedObject var shirtsViewModel: ShirtsViewModel
    @ObservedObject var userViewModel: UserInfoViewModel
    @Binding var selectedTab: Int
    
    @State private var showConfirmation = false
    
    private var totalText: String {
        shirtsViewModel.totalPrice.formatted(.currency(code: "EUR"))
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
                    ForEach(shirtsViewModel.cart) { shirt in
                        HStack {
                            Text(shirt.title)
                            Spacer()
                            Text(shirt.size)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                
                Section {
                    Text(userViewModel.userInfo.companyName)
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
                        shirtsViewModel.clearCart()
                        userViewModel.reset()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            showConfirmation = false
                            selectedTab = 0
                        }
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
}
