//
//  UseCaseFactory.swift
//
//
//  Created by Ivan Semenov on 23.03.2024.
//

final class UseCaseFactory {

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
