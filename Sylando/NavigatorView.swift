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
    
    @State private var selectedTab = 0
    @StateObject private var shirtsViewModel = ShirtsViewModel()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Shop", systemImage: "tshirt.fill", value: 0) {
                ShirtListView(shirtsViewModel: shirtsViewModel)
            }
            
            
            Tab("Cart", systemImage: "cart.fill", value: 1) {
                CartView(
                    shirtsViewModel: shirtsViewModel,
                    selectedTab: $selectedTab
                )
            }
        }
        .tint(Color("AccentColor"))
    }
}

#Preview {
    NavigatorView()
}
