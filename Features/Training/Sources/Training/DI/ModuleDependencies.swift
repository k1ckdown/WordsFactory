//
//  ModuleDependencies.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import DictionaryDomain

public struct ModuleDependencies {
    let wordRepository: WordRepositoryProtocol

    public init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }
}
