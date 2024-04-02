//
//  WordMapper.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import WordModuleAPI

enum WordMapper: Mapper {

    static func toDomain(_ source: WordDTO) -> Word {
        Word(
            text: source.word,
            phonetic: source.phonetic,
            meanings: MeaningMapper.toDomainList(source.meanings),
            phonetics: PhoneticMapper.toDomainList(source.phonetics)
        )
    }
}
