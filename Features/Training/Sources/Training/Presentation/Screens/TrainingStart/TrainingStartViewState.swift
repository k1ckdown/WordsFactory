//
//  TrainingStartViewState.swift
//
//
//  Created by Ivan Semenov on 31.03.2024.
//

extension TrainingStartViewModel {

    enum ViewState: Equatable {
        case idle
        case failed
        case loading
        case loaded(ViewData)

        struct ViewData: Equatable {
            let wordCount: Int
            let countdown: TimerViewModel
            var isCountdownShowing = false
        }
    }

    enum Event {
        case onAppear
        case onDisappear
        case startTapped
    }
}

// MARK: - Mutating

extension TrainingStartViewModel.ViewState {

    func showCountdown() -> Self {
        guard case .loaded(var viewData) = self else { return self }

        viewData.isCountdownShowing = true
        return .loaded(viewData)
    }
}
