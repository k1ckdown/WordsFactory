//
//  DictionaryViewAssembly.swift
//
//
//  Created by Ivan Semenov on 28.03.2024.
//

import Networking

public enum DictionaryViewAssembly {

    public static func assemble() -> DictionaryView {
        let networkService = NetworkService()
        let wordDefinitionRemoteDataSource = WordDefinitionRemoteDataSource(networkService: networkService)
        let wordDefinitionRepository = WordDefinitionRepositoryImpl(remoteDataSource: wordDefinitionRemoteDataSource)

        let fetchWordDefinitionsUseCase = FetchWordDefinitionsUseCase(wordDefinitionRepository: wordDefinitionRepository)
        let viewModel = DictionaryViewModel(fetchWordDefinitionsUseCase: fetchWordDefinitionsUseCase)

        return DictionaryView(viewModel: viewModel)
    }
}
