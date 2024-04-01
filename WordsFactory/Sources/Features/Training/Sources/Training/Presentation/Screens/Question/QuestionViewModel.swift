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
    private var questions: [WordQuestion] = []
    private var cancellables = Set<AnyCancellable>()

    func handle(_ event: Event) {
        switch event {
        case .onAppear:
            fetchQuestions()
        case .choiceTapped:
            setNextQuestion()
        }
    }
}

// MARK: - Private methods

private extension QuestionViewModel {

    func handleChoiceTap(_ key: String) {
        state = state.disableChoice()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.delayNextQuestion) {
            self.setNextQuestion()
        }
    }

    func setNextQuestion() {
        guard questionNumber != questions.count else { return }

        questionNumber += 1
        state = state.setQuestion(getQuestionViewData(at: questionNumber))
    }

    func fetchQuestions() {
        questions = []
        handleQuestions(questions)
    }

    func handleQuestions(_ questions: [WordQuestion]) {
        guard questions.isEmpty == false else { return }

        let timer = makeTimer()
        let viewData = ViewState.ViewData(
            question: getQuestionViewData(at: questionNumber),
            totalQuestions: questions.count,
            timer: timer
        )

        state = .loaded(viewData)
        timer.startTimer()
    }

    func getQuestionViewData(at number: Int) -> ViewState.ViewData.Question {
        let question = questions[number - 1]
        let choices = question.choices.sorted(by: <).map { key, value in
            AnswerChoiceViewModel(key: key, value: value, chooseHandler: { self.handleChoiceTap(key) })
        }

        return .init(number: number, meaning: question.meaning, choices: choices)
    }

    func makeTimer() -> TimerViewModel {
        let timer = TimerViewModel()

        timer.$progress
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                if $0.isLess(than: 0) { self?.setNextQuestion() }
            }
            .store(in: &cancellables)

        return timer
    }
}

// MARK: - Constants

private extension QuestionViewModel {

    enum Constants {
        static let delayNextQuestion = 0.3
    }
}
