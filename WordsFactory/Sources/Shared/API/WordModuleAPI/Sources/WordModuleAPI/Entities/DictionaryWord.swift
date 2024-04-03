//
//  DictionaryWord.swift
//
//
//  Created by Ivan Semenov on 02.04.2024.
//

public struct DictionaryWord {
    public let text: String
    public let studyCoefficient: Int
    public let definitions: [WordDefinition]

    public init(text: String, studyCoefficient: Int, definitions: [WordDefinition]) {
        self.text = text
        self.studyCoefficient = studyCoefficient
        self.definitions = definitions
    }
}
