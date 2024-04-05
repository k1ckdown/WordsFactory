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
            getQuestions()
        case .choiceTapped:
            setNextQuestion()
        }
    }
}

// MARK: - Private methods

private extension QuestionViewModel {

    func setNextQuestion() {
        if questionNumber == answers.count {
            coordinator.showTrainingFinish(answers)
        } else {
            questionNumber += 1
            state = state.setQuestion(makeQuestionViewData(at: questionNumber))
        }
    }

    func getQuestions() {
        do {
            let questions = try getWordQuestionsUseCase.execute()
            handleQuestions(questions)
        } catch {
            state = .failed
            coordinator.showError(message: error.localizedDescription)
        }
    }

    func handleChoiceTap(key: String, questionNumber: Int) {
        answers[questionNumber - 1].key = key
        state = state.disableChoice()

        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.delayNextQuestion) {
            self.setNextQuestion()
        }
    }

    func handleQuestions(_ questions: [WordTestQuestion]) {
        guard questions.isEmpty == false else { return }

        answers = questions.map { .init(question: $0) }
        let timer = makeTimer()
        let viewData = ViewState.ViewData(
            question: makeQuestionViewData(at: questionNumber),
            totalQuestions: questions.count,
            timer: timer
        )

        state = .loaded(viewData)
        timer.startTimer()
    }

    func makeTimer() -> TimerViewModel {
        let timer = TimerViewModel()

        timer.$progress
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                if $0.isLess(than: 0) { self?.setNextQuestion() }
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

// MARK: - Constants

private extension QuestionViewModel {

    enum Constants {
        static let delayNextQuestion = 0.3
    }
}
