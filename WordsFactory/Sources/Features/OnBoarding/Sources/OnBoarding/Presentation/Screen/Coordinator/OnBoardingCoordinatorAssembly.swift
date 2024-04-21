//
//  OnBoardingCoordinatorAssembly.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI

public struct OnBoardingCoordinatorAssembly {

    private let screenFactory: ScreenFactory

    public init() {
        screenFactory = ScreenFactory()
    }

    public func assemble(flowFinishHandler: @escaping () -> Void) -> some View {
        let coordinator = OnBoardingCoordinator(flowFinishHandler: flowFinishHandler)
        let coordinatorView = OnBoardingCoordinatorView(factory: screenFactory, coordinator: coordinator)

        return coordinatorView
    }
}
