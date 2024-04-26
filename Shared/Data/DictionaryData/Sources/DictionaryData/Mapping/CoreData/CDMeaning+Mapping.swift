//
//  CDMeaning+Mapping.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import DictionaryDomain

extension CDMeaning {

    func toDomain() -> Meaning {
        Meaning(
            partOfSpeech: partOfSpeech,
            synonyms: synonyms,
            antonyms: antonyms,
            definitions: definitions.toArray(of: CDMeaningDefinition.self).map { $0.toDomain() }
        )
    }
}
