//
//  MeaningCardViewModel.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import CommonUI

struct MeaningCardViewModel: Hashable {
    let partOfSpeech: String
    let definitions: [MeaningDefinitionCardViewModel]
}

extension MeaningCardViewModel {
    init(_ meaning: Meaning) {
        partOfSpeech = meaning.partOfSpeech
        definitions = meaning.definitions.map { .init($0) }
    }
}

// MARK: - Placeholder

extension MeaningCardViewModel: HasPlaceholder {
    static func placeholder<T: Hashable>(id: T) -> MeaningCardViewModel {
        .init(partOfSpeech: .placeholder(7), definitions: .placeholders(1))
    }
}
