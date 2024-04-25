//
//  ModuleDependencies.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
//

import UserModuleAPI

public typealias GetUserUseCaseProvider = () -> GetUserUseCaseProtocol

public struct ModuleDependencies {
    let getUserUseCaseProvider: GetUserUseCaseProvider

    public init(getUserUseCase: @autoclosure @escaping GetUserUseCaseProvider) {
        self.getUserUseCaseProvider = getUserUseCase
    }
}
