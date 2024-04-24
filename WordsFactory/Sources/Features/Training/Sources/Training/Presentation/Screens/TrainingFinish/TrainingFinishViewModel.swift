//
//  TrainingFinishViewModel.swift
//
//
//  Created by Ivan Semenov on 04.04.2024.
//

import Foundation
import WidgetKit
import AppGroup
import Notifications

final class TrainingFinishViewModel: ObservableObject {

    @Published private(set) var state = ViewState.idle

    private let answers: [WordTestAnswer]
    private let coordinator: TrainingFinishCoordinatorProtocol
    private let getWordTestResultUseCase: GetWordTestResultUseCase
    private let updateWordCoefficientUseCase: UpdateStudyCoefficientUseCase
    private let computeWordCoefficientUseCase: ComputeWordCoefficientUseCase

    init(
        answers: [WordTestAnswer],
        coordinator: TrainingFinishCoordinatorProtocol,
        getWordTestResultUseCase: GetWordTestResultUseCase,
        updateWordCoefficientUseCase: UpdateStudyCoefficientUseCase,
        computeWordCoefficientUseCase: ComputeWordCoefficientUseCase
    ) {
        self.answers = answers
        self.coordinator = coordinator
        self.getWordTestResultUseCase = getWordTestResultUseCase
        self.updateWordCoefficientUseCase = updateWordCoefficientUseCase
        self.computeWordCoefficientUseCase = computeWordCoefficientUseCase
    }

    func handle(_ event: Event) {
        switch event {
        case .onAppear:
            handleOnAppear()
        case .againTapped:
            coordinator.showQuestion()
        }
    }
}

// MARK: - Private methods

private extension TrainingFinishViewModel {

    func handleOnAppear() {
        TrainingNotificationManager.shared.removeForToday()
        getTestResult()
    }

    func getTestResult() {
        let testResults = getWordTestResultUseCase.execute(answers)
        Task { await handleTestResults(testResults) }
    }

    func handleTestResults(_ results: [TestWordResult]) async {
        await updateResultState(results)
        await updateStudyCoefficients(results)
    }

    @MainActor
    func updateResultState(_ results: [TestWordResult]) {
        let correctCount = results.filter { $0.isCorrect }.count
        let incorrectCount = results.count - correctCount
        state = .loaded(.init(correct: correctCount, incorrect: incorrectCount))
    }

    func updateStudyCoefficients(_ results: [TestWordResult]) async {
        do {
            try await withThrowingTaskGroup(of: Void.self) { taskGroup in
                for result in results {
                    let newCoef = computeWordCoefficientUseCase.execute(word: result.testWord, isCorrect: result.isCorrect)
                    taskGroup.addTask {
                        try await self.updateWordCoefficientUseCase.execute(wordText: result.testWord.text, coefficient: newCoef)
                    }
                }

                try await taskGroup.waitForAll()
            }

            WidgetCenter.shared.reloadTimelines(ofKind: WidgetType.dictionary.kind)
        } catch {
            await MainActor.run { coordinator.showError(message: error.localizedDescription) }
        }
    }
}
