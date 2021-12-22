//
//  Avatar.swift
//  UsersApp
//
//  Created by Tejas Sahasrabudhe on 23/12/21.
//

import SwiftUI

struct Avatar: View {
    var avatar_url:String
    var body: some View {
        AsyncImage(url: URL(string:avatar_url)){ phase in
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
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(avatar_url: "https://avatars.githubusercontent.com/u/1?v=4")
    }
}
