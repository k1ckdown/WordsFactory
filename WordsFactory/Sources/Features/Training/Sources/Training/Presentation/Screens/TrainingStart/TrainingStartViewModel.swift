//
//  TrainingStartViewModel.swift
//
//
//  Created by Ivan Semenov on 31.03.2024.
//

import Foundation

final class TrainingStartViewModel: ObservableObject {

    @Published private(set) var state = ViewState.idle

    func handle(_ event: Event) {
        switch event {
        case .onAppear:
            getTotalWords()
        case .startTapped:
            handleStartTap()
        }
    }
}

// MARK: - Private methods

private extension TrainingStartViewModel {

    func getTotalWords() {
        let totalWords = 25
        state = .loaded(.init(totalWords: totalWords, countdown: makeTimer()))
    }

    func makeTimer() -> TimerViewModel {
        let timer = TimerViewModel(total: Constants.countdownDuration)
        return timer
    }

    func handleStartTap() {
        guard case .loaded(let viewData) = state else { return }

        state = state.showCountdown()
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.delayShowCountdown) {
            viewData.countdown.startTimer()
        }
    }
}

// MARK: - Constants

private extension TrainingStartViewModel {

    enum Constants {
        static let delayShowCountdown = 0.25
        static let countdownDuration: Double = 5
    }
}
