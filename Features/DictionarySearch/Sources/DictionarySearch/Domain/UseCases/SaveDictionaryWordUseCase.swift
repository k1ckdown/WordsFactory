//
//  SaveDictionaryWordUseCase.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import DictionaryDomain

final class SaveDictionaryWordUseCase {

    private let wordRepository: WordRepositoryProtocol

    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }

    func execute(_ word: Word) async throws {
        try await wordRepository.saveDictionary(word)
    }
}
