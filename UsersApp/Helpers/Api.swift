//
//  Api.swift
//  FooApp
//
//  Created by Tejas Sahasrabudhe on 21/12/21.
//

import Foundation


func fetch<T: Decodable> (_ from: String ) async -> T? {
    
    guard let url = URL(string:from) else {
        return nil
    }
    
    let res = try? await URLSession.shared.data(from: url)
    
    guard let response = res?.1 as? HTTPURLResponse else {
        return nil
    }
    
    if response.statusCode != 200 {
        return nil
    }
    
    guard let data = res?.0 else {
        return nil
    }
        
    let results = try! JSONDecoder().decode(T.self,from: data)
    
    return results
}
