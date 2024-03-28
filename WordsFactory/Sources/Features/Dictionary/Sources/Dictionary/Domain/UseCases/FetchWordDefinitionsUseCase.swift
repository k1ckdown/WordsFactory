//
//  FetchWordDefinitionsUseCase.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

final class FetchWordDefinitionsUseCase {

    private let wordDefinitionRepository: WordDefinitionRepository

    init(wordDefinitionRepository: WordDefinitionRepository) {
        self.wordDefinitionRepository = wordDefinitionRepository
    }

    func execute(_ word: String) async throws -> [WordDefinition] {
        try await wordDefinitionRepository.getDefinitionList(of: word)
    }
}
