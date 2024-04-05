//
//  TrainingStartViewModel.swift
//
//
//  Created by Ivan Semenov on 31.03.2024.
//

import Combine
import Foundation

final class TrainingStartViewModel: ObservableObject {

    @Published private(set) var state = ViewState.idle

    private var subscriptions: Set<AnyCancellable> = []
    private let coordinator: TrainingStartCoordinatorProtocol
    private let getTotalDictionaryWordsUseCase: GetTotalDictionaryWordsUseCase

    init(coordinator: TrainingStartCoordinatorProtocol, getTotalDictionaryWordsUseCase: GetTotalDictionaryWordsUseCase) {
        self.coordinator = coordinator
        self.getTotalDictionaryWordsUseCase = getTotalDictionaryWordsUseCase
    }

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
        do {
            let totalWords = try getTotalDictionaryWordsUseCase.execute()
            state = .loaded(.init(totalWords: totalWords, countdown: makeTimer()))
        } catch {
            state = .failed
        }
    }

    func makeTimer() -> TimerViewModel {
        let timer = TimerViewModel()

        timer.$progress
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                if $0.isLess(than: 0) { self?.coordinator.showQuestion() }
            }
            .store(in: &subscriptions)

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
    }
}
