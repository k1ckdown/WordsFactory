//
//  WordDefinitionDTO.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

struct WordDefinitionDTO: Decodable {
    let word: String
    let phonetic: String?
    let meanings: [MeaningDTO]
    let phonetics: [PhoneticDTO]
}
