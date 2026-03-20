//
//  People.swift
//  Assignment4MVVM
//
//  Created by Malik Muhammad on 3/20/26.
//


struct People : Decodable {
    let createdAt : String
    let firstName : String
    let avatar : String
    let lastName: String
    let email :String
    let jobtitle: String
    let favouriteColor: String
    let id: String
}

extension People: Identifiable {
    var identifiable: String {
        return id
    }
    
    
}
