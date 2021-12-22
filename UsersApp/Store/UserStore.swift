//
//  UserStore.swift
//  FooApp
//
//  Created by Tejas Sahasrabudhe on 22/12/21.
//

import Foundation


class UserStore: ObservableObject {
    
    private let USERS_URL = "https://api.github.com/users"
    
    @Published var users = [User]()
    @Published var repos = [Int: [Repo]]()
    
    func loadUsers() async {
        
        let data:[User]? = await fetch(USERS_URL)
        
        guard let data = data else {
            return
        }
        
        DispatchQueue.main.async {
            self.users = data
        }
    }
    
    func loadRepos(user: User) async {
        
        if repos.keys.contains(user.id) {
            return;
        }
        
        let data:[Repo]? = await fetch(user.repos_url)
        
        guard let data = data else {
            return
        }
        
        DispatchQueue.main.async {
            self.repos[user.id] = data
        }
        
    }
}
