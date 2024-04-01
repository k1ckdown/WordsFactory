//
//  TrainingStartViewState.swift
//
//
//  Created by Ivan Semenov on 31.03.2024.
//

import Foundation

extension TrainingStartViewModel {

    enum ViewState: Equatable {
        case idle
        case failed
        case loaded(ViewData)

        struct ViewData: Equatable {
            let totalWords: Int
            let countdown: TimerViewModel
            var isCountdownShowing = false
        }
    }

    enum Event {
        case onAppear
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
