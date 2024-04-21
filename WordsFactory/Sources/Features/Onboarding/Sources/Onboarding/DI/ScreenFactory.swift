//
//  ScreenFactory.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

final class ScreenFactory {

    func makeOnboardingScreen(coordinator: OnboardingCoordinatorProtocol) -> OnboardingView {
        let viewModel = OnboardingViewModel(coordinator: coordinator)
        return OnboardingView(viewModel: viewModel)
    }
}
