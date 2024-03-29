//
//  DictionaryViewAssembly.swift
//
//
//  Created by Ivan Semenov on 28.03.2024.
//

import DictionaryAPI

public struct DictionaryViewAssemblyImpl: DictionaryViewAssembly {

    private let factory: DictionaryFactory

    public init(dependencies: ModuleDependencies) {
        factory = DictionaryFactory(dependencies: dependencies)
    }

    public func assemble() -> DictionaryView {
        let viewModel = DictionaryViewModel(fetchWordDefinitionsUseCase: factory.makeFetchWordDefinitionsUseCase())
        return DictionaryView(viewModel: viewModel)
    }
}
