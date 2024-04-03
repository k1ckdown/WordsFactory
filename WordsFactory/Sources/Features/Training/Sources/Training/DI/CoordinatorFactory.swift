//
//  CoordinatorFactory.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import Foundation

final class CoordinatorFactory {

    private let useCaseFactory: UseCaseFactory

    init(useCaseFactory: UseCaseFactory) {
        self.useCaseFactory = useCaseFactory
    }
}

// MARK: - TrainingStartCoordinatorFactory

extension CoordinatorFactory: TrainingStartCoordinatorFactory {
    func makeTrainingStartCoordinator() -> TrainingStartCoordinatorView<TrainingStartView> {
        let coordinator = TrainingStartCoordinator()
        let coordinatorView = TrainingStartCoordinatorView(
            factory: self,
            content: self.makeTrainingStartScreen(coordinator: coordinator),
            coordinator: coordinator
        )

        return coordinatorView
    }
}

// MARK: - QuestionCoordinatorFactory

extension CoordinatorFactory: QuestionCoordinatorFactory {
    func makeQuestionCoordinator() -> QuestionCoordinatorView<QuestionView> {
        let coordinator = QuestionCoordinator()
        let coordinatorView = QuestionCoordinatorView(
            factory: self,
            content: self.makeQuestionScreen(coordinator: coordinator),
            coordinator: coordinator
        )

        return coordinatorView
    }
}

// MARK: - Screens

private extension CoordinatorFactory {

    func makeQuestionScreen(coordinator: QuestionCoordinatorProtocol) -> QuestionView {
        let viewModel = QuestionViewModel(
            coordinator: coordinator,
            getWordQuestionsUseCase: useCaseFactory.makeGetWordQuestionsUseCase()
        )

        let view = QuestionView(viewModel: viewModel)
        return view
    }

    func makeTrainingStartScreen(coordinator: TrainingStartCoordinatorProtocol) -> TrainingStartView {
        let viewModel = TrainingStartViewModel(
            coordinator: coordinator,
            getTotalDictionaryWordsUseCase: useCaseFactory.makeGetTotalDictionaryWordsUseCase()
        )

        let view = TrainingStartView(viewModel: viewModel)
        return view
    }
}
