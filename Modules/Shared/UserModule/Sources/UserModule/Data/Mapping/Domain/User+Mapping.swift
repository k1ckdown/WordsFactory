//
//  User+Mapping.swift
//
//
//  Created by Ivan Semenov on 23.04.2024.
//

import UserModuleAPI

extension User {
    
    func toDto() -> UserDTO {
        UserDTO(id: id, name: name, email: email)
    }
}
