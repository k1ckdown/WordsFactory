//
//  TrainingFinishCoordinator.swift
//
//
//  Created by Ivan Semenov on 04.04.2024.
//

import Foundation

protocol TrainingFinishCoordinatorProtocol: AnyObject {
    func showQuestion()
    func showError(message: String)
}

final class TrainingFinishCoordinator: ObservableObject {

    enum Screen {
        case question
    }

    @Published var screen: Screen?
    @Published var errorMessage: String?
    private(set) var showStartHandler: (() -> Void)?

    init(showStartHandler: (() -> Void)?) {
        self.showStartHandler = showStartHandler
    }
}

// MARK: - TrainingFinishCoordinatorProtocol

extension TrainingFinishCoordinator: TrainingFinishCoordinatorProtocol {

    func showQuestion() {
        screen = .question
    }

    func showError(message: String) {
        errorMessage = message
    }
}
