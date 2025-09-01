//
//  ShirtsViewModel.swift
//  Sylando
//
//  Created by Jeff Braun on 01.09.25.
//

import SwiftUI

@MainActor
class ShirtsViewModel: ObservableObject {
    
    @Published var shirts: [Shirt] = shirtList
    @Published var cart: [Shirt] = []
    
    var totalPrice: Double {
        cart.reduce(0) { $0 + $1.price }
    }
    
    // MARK: CART FUNCS
    func addToCart(shirt: Shirt) {
        cart.append(shirt)
    }
    
    func clearCart() {
        cart = []
    }
    
    func removeFromCart(_ shirt: Shirt) {
        cart.removeAll { $0.id == shirt.id }
    }
    
    // MARK: STOCK FUNCS
    func deleteShirt(shirt: Shirt) {
        shirts.removeAll { $0.id == shirt.id }
    }
    
    func addShirt(title: String, price: Double, size: String) {
        let newShirt = Shirt(title: title, price: price, size: size)
        shirts.append(newShirt)
    }
}


