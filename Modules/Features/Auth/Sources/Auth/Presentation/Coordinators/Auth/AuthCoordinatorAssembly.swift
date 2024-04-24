//
//  AuthCoordinatorAssembly.swift
//
//
//  Created by Ivan Semenov on 23.03.2024.
//

import SwiftUI

public struct AuthCoordinatorAssembly {
    
    private let coordinatorFactory: CoordinatorFactory
    
    public init(dependencies: ModuleDependencies) {
        let repositoryFactory = RepositoryFactory(userRepository: dependencies.userRepository)
        let useCaseFactory = UseCaseFactory(repositoryFactory: repositoryFactory)
        
        let screenFactory = ScreenFactory(useCaseFactory: useCaseFactory)
        coordinatorFactory = CoordinatorFactory(
            screenFactory: screenFactory,
            flowFinishHandler: dependencies.flowFinishHandler
        )
    }
    
    public func assemble() -> some View {
        let coordinator = AuthCoordinator()
        let coordinatorView = AuthCoordinatorView(factory: coordinatorFactory, coordinator: coordinator)
        
        return coordinatorView
    }
}
