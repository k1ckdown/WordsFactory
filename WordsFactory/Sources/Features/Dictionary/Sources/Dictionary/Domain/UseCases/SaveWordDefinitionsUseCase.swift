//
//  SaveWordDefinitionsUseCase.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

final class SaveWordDefinitionsUseCase {

    private let wordDefinitionRepository: WordDefinitionRepository

    init(wordDefinitionRepository: WordDefinitionRepository) {
        self.wordDefinitionRepository = wordDefinitionRepository
    }

    func execute(_ definitions: [WordDefinition]) throws {
        try wordDefinitionRepository.saveDefinitions(definitions)
    }
}
