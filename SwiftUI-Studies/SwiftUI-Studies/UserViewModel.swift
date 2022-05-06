//
//  UserViewModel.swift
//  SwiftUI-Studies
//
//  Created by Arthur Rodrigues on 19/06/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import Foundation

class UserViewModel: ObservableObject {
    // Input
    @Published var username = ""
    @Published var password = ""
    @Published var passwordAgain = ""
    @Published var email = ""

    // Output
    @Published var isValid = false
}
