//
//  TrainingFinishViewModel.swift
//
//
//  Created by Ivan Semenov on 04.04.2024.
//

import Foundation
import WidgetKit
import WordModuleAPI
import Notifications

final class TrainingFinishViewModel: ObservableObject {

    @Published private(set) var state = ViewState.idle

    private let answers: [WordTestAnswer]
    private let coordinator: TrainingFinishCoordinatorProtocol
    private let getWordTestResultUseCase: GetWordTestResultUseCase
    private let handleWordTestResultUseCase: HandleWordTestResultUseCase

    init(
        answers: [WordTestAnswer],
        coordinator: TrainingFinishCoordinatorProtocol,
        getWordTestResultUseCase: GetWordTestResultUseCase,
        handleWordTestResultUseCase: HandleWordTestResultUseCase
    ) {
        self.answers = answers
        self.coordinator = coordinator
        self.getWordTestResultUseCase = getWordTestResultUseCase
        self.handleWordTestResultUseCase = handleWordTestResultUseCase
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
        let testResult = getWordTestResultUseCase.execute(answers)
        Task { await handleTestResult(testResult) }

        state = .loaded(.init(correct: testResult.correct.count, incorrect: testResult.incorrect.count))
    }

    func handleTestResult(_ result: WordTestResult) async {
        do {
            try await handleWordTestResultUseCase.execute(result)
            WidgetCenter.shared.reloadTimelines(ofKind: WidgetType.dictionary.kind)
        } catch {
            await MainActor.run { coordinator.showError(message: error.localizedDescription) }
        }
    }
}
