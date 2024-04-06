//
//  TrainingCoordinatorAssembly.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import TrainingAPI
import SwiftUI

public struct TrainingCoordinatorAssembly: TrainingCoordinatorAssemblyProtocol {

    private let coordinatorFactory: CoordinatorFactory

    public init(dependencies: ModuleDependencies) {
        let useCaseFactory = UseCaseFactory(wordRepository: dependencies.wordRepository)
        let screenFactory = ScreenFactory(useCaseFactory: useCaseFactory)

        coordinatorFactory = CoordinatorFactory(screenFactory: screenFactory)
    }

    public func assemble() -> AnyView {
        let coordinatorView = TrainingCoordinatorView(factory: coordinatorFactory)
        return AnyView(coordinatorView)
    }
}
