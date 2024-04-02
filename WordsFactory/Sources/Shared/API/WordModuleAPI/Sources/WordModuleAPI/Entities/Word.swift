//
//  Word.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

public struct Word {
    public let text: String
    public let phonetic: String?
    public let meanings: [Meaning]
    public let phonetics: [Phonetic]

    public init(text: String, phonetic: String?, meanings: [Meaning], phonetics: [Phonetic]) {
        self.text = text
        self.phonetic = phonetic
        self.meanings = meanings
        self.phonetics = phonetics
    }
}
