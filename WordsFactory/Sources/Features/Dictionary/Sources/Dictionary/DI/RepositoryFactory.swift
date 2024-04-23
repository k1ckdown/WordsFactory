//
//  RepositoryFactory.swift
//
//
//  Created by Ivan Semenov on 23.04.2024.
//

import WordModuleAPI

final class RepositoryFactory {

    private let wordRepository: WordRepositoryProtocol

    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }
}

// MARK: - Public methods

extension RepositoryFactory {

    func makeWordRepository() -> WordRepositoryProtocol {
        wordRepository
    }
}
