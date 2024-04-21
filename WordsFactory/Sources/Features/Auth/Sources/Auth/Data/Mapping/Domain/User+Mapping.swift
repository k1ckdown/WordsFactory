//
//  User+Mapping.swift
//
//
//  Created by Ivan Semenov on 21.04.2024.
//

extension User {

    func toDto() -> UserDTO {
        UserDTO(id: id, name: name, email: email)
    }
}
