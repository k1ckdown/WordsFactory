//
//  Meaning.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

public struct Meaning {
    public let partOfSpeech: String
    public let synonyms: [String]
    public let antonyms: [String]
    public let definitions: [MeaningDefinition]

    public init(partOfSpeech: String, synonyms: [String], antonyms: [String], definitions: [MeaningDefinition]) {
        self.partOfSpeech = partOfSpeech
        self.synonyms = synonyms
        self.antonyms = antonyms
        self.definitions = definitions
    }
}
