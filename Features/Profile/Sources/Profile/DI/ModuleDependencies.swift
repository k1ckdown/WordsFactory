//
//  ModuleDependencies.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
//

import UserDomain

public struct ModuleDependencies {
    private let userRepository: UserRepositoryProtocol

    init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
}
