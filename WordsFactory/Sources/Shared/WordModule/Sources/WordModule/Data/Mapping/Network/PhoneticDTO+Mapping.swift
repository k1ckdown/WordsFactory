//
//  PhoneticDTO+Mapping.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import WordModuleAPI

extension PhoneticDTO {

    func toDomain() -> Phonetic {
        let phoneticAudio: String?
        if let audio, audio.isEmpty == false {
            phoneticAudio = audio
        } else {
            phoneticAudio = nil
        }

        return Phonetic(text: text, audio: phoneticAudio)
    }
}
