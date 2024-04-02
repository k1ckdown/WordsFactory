//
//  MeaningDTO.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

struct MeaningDTO: Decodable {
    let partOfSpeech: String
    let synonyms: [String]
    let antonyms: [String]
    let definitions: [MeaningDefinitionDTO]
}
