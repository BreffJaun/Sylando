//
//  UserInforView.swift
//  Sylando
//
//  Created by Jeff Braun on 01.09.25.
//

import SwiftUI

struct UserInfoView: View {
    
    @EnvironmentObject var userViewModel: UserInfoViewModel
    
    @Binding var selectedTab: Int
    @Binding var path: NavigationPath
    
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
                    TextField("Name", text: $userViewModel.userInfo.name)
                    TextField("Street", text: $userViewModel.userInfo.street)
                    TextField("City", text: $userViewModel.userInfo.city)
                } header: {
                    Text("Personal Details")
                }
                
                Section {
                    Button {
                        path.append(CartRoute.summary)
                    } label: {
                        Text("Next")
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
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


