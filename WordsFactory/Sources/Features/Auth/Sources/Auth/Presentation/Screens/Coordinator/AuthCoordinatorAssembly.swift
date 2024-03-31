//
//  AuthCoordinatorAssembly.swift
//
//
//  Created by Ivan Semenov on 23.03.2024.
//

public struct AuthCoordinatorAssembly {

    public init() {}

    public func assemble(onFlowFinish: @escaping () -> Void) -> AuthCoordinatorView {
        let repositoryFactory = RepositoryFactory()
        let useCaseFactory = UseCaseFactory(repositoryFactory: repositoryFactory)
        let screenFactory = ScreenFactory(useCaseFactory: useCaseFactory)

        let coordinator = AuthCoordinator(onFlowFinish: onFlowFinish)
        let coordinatorView = AuthCoordinatorView(coordinator: coordinator, screenFactory: screenFactory)

        return coordinatorView
    }
}
