//
//  MeaningMapper.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

enum MeaningMapper: Mapper {

    static func toDomain(_ source: MeaningDTO) -> Meaning {
        Meaning(
            partOfSpeech: source.partOfSpeech,
            synonyms: source.synonyms,
            antonyms: source.antonyms,
            definitions: MeaningDefinitionMapper.toDomainList(source.definitions)
        )
    }
}
