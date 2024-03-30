//
//  FetchWordDefinitionListUseCase.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

final class FetchWordDefinitionListUseCase {

    private let wordDefinitionRepository: WordDefinitionRepository

    init(wordDefinitionRepository: WordDefinitionRepository) {
        self.wordDefinitionRepository = wordDefinitionRepository
    }

    func execute(_ word: String) async throws -> WordDefinitionList {
        try await wordDefinitionRepository.getDefinitionList(of: word)
    }
}
