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
            AsyncImage(url: URL(string:user.avatar_url)){ phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.white, lineWidth: 4))
                        .shadow(radius: 7)
                        // Displays the loaded image.
                    } else if phase.error != nil {
                        Image(systemName: "person") // Indicates an error.
                    } else {
                        ProgressView() // Acts as a placeholder.
                    }
            }
            .frame(width: 72, height: 72)
            Spacer()
            Text(user.login).bold().font(.title)
        }
    }
}
