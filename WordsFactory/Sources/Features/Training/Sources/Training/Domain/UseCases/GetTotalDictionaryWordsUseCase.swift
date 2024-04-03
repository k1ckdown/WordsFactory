//
//  GetTotalDictionaryWordsUseCase.swift
//
//
//  Created by Ivan Semenov on 02.04.2024.
//

import WordModuleAPI

final class GetTotalDictionaryWordsUseCase {

    private let wordRepository: WordRepositoryProtocol

    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }

    func execute() throws -> Int {
        let dictionaryWords = try wordRepository.getAllDictionary()
        return dictionaryWords.count
    }
}
