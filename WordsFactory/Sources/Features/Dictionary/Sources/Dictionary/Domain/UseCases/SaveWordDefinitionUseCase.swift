//
//  SaveWordDefinitionUseCase.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

final class SaveWordDefinitionUseCase {

    private let wordDefinitionRepository: WordDefinitionRepository

    init(wordDefinitionRepository: WordDefinitionRepository) {
        self.wordDefinitionRepository = wordDefinitionRepository
    }

    func execute(_ definition: WordDefinition) throws {
        try wordDefinitionRepository.saveDefinition(definition)
    }
}
