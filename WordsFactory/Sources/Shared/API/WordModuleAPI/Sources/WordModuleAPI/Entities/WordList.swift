//
//  WordList.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

public struct WordList {
    public let words: [Word]
    public let isSaved: Bool

    public init(words: [Word], isSaved: Bool) {
        self.words = words
        self.isSaved = isSaved
    }
}
