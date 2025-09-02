//
//  Shirt.swift
//  Sylando
//
//  Created by Jeff Braun on 01.09.25.
//

import Foundation

struct Shirt: Identifiable {
    let id: UUID = UUID()
    var title: String
    var price: Double
    var size: Size
}

