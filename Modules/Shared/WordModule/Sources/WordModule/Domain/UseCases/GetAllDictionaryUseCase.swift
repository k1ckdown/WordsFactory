//
//  GetAllDictionaryUseCase.swift
//
//
//  Created by Ivan Semenov on 02.04.2024.
//

import WordModuleAPI

public final class GetAllDictionaryUseCase: GetAllDictionaryUseCaseProtocol {

    private let wordRepository: WordRepositoryProtocol

    public init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }

    public func execute() async throws -> [DictionaryWord] {
        try await wordRepository.getAllDictionary()
    }
}
