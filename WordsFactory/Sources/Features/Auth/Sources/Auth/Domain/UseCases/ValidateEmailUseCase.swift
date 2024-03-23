//
//  ValidateEmailUseCase.swift
//
//
//  Created by Ivan Semenov on 23.03.2024.
//

import Foundation

final class ValidateEmailUseCase {

    func execute(_ email: String) throws {
        guard email.isEmpty == false else {
            throw EmailValidationError.isRequired
        }

        guard isValidUsername(email) else {
            throw EmailValidationError.invalidUsername
        }

        guard isContainsKeySign(email) else {
            throw EmailValidationError.missingKeySign
        }

        guard isValidDomainPart(email) else {
            throw EmailValidationError.invalidDomainPart
        }

        guard isValidTopLevelDomain(email) else {
            throw EmailValidationError.invalidTopLevelDomain
        }
    }
}

// MARK: - Validation error

extension ValidateEmailUseCase {

    enum EmailValidationError: LocalizedError {
        case isRequired
        case invalidUsername
        case missingKeySign
        case invalidDomainPart
        case invalidTopLevelDomain

        var errorDescription: String? {
            switch self {
            case .isRequired: Strings.emailIsRequired
            case .missingKeySign: Strings.missingKeySign
            default: Strings.invalidEmail
            }
        }
    }
}

// MARK: - Private methods

private extension ValidateEmailUseCase {

    func isContainsKeySign(_ email: String) -> Bool {
        email.contains("@")
    }

    func getEmailUsernamePart(_ email: String) -> String {
        email.components(separatedBy: "@").first ?? ""
    }

    func getEmailTopLevelDomain(_ email: String) -> String {
        email.components(separatedBy: ".").last ?? ""
    }

    func getEmailDomainPart(_ email: String) -> String {
        guard let index = email.firstIndex(of: "@") else { return "" }
        let substring = email[email.index(after: index)...]

        return substring.components(separatedBy: ".").first ?? ""
    }

    func isValidUsername(_ email: String) -> Bool {
        let usernamePartPredicate = NSPredicate(
            format: Constants.formatString,
            Constants.usernamePartRegex
        )

        return usernamePartPredicate.evaluate(with: getEmailUsernamePart(email))
    }

    func isValidDomainPart(_ email: String) -> Bool {
        let domainPartPredicate = NSPredicate(
            format: Constants.formatString,
            Constants.domainPartRegex
        )

        return domainPartPredicate.evaluate(with: getEmailDomainPart(email))
    }

    func isValidTopLevelDomain(_ email: String) -> Bool {
        let topLevelDomainPredicate = NSPredicate(
            format: Constants.formatString,
            Constants.topLevelDomainRegex
        )

        return topLevelDomainPredicate.evaluate(with: getEmailTopLevelDomain(email))
    }
}

// MARK: - Constants

private extension ValidateEmailUseCase {

    enum Constants {
        static let formatString = "SELF MATCHES %@"
        static let usernamePartRegex = "[A-Z0-9a-z._%+-]+"
        static let domainPartRegex = "[A-Za-z0-9.-]+"
        static let topLevelDomainRegex = "^[A-Za-z]{2,64}"
    }
}
