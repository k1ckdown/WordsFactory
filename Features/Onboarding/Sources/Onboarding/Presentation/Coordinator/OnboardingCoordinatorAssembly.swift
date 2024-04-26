//
//  OnboardingCoordinatorAssembly.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI

public struct OnboardingCoordinatorAssembly {

    private let screenFactory: ScreenFactory

    public init() {
        screenFactory = ScreenFactory()
    }

    public func assemble(flowFinishHandler: @escaping () -> Void) -> some View {
        let coordinator = OnboardingCoordinator(flowFinishHandler: flowFinishHandler)
        let coordinatorView = OnboardingCoordinatorView(
            content: screenFactory.makeOnboardingScreen(coordinator: coordinator),
            coordinator: coordinator
        )

        return coordinatorView
    }
}
