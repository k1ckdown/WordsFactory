//
//  QuestionViewModel.swift
//
//
//  Created by Ivan Semenov on 01.04.2024.
//

import Foundation
import Combine

final class QuestionViewModel: ObservableObject {

    @Published private(set) var state = ViewState.idle

    private var questionNumber = 1
    private var answers: [WordTestAnswer] = []
    private var subscriptions: Set<AnyCancellable> = []

    private let coordinator: QuestionCoordinatorProtocol
    private let getWordQuestionsUseCase: GetWordQuestionsUseCase

    init(coordinator: QuestionCoordinatorProtocol, getWordQuestionsUseCase: GetWordQuestionsUseCase) {
        self.coordinator = coordinator
        self.getWordQuestionsUseCase = getWordQuestionsUseCase
    }

    func handle(_ event: Event) {
        switch event {
        case .onAppear:
            Task { await getQuestions() }
        }
    }
}

// MARK: - Private methods

private extension QuestionViewModel {

    func updateQuestionState() {
        questionNumber == answers.count ? goToFinish() : setNextQuestion()
    }

    func goToFinish() {
        subscriptions.removeAll()
        coordinator.showTrainingFinish(answers)
    }

    func setNextQuestion() {
        questionNumber += 1
        state = state.setQuestion(makeQuestionViewData(at: questionNumber))
    }

    @MainActor
    func startTest(with viewData: ViewState.ViewData) {
        state = .loaded(viewData)
        viewData.timer.startTimer()
    }

    func handleChoiceTap(key: String, questionNumber: Int) {
        answers[questionNumber - 1].key = key
        state = state.disableChoice()
        updateQuestionState()
    }

    func handleQuestions(_ questions: [WordTestQuestion]) async {
        guard questions.isEmpty == false else { return }

        questionNumber = 1
        answers = questions.map { .init(question: $0) }
        await startTest(with: makeViewData())
    }

    func getQuestions() async {
        await MainActor.run { state = .loading }
        do {
            let questions = try await getWordQuestionsUseCase.execute()
            await handleQuestions(questions)
        } catch {
            await MainActor.run {
                state = .failed
                coordinator.showError(message: error.localizedDescription)
            }
        }
    }
}

// MARK: - View Data

private extension QuestionViewModel {

    func makeViewData() -> ViewState.ViewData {
        ViewState.ViewData(
            question: makeQuestionViewData(at: questionNumber),
            totalQuestions: answers.count,
            timer: makeTimer()
        )
    }

    func makeTimer() -> TimerViewModel {
        let timer = TimerViewModel()

        timer.$progress
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                if $0.isLess(than: 0) { self?.updateQuestionState() }
            }
            .store(in: &subscriptions)

        return timer
    }

    func makeQuestionViewData(at number: Int) -> ViewState.ViewData.Question {
        let question = answers[number - 1].question
        let choices = question.choices.sorted(by: <).map { key, value in
            AnswerChoiceViewModel(
                key: key,
                value: value,
                chooseHandler: { [weak self] in self?.handleChoiceTap(key: key, questionNumber: number) }
            )
        }

        return .init(number: number, definition: question.answerWord.definition, choices: choices)
    }
}
