//
//  ValidateUsernameUseCase.swift
//
//
//  Created by Ivan Semenov on 23.03.2024.
//

import Foundation

final class ValidateUsernameUseCase {

    func execute(_ username: String) throws {
        guard username.isEmpty == false else {
            throw UsernameValidationError.isRequired
        }

        let usernamePredicate = NSPredicate(
            format: Constants.formatString,
            Constants.regex
        )

        guard usernamePredicate.evaluate(with: username) else {
            throw UsernameValidationError.invalidUsername
        }
    }
}

// MARK: Validation error

extension ValidateUsernameUseCase {

    enum UsernameValidationError: LocalizedError {
        case isRequired
        case invalidUsername

        var errorDescription: String? {
            switch self {
            case .isRequired: Strings.usernameIsRequired
            case .invalidUsername: Strings.invalidUsername
            }
        }
    }
}

// MARK: - Constants

private extension ValidateUsernameUseCase {

    enum Constants {
        static let formatString = "SELF MATCHES %@"
        static let regex = "[a-zA-Z0-9]+"
    }
}
