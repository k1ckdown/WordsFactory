//
//  DictionaryWord+Mock.swift
//
//
//  Created by Ivan Semenov on 12.04.2024.
//

import DictionaryDomain

extension DictionaryWord {
    static func mock(text: String, studyCoefficient: Int = 0) -> Self {
        DictionaryWord(
            text: text,
            studyCoefficient: studyCoefficient,
            definitions: [
                .init(
                    phonetic: "/ˈkʊ.kɪŋ/",
                    meanings: [
                        .init(
                            partOfSpeech: "verb",
                            synonyms: [],
                            antonyms: [],
                            definitions: [
                                .init(
                                    definition: "To prepare (food) for eating by heating it, often by combining it with other ingredients.",
                                    synonyms: [],
                                    antonyms: [],
                                    example: nil
                                )
                            ]
                        )
                    ],
                    phonetics: []
                )
            ]
        )
    }
}

