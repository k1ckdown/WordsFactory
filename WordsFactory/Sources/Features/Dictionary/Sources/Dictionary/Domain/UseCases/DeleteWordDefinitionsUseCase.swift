//
//  DeleteWordDefinitionsUseCase.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

final class DeleteWordDefinitionsUseCase {

    private let wordDefinitionRepository: WordDefinitionRepository

    init(wordDefinitionRepository: WordDefinitionRepository) {
        self.wordDefinitionRepository = wordDefinitionRepository
    }

    func execute(_ word: String) throws {
        try wordDefinitionRepository.deleteDefinitions(of: word)
    }
}
