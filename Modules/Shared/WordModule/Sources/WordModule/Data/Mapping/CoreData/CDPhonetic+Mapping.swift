//
//  CDPhonetic+Mapping.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import WordModuleAPI

extension CDPhonetic {

    func toDomain() -> Phonetic {
        Phonetic(text: text, audio: audio)
    }
}
