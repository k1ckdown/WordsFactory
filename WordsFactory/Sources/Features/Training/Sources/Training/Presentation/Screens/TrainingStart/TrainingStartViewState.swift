//
//  TrainingStartViewState.swift
//
//
//  Created by Ivan Semenov on 31.03.2024.
//

extension TrainingStartViewModel {

    enum ViewState: Equatable {
        case idle
        case loaded(ViewData)

        struct ViewData: Equatable {
            let totalWords: Int
            var countdownDuration: Double?
        }
    }

    enum Event {
        case onAppear
        case startTapped
        case countdownUpdated(Double)
    }
}

// MARK: - Mutating

extension TrainingStartViewModel.ViewState {

    func startCountDown(_ duration: Double) -> Self {
        guard case .loaded(var viewData) = self else { return self }

        viewData.countdownDuration = duration
        return .loaded(viewData)
    }
}
