//
//  QuestionViewState.swift
//
//
//  Created by Ivan Semenov on 01.04.2024.
//

extension QuestionViewModel {

    enum ViewState: Equatable {
        case idle
        case failed
        case loaded(ViewData)

        struct ViewData: Equatable {
            struct Question: Equatable {
                let number: Int
                let definition: String
                let choices: [AnswerChoiceViewModel]
            }

            var question: Question
            let totalQuestions: Int
            let timer: TimerViewModel
            var isChoiceDisabled = false
        }
    }

    enum Event {
        case onAppear
    }
}

// MARK: - Mutating

extension QuestionViewModel.ViewState {
    
    func disableChoice() -> Self {
        guard case .loaded(var viewData) = self else { return self }

        viewData.isChoiceDisabled = true
        viewData.timer.pauseTimer()

        return .loaded(viewData)
    }

    func setQuestion(_ question: ViewData.Question) -> Self {
        guard case .loaded(var viewData) = self else { return self }

        viewData.question = question
        viewData.timer.repeatTimer()
        viewData.isChoiceDisabled = false

        return .loaded(viewData)
    }
}
