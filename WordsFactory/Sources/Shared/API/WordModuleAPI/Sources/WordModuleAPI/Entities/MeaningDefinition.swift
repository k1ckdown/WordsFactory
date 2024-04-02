//
//  MeaningDefinition.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

public struct MeaningDefinition {
    public let definition: String
    public let synonyms: [String]
    public let antonyms: [String]
    public let example: String?

    public init(definition: String, synonyms: [String], antonyms: [String], example: String?) {
        self.definition = definition
        self.synonyms = synonyms
        self.antonyms = antonyms
        self.example = example
    }
}
