//
//  Model.swift
//  FooApp
//
//  Created by Tejas Sahasrabudhe on 20/12/21.
//

import Foundation

struct User : Identifiable, Decodable {
    let id: Int
    let login: String
    let avatar_url: String
    let repos_url: String
}

struct Repo: Identifiable, Decodable {
    let id: Int
    let name: String
    let html_url: String
    let stargazers_count: Int
}
