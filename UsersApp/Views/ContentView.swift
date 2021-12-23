//
//  ContentView.swift
//  FooApp
//
//  Created by Tejas Sahasrabudhe on 05/11/21.
//

import SwiftUI



struct ContentView: View {
    
    @EnvironmentObject var store: UserStore
    @State private var userSearchString = ""
    @State private var isGridView = false
    var users : [User] {
        store.users.filter { user in
            userSearchString == "" ? true : user.login.contains(userSearchString.lowercased())
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridView {
                    UserList(userSearchString: $userSearchString, users: users)
                } else {
                    UserGrid(userSearchString: $userSearchString, users: users)
                }
            }
            .task {
                await store.loadUsers()
            }.navigationTitle("People").refreshable {
                await store.loadUsers()
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Toggle("Grid View", isOn: $isGridView)
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}



struct ContentView_Previews:
    PreviewProvider {
    static var previews: some View {
        NavigationView {
            List{
                Text("Foo")
                Text("Foo")
                Text("Foo")
                Text("Foo")
                Text("Foo")
            }.navigationTitle("Foo")
                .toolbar {
                    ToolbarItem(placement:.navigationBarLeading) {
                        Text("One")
                       
                    }
                    ToolbarItem(placement:.navigationBarTrailing) {
                        Text("Two")
                    }
                }
        }
        
    }
}
