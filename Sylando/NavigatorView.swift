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
    
    @StateObject private var cartViewModel = CartViewModel()
    @StateObject private var shirtsViewModel: ShirtsViewModel
    @StateObject private var userViewModel = UserInfoViewModel()
    
    @State private var selectedTab = 0
    
    init(useLocalRepsitory: Bool) {
        if useLocalRepsitory {
            _shirtsViewModel = StateObject(wrappedValue: ShirtsViewModel(repository: LocalQuoteRepository()))
        } else {
            _shirtsViewModel = StateObject(wrappedValue: ShirtsViewModel(repository: RemoteQuoteRepository()))
        }
    }
    
    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            
            TabView(selection: $selectedTab) {
                Tab("Shop", systemImage: "tshirt.fill", value: 0) {
                    ShirtListView()
                }
                
                
                Tab("Cart", systemImage: "cart.fill", value: 1) {
                    CartView(selectedTab: $selectedTab)
                }
            }
            .environmentObject(shirtsViewModel)
            .environmentObject(cartViewModel)
            .environmentObject(userViewModel)
            .tint(Color("AccentColor"))
        }
    }
}

#Preview {
    NavigatorView(useLocalRepsitory: true)
}

