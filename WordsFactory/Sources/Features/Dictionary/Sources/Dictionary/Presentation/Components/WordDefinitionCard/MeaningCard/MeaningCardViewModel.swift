//
//  MeaningCardViewModel.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

struct MeaningCardViewModel: Hashable {
    let partOfSpeech: String
    let definitions: [MeaningDefinitionCardViewModel]

    init(_ meaning: Meaning) {
        partOfSpeech = meaning.partOfSpeech
        definitions = meaning.definitions.map { .init($0) }
    }
}
