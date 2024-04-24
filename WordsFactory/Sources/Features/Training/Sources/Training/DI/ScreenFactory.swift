//
//  ScreenFactory.swift
//
//
//  Created by Ivan Semenov on 04.04.2024.
//

final class ScreenFactory {

    private let useCaseFactory: UseCaseFactory

    init(useCaseFactory: UseCaseFactory) {
        self.useCaseFactory = useCaseFactory
    }
}

// MARK: - Public methods

extension ScreenFactory {

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
            getDictionaryWordCountUseCase: useCaseFactory.makeGetDictionaryWordCountUseCase()
        )

        let view = TrainingStartView(viewModel: viewModel)
        return view
    }

    func makeTrainingFinishScreen(answers: [WordTestAnswer], coordinator: TrainingFinishCoordinatorProtocol) -> TrainingFinishView {
        let viewModel = TrainingFinishViewModel(
            answers: answers,
            coordinator: coordinator,
            getWordTestResultUseCase: useCaseFactory.makeGetWordTestResultUseCase(),
            updateWordCoefficientUseCase: useCaseFactory.makeUpdateStudyCoefficientUseCase(),
            computeWordCoefficientUseCase: useCaseFactory.makeComputeWordCoefficientUseCase()
        )

        let view = TrainingFinishView(viewModel: viewModel)
        return view
    }
}
