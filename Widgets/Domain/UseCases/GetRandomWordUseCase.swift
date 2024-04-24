//
//  GetRandomWordUseCase.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 24.04.2024.
//

import WordModuleAPI

final class GetRandomWordUseCase {

    enum GetRandomWordUseCaseError: Error {
        case dictionaryIsEmpty
    }

    private let wordRepository: WordRepositoryProtocol

    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }

    func execute() async throws -> WordShort {
        let dictionaryWords = try await wordRepository.getAllDictionary()

        guard
            let selectedWord = dictionaryWords.randomElement(),
            let definition = selectedWord.definitions.randomElement()?.meanings.randomElement()?.definitions.randomElement()?.definition
        else { throw GetRandomWordUseCaseError.dictionaryIsEmpty }

        let wordShort = WordShort(text: selectedWord.text, definition: definition)
        return wordShort
    }
}
