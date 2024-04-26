//
//  ModuleDependencies.swift
//
//
//  Created by Ivan Semenov on 23.04.2024.
//

import UserDomain

public struct ModuleDependencies {
    let flowFinishHandler: () -> Void
    let userRepository: UserRepositoryProtocol

    public init(flowFinishHandler: @escaping () -> Void, userRepository: UserRepositoryProtocol) {
        self.flowFinishHandler = flowFinishHandler
        self.userRepository = userRepository
    }
}
