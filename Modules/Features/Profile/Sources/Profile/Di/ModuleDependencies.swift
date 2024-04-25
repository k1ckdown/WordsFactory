//
//  ModuleDependencies.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
//

import UserModuleAPI

public struct ModuleDependencies {
    let userRepository: UserRepositoryProtocol

    public init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }
}
