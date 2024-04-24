//
//  CoordinatorFactoryProtocols.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

protocol TrainingStartCoordinatorFactory {
    func makeTrainingStartCoordinator() -> TrainingStartCoordinatorView<TrainingStartView>
}

protocol QuestionCoordinatorFactory {
    func makeQuestionCoordinator(showStartHandler: (() -> Void)?) -> QuestionCoordinatorView<QuestionView>
}

protocol TrainingFinishCoordinatorFactory {
    func makeTrainingFinishCoordinator(answers: [WordTestAnswer], showStartHandler: (() -> Void)?) -> TrainingFinishCoordinatorView<TrainingFinishView>
}
