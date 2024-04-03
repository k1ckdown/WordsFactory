//
//  PhoneticDTO+Mapping.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import WordModuleAPI

extension PhoneticDTO {

    func toDomain() -> Phonetic {
        Phonetic(text: text, audio: audio)
    }
}
