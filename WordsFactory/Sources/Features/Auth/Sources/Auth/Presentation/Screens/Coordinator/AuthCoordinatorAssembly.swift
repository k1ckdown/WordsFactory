//
//  AuthCoordinatorAssembly.swift
//
//
//  Created by Ivan Semenov on 23.03.2024.
//

public enum AuthCoordinatorAssembly {

    public static func assemble(onFlowFinish: @escaping () -> Void) -> AuthCoordinatorView {
        let useCaseFactory = UseCaseFactory()
        let screenFactory = ScreenFactory(useCaseFactory: useCaseFactory)

        let coordinator = AuthCoordinator(onFlowFinish: onFlowFinish)
        let coordinatorView = AuthCoordinatorView(coordinator: coordinator, screenFactory: screenFactory)

        return coordinatorView
    }
}