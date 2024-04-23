//
//  CDWord+Mapping.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import WordModuleAPI

extension CDWord {

    func toDomain(isDictionary: Bool) -> Word {
        Word(
            text: text,
            isDictionary: isDictionary,
            definitions: definitions.toArray(of: CDWordDefinition.self).map { $0.toDomain() }
        )
    }

    func toDomainDictionary(studyCoefficient: Int) -> DictionaryWord {
        DictionaryWord(
            text: text,
            studyCoefficient: studyCoefficient,
            definitions: definitions.toArray(of: CDWordDefinition.self).map { $0.toDomain() }
        )
    }
}
