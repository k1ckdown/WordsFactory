//
//  File.swift
//
//
//  Created by Ivan Semenov on 26.04.2024.
//

import SwiftUI
import ProfileAPI

public struct ProfileCoordinatorAssembly: ProfileCoordinatorAssemblyProtocol {

    private let screenFactory: ScreenFactory

    public init(dependencies: ModuleDependencies) {
        let useCaseFactory = UseCaseFactory(
            userRepository: dependencies.userRepository,
            authRepository: dependencies.authRepository
        )

        screenFactory = ScreenFactory(useCaseFactory: useCaseFactory)
    }

    public func assemble() -> AnyView {
        let coordinator = ProfileCoordinator()
        let coordinatorView = ProfileCoordinatorView(
            content: screenFactory.makeProfileScreen(coordinator: coordinator),
            coordinator: coordinator
        )

        return AnyView(coordinatorView)
    }
}
