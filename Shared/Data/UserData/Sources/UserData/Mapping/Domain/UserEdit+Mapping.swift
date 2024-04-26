//
//  UserEdit+Mapping.swift
//
//
//  Created by Ivan Semenov on 26.04.2024.
//

import UserDomain

extension UserEdit {

    func toDto() -> UserEditDTO {
        UserEditDTO(name: name)
    }
}
