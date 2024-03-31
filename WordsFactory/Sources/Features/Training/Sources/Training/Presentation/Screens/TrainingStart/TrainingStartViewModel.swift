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
            state = state.startCountDown(Constants.countdownDuration)
        case .countdownUpdated(let value):
            handleCounterUpdate(value)
        }
    }
}

// MARK: - Private methods

private extension TrainingStartViewModel {

    func handleCounterUpdate(_ value: Double) {
        guard value.isZero else { return }
    }

    func getTotalWords() {
        let totalWords = 25
        state = .loaded(.init(totalWords: totalWords))
    }
}

// MARK: - Constants

private extension TrainingStartViewModel {

    enum Constants {
        static let countdownDuration: Double = 5
    }
}
