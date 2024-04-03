//
//  GetWordUseCase.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import WordModuleAPI

final class GetWordUseCase {

    private let wordRepository: WordRepositoryProtocol

    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }

    func execute(_ text: String) async throws -> Word? {
        try await wordRepository.get(by: text)
    }
}
