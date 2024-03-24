//
//  UserMapper.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

enum UserMapper {

    static func toDto(_ source: User) -> UserDTO {
        UserDTO(
            id: source.id,
            name: source.name,
            email: source.email
        )
    }

    static func toDomain(_ source: UserDTO) -> User {
        User(
            id: source.id,
            name: source.name,
            email: source.email
        )
    }
}
