//
//  QuestionCoordinator.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import Foundation
import CommonUI

protocol QuestionCoordinatorProtocol: AnyObject {
    func showError(message: String)
    func showTrainingFinish(_ answers: [WordTestAnswer])
}

final class QuestionCoordinator: ObservableObject {

    enum Screen: Routable {
        case trainingFinish
        case trainingFinishParameterized([WordTestAnswer])

        static var allCases: [QuestionCoordinator.Screen] = [.trainingFinish]

        var navigationLink: Screen {
            switch self {
            case .trainingFinishParameterized: .trainingFinish
            default: self
            }
        }
    }

    @Published var screen: Screen?
    @Published var errorMessage: String?
    private(set) var showStartHandler: (() -> Void)?

    init(showStartHandler: (() -> Void)?) {
        self.showStartHandler = showStartHandler
    }
}

// MARK: - QuestionCoordinatorProtocol

extension QuestionCoordinator: QuestionCoordinatorProtocol {

    func showError(message: String) {
        errorMessage = message
    }

    func showTrainingFinish(_ answers: [WordTestAnswer]) {
        screen = .trainingFinishParameterized(answers)
    }
}
