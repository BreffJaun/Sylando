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
    
    var body: some View {
        Form {
            Section(header: Text("Personal Details")) {
                TextField("Company Name", text: $userViewModel.userInfo.companyName)
                TextField("Street", text: $userViewModel.userInfo.street)
                TextField("City", text: $userViewModel.userInfo.city)
            }
            
            Section {
                NavigationLink {
                    Text("Next View comes laaaater....")
                } label: {
                    Text("Next")
                        .foregroundColor(userViewModel.isValid ? .primary : .gray)
                }
                .disabled(!userViewModel.isValid)
            }
        }
        .navigationTitle("Check-Out")
    }
}
