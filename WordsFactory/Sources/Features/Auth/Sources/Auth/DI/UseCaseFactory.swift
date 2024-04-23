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

// MARK: - Auth

extension UseCaseFactory {
    
    func makeSignInUseCase() -> SignInUseCase {
        SignInUseCase(authRepository: repositoryFactory.makeAuthRepository())
    }
    
    func makeSignUpUseCase() -> SignUpUseCase {
        SignUpUseCase(
            authRepository: repositoryFactory.makeAuthRepository(),
            userRepository: repositoryFactory.makeUserRepository()
        )
    }
}

// MARK: - Validation

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
