//
//  OnBoardingCoordinatorAssembly.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI

public struct OnBoardingCoordinatorAssembly {

    public init() {}

    public func assemble(onFlowFinish: @escaping () -> Void) -> some View {
        let screenFactory = ScreenFactory()
        let coordinator = OnBoardingCoordinator(onFlowFinish: onFlowFinish)
        let coordinatorView = OnBoardingCoordinatorView(factory: screenFactory, coordinator: coordinator)

        return coordinatorView
    }
}
