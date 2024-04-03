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
        coordinatorFactory = CoordinatorFactory(useCaseFactory: useCaseFactory)
    }

    public func assemble() -> some View {
        let coordinatorView = TrainingCoordinatorView(factory: coordinatorFactory)
        return coordinatorView
    }
}
