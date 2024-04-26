//
//  ProfileCoordinator.swift
//
//
//  Created by Ivan Semenov on 26.04.2024.
//

import Foundation

protocol ProfileCoordinatorProtocol: AnyObject {
    func showPersonalInfo()
    func showMyDictionary()
}

final class ProfileCoordinator: ObservableObject {

    enum Screen {
        case personalInfo
        case myDictionary
    }

    @Published var screen: Screen?
}

// MARK: - ProfileCoordinatorProtocol

extension ProfileCoordinator: ProfileCoordinatorProtocol {

    func showPersonalInfo() {
        screen = .personalInfo
    }

    func showMyDictionary() {
        screen = .myDictionary
    }
}
