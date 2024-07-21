//
//  SchoolAppApp.swift
//  SchoolApp
//
//  Created by Esse Jacques  on 20/07/2024.
//

import SwiftUI

@main
struct SchoolAppApp: App {
    
    @State var email: String = ""
    @State var password: String = ""
    var body: some Scene {
        WindowGroup {
            SignInView(email: $email, password: $password)
        }
    }
}
