//
//  UserDTO+Mapping.swift
//
//
//  Created by Ivan Semenov on 23.04.2024.
//

import UserDomain

extension UserDTO {

    func toDomain() -> User {
        User(id: id, name: name, email: email)
    }
}
