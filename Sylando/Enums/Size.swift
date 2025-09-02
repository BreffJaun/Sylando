//
//  Size.swift
//  Sylando
//
//  Created by Jeff Braun on 02.09.25.
//

import Foundation

enum Size: String, Identifiable, CaseIterable {
    case xs, s, m, l, xl
    
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .xs: "XS"
        case .s: "S"
        case .m: "M"
        case .l: "L"
        case .xl: "XL"
        }
    }
}
