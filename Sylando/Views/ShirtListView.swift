//
//  ShirtListView.swift
//  Sylando
//
//  Created by Jeff Braun on 01.09.25.
//

import SwiftUI

struct ShirtListView: View {
    
    @EnvironmentObject var shirtsViewModel: ShirtsViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    
    @State private var shirtToDelete: Shirt?
    @State private var showDeleteAlert = false
    @State private var showAddShirtSheet = false
    
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
                
                VStack {
                    List {
                        ForEach(shirtsViewModel.shirts) { shirt in
                            ShirtRowView(
                                shirt: shirt,
                                onAddToCart: { cartViewModel.addToCart(shirt) },
                                onDelete: {
                                    shirtToDelete = shirt
                                    showDeleteAlert = true
                                },
                                deleteIcon: "trash"
                            )
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(.clear)
                .shadow(color: Color.primary.opacity(0.2), radius: 4, x: 2, y: 2)
                .navigationTitle("T-Shirts")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showAddShirtSheet = true
                        } label: {
                            Image(systemName: "plus.circle.fill")
                        }
                        .tint(.accentColor)
                    }
                }
                .alert("Delete Shirt?", isPresented: $showDeleteAlert) {
                    Button("Delete", role: .destructive) {
                        if let shirt = shirtToDelete {
                            shirtsViewModel.deleteShirt(shirt: shirt)
                        }
                    }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("Do you really want to remove this shirt?")
                }
                .sheet(isPresented: $showAddShirtSheet) {
                    NavigationStack {
                        ShirtAddView(showAddShirtSheet: $showAddShirtSheet)
                    }
                }
            }
        }
    }
}

//#Preview {
//    ShirtListView()
//}
