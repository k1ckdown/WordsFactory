//
//  Word.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

public struct Word {
    public let text: String
    public let isDictionary: Bool
    public let definitions: [WordDefinition]

    public init(text: String, isDictionary: Bool, definitions: [WordDefinition]) {
        self.text = text
        self.isDictionary = isDictionary
        self.definitions = definitions
    }
}
