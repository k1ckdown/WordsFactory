//
//  ModuleDependencies.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import NetworkingAPI
import WordModuleAPI

public struct ModuleDependencies {
    let networkService: NetworkServiceProtocol
    let wordRepository: WordRepositoryProtocol

    public init(networkService: NetworkServiceProtocol, wordRepository: WordRepositoryProtocol) {
        self.networkService = networkService
        self.wordRepository = wordRepository
    }
}
