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
//    @Published var cart: [Shirt] = []
    
    func deleteShirt(shirt: Shirt) {
        shirts.removeAll { $0.id == shirt.id }
    }
    
    func addShirt(title: String, price: Double, size: Size) {
        let newShirt = Shirt(title: title, price: price, size: size)
        shirts.append(newShirt)
    }
}


