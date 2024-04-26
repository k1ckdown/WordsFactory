//
//  User.swift
//
//
//  Created by Ivan Semenov on 23.04.2024.
//

import Foundation

public struct User: Hashable {
    public let id: String
    public let name: String
    public let email: String
    public let joinDate: Date

    public init(id: String, name: String, email: String, joinDate: Date) {
        self.id = id
        self.name = name
        self.email = email
        self.joinDate = joinDate
    }
}
