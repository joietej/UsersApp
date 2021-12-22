//
//  UserList.swift
//  UsersApp
//
//  Created by Tejas Sahasrabudhe on 22/12/21.
//

import SwiftUI

struct UserList: View {
    @Binding var userSearchString: String
    var users: [User]
    var body: some View {
        List(users,id:\.id){user in
            NavigationLink {
                UserDetails(user: user)
            } label: {
                UserRow(user: user)
            }
        }
        .searchable(text: $userSearchString)
    }
}
