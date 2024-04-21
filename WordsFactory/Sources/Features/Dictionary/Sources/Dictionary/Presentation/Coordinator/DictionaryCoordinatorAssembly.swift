//
//  DictionaryCoordinatorAssembly.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI
import DictionaryAPI

public struct DictionaryCoordinatorAssembly: DictionaryCoordinatorAssemblyProtocol {

    private let screenFactory: ScreenFactory

    public init(dependencies: ModuleDependencies) {
        let useCaseFactory = UseCaseFactory(wordRepository: dependencies.wordRepository)
        screenFactory = ScreenFactory(useCaseFactory: useCaseFactory)
    }

    public func assemble() -> AnyView {
        let coordinator = DictionaryCoordinator()
        let coordinatorView = DictionaryCoordinatorView(
            content: screenFactory.makeDictionaryScreen(coordinator: coordinator),
            coordinator: coordinator
        )

        return AnyView(coordinatorView)
    }
}
