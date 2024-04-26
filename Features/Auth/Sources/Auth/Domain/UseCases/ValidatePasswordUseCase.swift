//
//  ValidatePasswordUseCase.swift
//
//
//  Created by Ivan Semenov on 23.03.2024.
//

import Foundation

final class ValidatePasswordUseCase {

    func execute(_ password: String) throws {
        guard password.isEmpty == false else {
            throw PasswordValidationError.isRequired
        }

        guard password.count >= Constants.minPasswordLength else {
            throw PasswordValidationError.invalidPassword
        }
    }
}

// MARK: Validation error

extension ValidatePasswordUseCase {

    enum PasswordValidationError: LocalizedError {
        case isRequired
        case invalidPassword

        var errorDescription: String? {
            switch self {
            case .isRequired:
                Strings.passwordIsRequired
            case .invalidPassword:
                Strings.invalidPassword(Constants.minPasswordLength)
            }
        }
    }
}

// MARK: - Constants

private extension ValidatePasswordUseCase {

    enum Constants {
        static let minPasswordLength = 6
    }
}
