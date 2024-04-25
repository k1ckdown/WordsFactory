//
//  UseCaseFactory.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
//

import UserModuleAPI

final class UseCaseFactory {

    private let getUserUseCaseProvider: GetUserUseCaseProvider
    
    init(getUserUseCaseProvider: @escaping GetUserUseCaseProvider) {
        self.getUserUseCaseProvider = getUserUseCaseProvider
    }
}

// MARK: - Public methods

extension UseCaseFactory {

    func makeGetUserUseCase() -> GetUserUseCaseProtocol {
        getUserUseCaseProvider()
    }
}
