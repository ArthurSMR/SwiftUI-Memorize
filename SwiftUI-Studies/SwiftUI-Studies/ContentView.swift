//
//  ContentView.swift
//  SwiftUI-Studies
//
//  Created by Arthur Rodrigues on 19/06/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Username", text: $userViewModel.username).autocapitalization(.none)
                }
                Section {
                    SecureField("Password", text: $userViewModel.password)
                    SecureField("Password again", text: $userViewModel.passwordAgain)
                }
                Section {
                    Button(action: {}, label: {
                        Text("Sign Up")
                    }).disabled(!userViewModel.isValid)
                }
            }
            .navigationBarTitle(Text("Login"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
