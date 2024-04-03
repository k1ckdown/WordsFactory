//
//  CDWordDefinition+Mapping.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import WordModuleAPI

extension CDWordDefinition {

    func toDomain() -> WordDefinition {
        WordDefinition(
            phonetic: phonetic,
            meanings: meanings.toArray(of: CDMeaning.self).map { $0.toDomain() },
            phonetics: phonetics.toArray(of: CDPhonetic.self).map { $0.toDomain() }
        )
    }
}

//extension [CDWord] {
//
//    func toDomain() -> [Word] {
//        map { $0.toDomain() }
//    }
//
//    func toDomainDictionary() -> [DictionaryWord] {
//        map { $0.toDictionary() }
//    }
//}
