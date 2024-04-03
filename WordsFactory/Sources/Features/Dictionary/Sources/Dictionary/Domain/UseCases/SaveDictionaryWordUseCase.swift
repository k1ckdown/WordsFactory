//
//  SaveDictionaryWordUseCase.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import WordModuleAPI

final class SaveDictionaryWordUseCase {

    private let wordRepository: WordRepositoryProtocol

    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }

    func execute(_ word: Word) throws {
        try wordRepository.save(word)
    }
}
