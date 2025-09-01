//
//  TabBarView.swift
//  Sylando
//
//  Created by Jeff Braun on 01.09.25.
//

import SwiftUI
import SwiftData
import UIKit

struct NavigatorView: View {
    
    @StateObject private var shirtsViewModel = ShirtsViewModel()
    
    var body: some View {
        TabView {
            Tab("Shop", systemImage: "tshirt.fill") {
                ShirtListView(shirtsViewModel: shirtsViewModel)
            }
            
            Tab("Cart", systemImage: "cart.fill") {
                CartView(shirtsViewModel: shirtsViewModel)
            }
        }
        .tint(Color("AccentColor"))
    }
}

#Preview {
    NavigatorView()
}
