//
//  GetRememberedWordCountUseCase.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 09.04.2024.
//

import WordModuleAPI

final class GetRememberedWordCountUseCase {

    private let wordRepository: WordRepositoryProtocol

    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }

    func execute() async throws -> Int {
        let dictionaryWords = try await wordRepository.getAllDictionary()
        let rememberedWords = dictionaryWords.filter { $0.studyCoefficient >= Constants.minRememberCoef }

        return rememberedWords.count
    }
}

// MARK: - Constants

private extension GetRememberedWordCountUseCase {

    enum Constants {
        static let minRememberCoef = 6
    }
}
