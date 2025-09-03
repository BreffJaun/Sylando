//
//  Quote.swift
//  Sylando
//
//  Created by Jeff Braun on 03.09.25.
//

import Foundation

struct Quote: Codable, Identifiable {
    var id: String
    var author: String
    var text: String
}


