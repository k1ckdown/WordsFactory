//
//  MeaningDefinitionDTO.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

struct MeaningDefinitionDTO: Decodable {
    let definition: String
    let synonyms: [String]
    let antonyms: [String]
    let example: String?
}
