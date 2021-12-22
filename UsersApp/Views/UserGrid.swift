//
//  UserGrid.swift
//  UsersApp
//
//  Created by Tejas Sahasrabudhe on 23/12/21.
//

import SwiftUI

struct UserGrid: View {
    @Binding var userSearchString: String
    var users: [User]
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(users) { user in
                    NavigationLink {
                        UserDetails(user: user)
                    } label: {
                        UserCell(user: user)
                    }
                }
            }.searchable(text: $userSearchString)
        }
    }
}
