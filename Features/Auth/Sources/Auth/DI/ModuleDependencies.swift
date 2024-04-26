//
//  ModuleDependencies.swift
//
//
//  Created by Ivan Semenov on 23.04.2024.
//

import AuthDomain
import UserDomain

public struct ModuleDependencies {
    let authRepository: AuthRepositoryProtocol
    let userRepository: UserRepositoryProtocol
    let flowFinishHandler: () -> Void

    public init(
        authRepository: AuthRepositoryProtocol,
        userRepository: UserRepositoryProtocol,
        flowFinishHandler: @escaping () -> Void
    ) {
        self.authRepository = authRepository
        self.userRepository = userRepository
        self.flowFinishHandler = flowFinishHandler
    }
}
