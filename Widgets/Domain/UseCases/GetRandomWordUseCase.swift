//
//  GetRandomWordUseCase.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 24.04.2024.
//

import WordModuleAPI

final class GetRandomWordUseCase {

    private let wordRepository: WordRepositoryProtocol

    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }

    func execute() async throws -> WordShort? {
        let dictionaryWords = try await wordRepository.getAllDictionary()

        guard
            let selectedWord = dictionaryWords.randomElement(),
            let definition = selectedWord.definitions.randomElement()?.meanings.randomElement()?.definitions.randomElement()?.definition
        else { return nil }

        let wordShort = WordShort(text: selectedWord.text, definition: definition)
        return wordShort
    }
}
