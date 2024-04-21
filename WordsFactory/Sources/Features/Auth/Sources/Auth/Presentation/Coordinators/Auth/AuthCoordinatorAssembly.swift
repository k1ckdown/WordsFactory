//
//  AuthCoordinatorAssembly.swift
//
//
//  Created by Ivan Semenov on 23.03.2024.
//

import SwiftUI

public struct AuthCoordinatorAssembly {

    private let coordinatorFactory: CoordinatorFactory

    public init(flowFinishHandler: @escaping () -> Void) {
        let repositoryFactory = RepositoryFactory()
        let useCaseFactory = UseCaseFactory(repositoryFactory: repositoryFactory)

        let screenFactory = ScreenFactory(useCaseFactory: useCaseFactory)
        coordinatorFactory = CoordinatorFactory(screenFactory: screenFactory, flowFinishHandler: flowFinishHandler)
    }

    public func assemble() -> some View {
        let coordinator = AuthCoordinator(factory: coordinatorFactory)
        let coordinatorView = AuthCoordinatorView(coordinator: coordinator)

        return coordinatorView
    }
}
