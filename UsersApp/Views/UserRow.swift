//
//  UserRow.swift
//  FooApp
//
//  Created by Tejas Sahasrabudhe on 22/12/21.
//

import SwiftUI

struct UserRow : View {
    var user : User
    var body: some View {
        HStack(spacing: 10) {
            Avatar(avatar_url: user.avatar_url)
            Spacer()
            Text(user.login)
                .bold()
                .font(.title)
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }
    }
}

struct UserCell : View {
    var user : User
    var body: some View {
        VStack(spacing: 10) {
            Avatar(avatar_url: user.avatar_url)
            Text(user.login)
                .bold()
                .font(.subheadline)
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: User(id: 1, login: "realy realy long name that will scale ", avatar_url: "https://avatars.githubusercontent.com/u/1?v=4", repos_url: ""))
    }
}
