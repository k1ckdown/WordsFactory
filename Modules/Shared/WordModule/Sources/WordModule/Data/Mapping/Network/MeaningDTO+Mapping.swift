//
//  MeaningDTO+Mapping.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import WordModuleAPI

extension MeaningDTO {

    func toDomain() -> Meaning {
        Meaning(
            partOfSpeech: partOfSpeech,
            synonyms: synonyms,
            antonyms: antonyms,
            definitions: definitions.map { $0.toDomain() }
        )
    }
}
