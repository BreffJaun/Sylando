//
//  UserInfoViewModel.swift
//  Sylando
//
//  Created by Jeff Braun on 01.09.25.
//

import Foundation

class UserInfoViewModel: ObservableObject {
    
    @Published var userInfo = UserInfo(name: "", street: "", city: "")
    
    var isValid: Bool {
        !userInfo.name.isEmpty &&
        !userInfo.street.isEmpty &&
        !userInfo.city.isEmpty
    }
    
    func reset() {
        userInfo = UserInfo(name: "", street: "", city: "")
    }
}
