//
//  TrainingStartViewModel.swift
//
//
//  Created by Ivan Semenov on 31.03.2024.
//

import Combine
import Foundation
import WordModuleAPI

final class TrainingStartViewModel: ObservableObject {

    @Published private(set) var state = ViewState.idle

    private var subscriptions: Set<AnyCancellable> = []
    private let coordinator: TrainingStartCoordinatorProtocol
    private let getDictionaryWordCountUseCase: GetDictionaryWordCountUseCaseProtocol

    init(
        coordinator: TrainingStartCoordinatorProtocol,
        getDictionaryWordCountUseCase: GetDictionaryWordCountUseCaseProtocol
    ) {
        self.coordinator = coordinator
        self.getDictionaryWordCountUseCase = getDictionaryWordCountUseCase
    }

    func handle(_ event: Event) {
        switch event {
        case .onAppear:
            Task { await getWordCount() }
        case .startTapped:
            handleStartTap()
        }
    }
}

// MARK: - Private methods

private extension TrainingStartViewModel {

    func handleStartTap() {
        guard case .loaded(let viewData) = state else { return }

        state = state.showCountdown()
        viewData.countdown.startTimer()
    }

    func getWordCount() async {
        await MainActor.run { state = .loading }
        let viewState: ViewState

        do {
            let wordCount = try await getDictionaryWordCountUseCase.execute()
            viewState = .loaded(.init(wordCount: wordCount, countdown: makeTimer()))
        } catch {
            viewState = .failed
        }
        await MainActor.run { state = viewState }
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
}
