//
//  TrainingFinishCoordinator.swift
//
//
//  Created by Ivan Semenov on 04.04.2024.
//

import Foundation

protocol TrainingFinishCoordinatorProtocol: AnyObject {
    func showError(message: String)
}

final class TrainingFinishCoordinator: ObservableObject {
    @Published var errorMessage: String?
}

// MARK: - TrainingFinishCoordinatorProtocol

extension TrainingFinishCoordinator: TrainingFinishCoordinatorProtocol {

    func showError(message: String) {
        errorMessage = message
    }
}
