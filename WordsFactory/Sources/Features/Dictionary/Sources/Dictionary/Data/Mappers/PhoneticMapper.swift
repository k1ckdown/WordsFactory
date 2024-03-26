//
//  PhoneticMapper.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

enum PhoneticMapper: Mapper {

    static func toDomain(_ source: PhoneticDTO) -> Phonetic {
        Phonetic(text: source.text, audio: source.audio)
    }
}
