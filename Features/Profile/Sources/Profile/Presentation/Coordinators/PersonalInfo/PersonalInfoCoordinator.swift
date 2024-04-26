//
//  PersonalInfoCoordinator.swift
//
//
//  Created by Ivan Semenov on 27.04.2024.
//

import Foundation

protocol PersonalInfoCoordinatorProtocol: AnyObject {
    func showError(_ message: String)
}

final class PersonalInfoCoordinator: ObservableObject {
    @Published var errorMessage: String?
}

// MARK: - PersonalInfoCoordinatorProtocol

extension PersonalInfoCoordinator: PersonalInfoCoordinatorProtocol {

    func showError(_ message: String) {
        errorMessage = message
    }
}
