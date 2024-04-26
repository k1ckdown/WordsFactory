//
//  User.swift
//
//
//  Created by Ivan Semenov on 23.04.2024.
//

public struct User {
    public let id: String
    public let name: String
    public let email: String

    public init(id: String, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}
