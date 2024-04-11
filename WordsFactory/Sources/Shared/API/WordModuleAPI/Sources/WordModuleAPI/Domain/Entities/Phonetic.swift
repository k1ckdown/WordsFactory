//
//  Phonetic.swift
//  
//
//  Created by Ivan Semenov on 26.03.2024.
//

public struct Phonetic {
    public let text: String?
    public let audio: String?

    public init(text: String?, audio: String?) {
        self.text = text
        self.audio = audio
    }
}
