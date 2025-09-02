//
//  CartViewModel.swift
//  Sylando
//
//  Created by Jeff Braun on 01.09.25.
//

import SwiftUI

@MainActor
class CartViewModel: ObservableObject {
    
    @Published var path = NavigationPath()
    
    @Published var cartItems: [Shirt] = [
        Shirt(title: "Grey Henley Shirt", price: 27.49, size: .m),
        Shirt(title: "Yellow Summer Tee", price: 20.99, size: .l),
        Shirt(title: "Navy Blue Long Sleeve", price: 32.99, size: .m)
    ]
    
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + $1.price }
    }
    
    func addToCart(_ shirt: Shirt) {
        cartItems.append(shirt)
    }
    
    func removeFromCart(_ shirt: Shirt) {
        cartItems.removeAll { $0.id == shirt.id }
    }
    
    func clearCart() {
        cartItems = []
    }
    
    func completePurchase(userViewModel: UserInfoViewModel) {
        clearCart()
        userViewModel.reset()
    }
    
    func finalizePurchase(userViewModel: UserInfoViewModel, selectedTab: inout Int) {
        clearCart()
        userViewModel.reset()
        selectedTab = 0
        path = NavigationPath()
    }
}
