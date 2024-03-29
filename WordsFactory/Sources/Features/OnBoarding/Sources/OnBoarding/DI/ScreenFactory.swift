//
//  ScreenFactory.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

final class ScreenFactory {

    func makeOnBoardingScreen(coordinator: OnBoardingCoordinatorProtocol) -> OnBoardingView {
        let viewModel = OnBoardingViewModel(coordinator: coordinator)
        return OnBoardingView(viewModel: viewModel)
    }
}
