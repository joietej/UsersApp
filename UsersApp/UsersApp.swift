//
//  UsersApp.swift
//  UsersApp
//
//  Created by Tejas Sahasrabudhe on 22/12/21.
//

import SwiftUI

@main
struct UsersApp: App {
    var store = UserStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .foregroundColor(.mint)
                .accentColor(.mint)
                .tint(.mint)
                .preferredColorScheme(.dark)
        }
    }
}
