//
//  MeaningDefinitionDTO+Mapping.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import WordModuleAPI

extension MeaningDefinitionDTO {
    
    func toDomain() -> MeaningDefinition {
        MeaningDefinition(
            definition: definition,
            synonyms: synonyms,
            antonyms: antonyms,
            example: example
        )
    }
}
