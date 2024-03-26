//
//  WordDefinitionMapper.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

enum WordDefinitionMapper: Mapper {

    static func toDomain(_ source: WordDefinitionDTO) -> WordDefinition {
        WordDefinition(
            word: source.word,
            phonetic: source.phonetic,
            meanings: MeaningMapper.toDomainList(source.meanings),
            phonetics: PhoneticMapper.toDomainList(source.phonetics)
        )
    }
}
