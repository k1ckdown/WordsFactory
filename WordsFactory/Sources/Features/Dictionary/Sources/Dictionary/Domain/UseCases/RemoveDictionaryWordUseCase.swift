//
//  RemoveDictionaryWordUseCase.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import WordModuleAPI

final class RemoveDictionaryWordUseCase {

    private let wordRepository: WordRepositoryProtocol

    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }

    func execute(_ text: String) throws {
        try wordRepository.removeDictionary(by: text)
    }
}
