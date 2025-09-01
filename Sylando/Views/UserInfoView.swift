//
//  UserInforView.swift
//  Sylando
//
//  Created by Jeff Braun on 01.09.25.
//

import SwiftUI

struct UserInfoView: View {
    
    @ObservedObject var shirtsViewModel: ShirtsViewModel
    @StateObject var userViewModel = UserInfoViewModel()
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.65, green: 0.85, blue: 1.0),
                    Color(red: 0.45, green: 0.75, blue: 0.95),
                    Color(red: 0.60, green: 0.55, blue: 0.90)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
            Form {
                Section {
                    TextField("Company Name", text: $userViewModel.userInfo.companyName)
                    TextField("Street", text: $userViewModel.userInfo.street)
                    TextField("City", text: $userViewModel.userInfo.city)
                } header: {
                    Text("Personal Details")
                }
                
                Section {
                    NavigationLink {
                        CheckoutSummaryView(
                            shirtsViewModel: shirtsViewModel,
                            userViewModel: userViewModel,
                            selectedTab: $selectedTab
                        )
                    } label: {
                        Text("Next")
                            .foregroundStyle(userViewModel.isValid ? .primary : Color.gray)
                    }
                    .disabled(!userViewModel.isValid)
                }
            }
            .scrollContentBackground(.hidden)
            .background(.clear)
            .navigationTitle("Checkout")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}
