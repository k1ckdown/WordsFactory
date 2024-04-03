//
//  CDMeaningDefinition+Mapping.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import WordModuleAPI

extension CDMeaningDefinition {

    func toDomain() -> MeaningDefinition {
        MeaningDefinition(
            definition: definition,
            synonyms: synonyms,
            antonyms: antonyms,
            example: example
        )
    }
}
