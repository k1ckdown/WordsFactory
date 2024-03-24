//
//  UseCaseFactory.swift
//
//
//  Created by Ivan Semenov on 23.03.2024.
//

final class UseCaseFactory {
    
    private let repositoryFactory: RepositoryFactory
    
    init(repositoryFactory: RepositoryFactory) {
        self.repositoryFactory = repositoryFactory
    }
}

// MARK: - Factory methods

extension UseCaseFactory {
    
    func makeValidateEmailUseCase() -> ValidateEmailUseCase {
        ValidateEmailUseCase()
    }
    
    func makeValidatePasswordUseCase() -> ValidatePasswordUseCase {
        ValidatePasswordUseCase()
    }
    
    func makeValidateUsernameUseCase() -> ValidateUsernameUseCase {
        ValidateUsernameUseCase()
    }
}
