//
//  WordDefinition.swift
//  
//
//  Created by Ivan Semenov on 03.04.2024.
//

public struct WordDefinition {
    public let phonetic: String?
    public let meanings: [Meaning]
    public let phonetics: [Phonetic]

    public init(phonetic: String?, meanings: [Meaning], phonetics: [Phonetic]) {
        self.phonetic = phonetic
        self.meanings = meanings
        self.phonetics = phonetics
    }
}
