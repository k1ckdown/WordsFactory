//
//  ProfileCoordinator.swift
//
//
//  Created by Ivan Semenov on 26.04.2024.
//

import Foundation
import CommonUI
import UserDomain

protocol ProfileCoordinatorProtocol: AnyObject {
    func showError(message: String)
    func showMyDictionary()
    func showPersonalInfo(with user: User)
}

final class ProfileCoordinator: ObservableObject {

    enum Screen: Routable {
        case myDictionary
        case personalInfo
        case personalInfoParameterized(User)

        static var allCases: [ProfileCoordinator.Screen] = [.myDictionary, .personalInfo]

        var navigationLink: ProfileCoordinator.Screen {
            switch self {
            case .personalInfoParameterized: .personalInfo
            default: self
            }
        }
    }

    @Published var screen: Screen?
    @Published var errorMessage: String?
}

// MARK: - ProfileCoordinatorProtocol

extension ProfileCoordinator: ProfileCoordinatorProtocol {

    func showError(message: String) {
        errorMessage = message
    }

    func showMyDictionary() {
        screen = .myDictionary
    }

    func showPersonalInfo(with user: User) {
        screen = .personalInfoParameterized(user)
    }
}
