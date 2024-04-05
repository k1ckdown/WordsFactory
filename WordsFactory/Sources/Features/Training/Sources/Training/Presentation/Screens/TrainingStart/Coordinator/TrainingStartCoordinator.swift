//
//  TrainingStartCoordinator.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import Foundation
import CommonUI

protocol TrainingStartCoordinatorProtocol: AnyObject {
    func showQuestion()
}

final class TrainingStartCoordinator: ObservableObject {

    enum Screen: Routable {
        case question
    }

    @Published var screen: Screen?
}

extension TrainingStartCoordinator: TrainingStartCoordinatorProtocol {

    func showQuestion() {
        screen = .question
    }
}
