//
//  File.swift
//
//
//  Created by Ivan Semenov on 26.04.2024.
//

import SwiftUI
import ProfileAPI

public struct ProfileCoordinatorAssembly: ProfileCoordinatorAssemblyProtocol {

    private let coordinatorFactory: CoordinatorFactory

    public init(dependencies: ModuleDependencies) {
        let useCaseFactory = UseCaseFactory(
            userRepository: dependencies.userRepository,
            authRepository: dependencies.authRepository
        )

        let screenFactory = ScreenFactory(useCaseFactory: useCaseFactory)
        coordinatorFactory = CoordinatorFactory(screenFactory: screenFactory)
    }

    public func assemble() -> AnyView {
        let coordinator = coordinatorFactory.makeProfileCoordinator()
        return AnyView(coordinator)
    }
}
