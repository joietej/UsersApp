//
//  ContentView.swift
//  FooApp
//
//  Created by Tejas Sahasrabudhe on 05/11/21.
//

import SwiftUI



struct ContentView: View {
    
    @EnvironmentObject var store: UserStore
    
    var body: some View {
        NavigationView {
            List(store.users,id:\.id){user in
                NavigationLink {
                    UserDetails(user: user)
                } label: {
                    UserRow(user: user)
                }
            }
            .task {
                await store.loadUsers()
            }.navigationTitle("People").refreshable {
                await store.loadUsers()
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserStore())
        
    }
}
