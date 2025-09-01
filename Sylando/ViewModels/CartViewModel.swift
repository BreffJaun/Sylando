//
//  CartViewModel.swift
//  Sylando
//
//  Created by Jeff Braun on 01.09.25.
//

import SwiftUI

import SwiftUI

@MainActor
class CartViewModel: ObservableObject {
    
    @Published var cartItems: [Shirt] = []
    
    func addToCart(_ shirt: Shirt) {
        cartItems.append(shirt)
    }
    
    func removeFromCart(_ shirt: Shirt) {
        cartItems.removeAll { $0.id == shirt.id }
    }
    
    func clearCart() {
        cartItems = []
    }
}
