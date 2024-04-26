//
//  UserRegister.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

public struct UserRegister {
    public let name: String
    public let email: String
    public let password: String
    
    public init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}
