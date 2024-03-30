//
//  WordDefinitionRepository.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

protocol WordDefinitionRepository: AnyObject {
    func deleteDefinitions(of word: String) throws
    func saveDefinitions(_ definitions: [WordDefinition]) throws
    func getDefinitionList(of word: String) async throws -> WordDefinitionList
}
