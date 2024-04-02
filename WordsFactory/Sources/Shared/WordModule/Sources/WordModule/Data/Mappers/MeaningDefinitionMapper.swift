//
//  MeaningDefinitionMapper.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import WordModuleAPI

enum MeaningDefinitionMapper: Mapper {
    
    static func toDomain(_ source: MeaningDefinitionDTO) -> MeaningDefinition {
        MeaningDefinition(
            definition: source.definition,
            synonyms: source.synonyms,
            antonyms: source.antonyms,
            example: source.example
        )
    }
}
