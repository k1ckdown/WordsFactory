//
//  ModuleDependencies.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
//

import AuthDomain
import UserDomain

public struct ModuleDependencies {
    let userRepository: UserRepositoryProtocol
    let authRepository: AuthRepositoryProtocol

    public init(userRepository: UserRepositoryProtocol, authRepository: AuthRepositoryProtocol) {
        self.userRepository = userRepository
        self.authRepository = authRepository
    }
}
