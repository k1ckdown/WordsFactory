//
//  ScreenFactoryProtocols.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

protocol QuestionCoordinatorFactory {
    func makeQuestionCoordinator() -> QuestionCoordinatorView<QuestionView>
}

protocol TrainingStartCoordinatorFactory {
    func makeTrainingStartCoordinator() -> TrainingStartCoordinatorView<TrainingStartView>
}
