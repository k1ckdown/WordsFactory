//
//  CoordinatorFactory.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import Foundation

final class CoordinatorFactory {

    private let screenFactory: ScreenFactory

    init(screenFactory: ScreenFactory) {
        self.screenFactory = screenFactory
    }
}

// MARK: - TrainingStartCoordinatorFactory

extension CoordinatorFactory: TrainingStartCoordinatorFactory {
    func makeTrainingStartCoordinator() -> TrainingStartCoordinatorView<TrainingStartView> {
        let coordinator = TrainingStartCoordinator()
        let coordinatorView = TrainingStartCoordinatorView(
            factory: self,
            content: self.screenFactory.makeTrainingStartScreen(coordinator: coordinator),
            coordinator: coordinator
        )

        return coordinatorView
    }
}

// MARK: - QuestionCoordinatorFactory

extension CoordinatorFactory: QuestionCoordinatorFactory {
    func makeQuestionCoordinator(showStartHandler: (() -> Void)?) -> QuestionCoordinatorView<QuestionView> {
        let coordinator = QuestionCoordinator(showStartHandler: showStartHandler)
        let coordinatorView = QuestionCoordinatorView(
            factory: self,
            content: self.screenFactory.makeQuestionScreen(coordinator: coordinator),
            coordinator: coordinator
        )

        return coordinatorView
    }
}

// MARK: - TrainingFinishCoordinatorFactory

extension CoordinatorFactory: TrainingFinishCoordinatorFactory {
    func makeTrainingFinishCoordinator(answers: [WordTestAnswer], showStartHandler: (() -> Void)?) -> TrainingFinishCoordinatorView<TrainingFinishView> {
        let coordinator = TrainingFinishCoordinator(showStartHandler: showStartHandler)
        let coordinatorView = TrainingFinishCoordinatorView(
            content: self.screenFactory.makeTrainingFinishScreen(answers: answers, coordinator: coordinator),
            coordinator: coordinator
        )

        return coordinatorView
    }
}
