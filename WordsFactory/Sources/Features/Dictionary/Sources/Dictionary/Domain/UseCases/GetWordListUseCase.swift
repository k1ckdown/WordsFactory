//
//  GetWordListUseCase.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

final class GetWordListUseCase {

    private let wordRepository: WordRepository

    init(wordRepository: WordRepository) {
        self.wordRepository = wordRepository
    }

    func execute(_ word: String) async throws -> WordList {
        try await wordRepository.getAll(by: word)
    }
}
