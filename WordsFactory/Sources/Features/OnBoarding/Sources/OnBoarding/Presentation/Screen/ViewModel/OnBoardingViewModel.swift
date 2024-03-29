//
//  OnBoardingViewModel.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import Foundation

final class OnBoardingViewModel: ObservableObject {

    @Published private(set) var state = ViewState()
    private let coordinator: OnBoardingCoordinatorProtocol

    init(coordinator: OnBoardingCoordinatorProtocol) {
        self.coordinator = coordinator
    }

    func handle(_ event: Event) {
        switch event {
        case .nextTapped:
            handleNextTap()
        case .skipTapped:
            coordinator.finish()
        }
    }
}

// MARK: - Private methods

private extension OnBoardingViewModel {

    func handleNextTap() {
        switch state.style {
        case .learnAnytime:
            state.style = .findCourse
        case .findCourse:
            state.style = .improveSkills
        case .improveSkills:
            coordinator.finish()
        }
    }
}

