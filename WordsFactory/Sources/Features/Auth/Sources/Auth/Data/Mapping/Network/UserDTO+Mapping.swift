//
//  UserDTO+Mapping.swift
//
//
//  Created by Ivan Semenov on 21.04.2024.
//

extension UserDTO {

    func toDomain() -> User {
        User(id: id, name: name, email: email)
    }
}
