//
//  CDWord+Mapping.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import WordModuleAPI

extension CDWord {

    func toDomain() -> Word {
        Word(
            text: text,
            isDictionary: true,
            definitions: definitions.toArray(of: CDWordDefinition.self).map { $0.toDomain() }
        )
    }

    func toDomainDictionary() -> DictionaryWord {
        DictionaryWord(
            text: text,
            studyCoefficient: Int(studyCoefficient),
            definitions: definitions.toArray(of: CDWordDefinition.self).map { $0.toDomain() }
        )
    }
}
