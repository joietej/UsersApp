//
//  UserDetails.swift
//  FooApp
//
//  Created by Tejas Sahasrabudhe on 22/12/21.
//
import SwiftUI

struct UserDetails : View {
    @State private var isLoading =  false
    
    @EnvironmentObject var store: UserStore
    
    var user : User
    
    private var repos: [Repo] {
        return store.repos.keys.contains(user.id) ? store.repos[user.id]! : [Repo]()
    }
    
    var body: some View {
        VStack {
            
            if isLoading {
                ProgressView("fetching repos...").font(.title)
            }
            else {
                Text(user.login).bold().font(.title)
                List(repos, id: \.id){ repo in
                    HStack {
                        Link(repo.name, destination: URL(string: repo.html_url)!)
                            .font(.subheadline)
                        Spacer()
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                        Text("\(repo.stargazers_count)")
                    }
                }
            }
        }.task {
            isLoading = true
            await store.loadRepos(user: user)
            isLoading = false
        }
    }
}
