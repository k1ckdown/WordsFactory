//
//  DictionaryWord+Mock.swift
//
//
//  Created by Ivan Semenov on 12.04.2024.
//

import WordModuleAPI

extension DictionaryWord {
    static let mock = DictionaryWord(
        text: "cooking",
        studyCoefficient: 2,
        definitions: [
            .init(phonetic: "/ˈkʊ.kɪŋ/", meanings: [], phonetics: [])
        ]
    )
}

