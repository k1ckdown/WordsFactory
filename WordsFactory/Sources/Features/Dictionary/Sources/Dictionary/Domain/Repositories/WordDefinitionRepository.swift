//
//  WordDefinitionRepository.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

protocol WordDefinitionRepository: AnyObject {
    func getDefinitions(of word: String) async throws -> [WordDefinition]
}
