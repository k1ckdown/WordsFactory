//
//  DictionaryCoordinatorAssembly.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI
import DictionaryAPI

public struct DictionaryCoordinatorAssembly: DictionaryCoordinatorAssemblyProtocol {

    private let factory: DictionaryFactory

    public init(dependencies: ModuleDependencies) {
        factory = DictionaryFactory(dependencies: dependencies)
    }

    public func assemble() -> AnyView {
        let coordinator = DictionaryCoordinator()
        let coordinatorView = DictionaryCoordinatorView(factory: factory, coordinator: coordinator)

        return AnyView(coordinatorView)
    }
}
