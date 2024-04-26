//
//  CDPhonetic+Mapping.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import DictionaryDomain

extension CDPhonetic {

    func toDomain() -> Phonetic {
        Phonetic(text: text, audio: audio)
    }
}
