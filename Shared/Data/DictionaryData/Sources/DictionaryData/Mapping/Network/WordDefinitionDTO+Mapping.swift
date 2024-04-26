//
//  WordDefinitionDTO+Mapping.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import DictionaryDomain

extension WordDefinitionDTO {

    func toDomain() -> WordDefinition {
        WordDefinition(
            phonetic: phonetic,
            meanings: meanings.map { $0.toDomain() },
            phonetics: phonetics.map { $0.toDomain() }
        )
    }
}

extension [WordDefinitionDTO] {

    func toWord(isDictionary: Bool) -> Word? {
        guard let first else { return nil }

        return Word(
            text: first.word,
            isDictionary: isDictionary,
            definitions: map { $0.toDomain() }
        )
    }
}
