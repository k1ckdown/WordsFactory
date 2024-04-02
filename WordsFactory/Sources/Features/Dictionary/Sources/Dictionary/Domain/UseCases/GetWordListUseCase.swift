//
//  GetWordListUseCase.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import WordModuleAPI

final class GetWordListUseCase {

    private let wordRepository: WordRepositoryProtocol

    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }

    func execute(_ word: String) async throws -> WordList {
        try await wordRepository.getAll(by: word)
    }
}
