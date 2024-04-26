//
//  WordCardViewModel.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import Foundation
import CommonUI
import DictionaryDomain

struct WordCardViewModel: Equatable, Identifiable {
    let id = UUID()
    let text: String
    let isPhoneticsShowing: Bool
    let meanings: [MeaningCardViewModel]
    let phonetics: [PhoneticItemViewModel]

    static func == (lhs: WordCardViewModel, rhs: WordCardViewModel) -> Bool {
        lhs.id == rhs.id
    }
}

extension WordCardViewModel {
    init(text: String, definition: WordDefinition, phoneticHandler: @escaping (String?) -> Void) {
        self.text = text
        isPhoneticsShowing = definition.phonetics.isEmpty == false
        meanings = definition.meanings.map { .init($0) }
        phonetics = definition.phonetics.map { phonetic in
            PhoneticItemViewModel(phonetic: phonetic, tapHandler: { phoneticHandler(phonetic.audio) })
        }
    }
}

// MARK: - Placeholder

extension WordCardViewModel: HasPlaceholder {
    static func placeholder(id: String) -> WordCardViewModel {
        .init(
            text: .placeholder(7),
            isPhoneticsShowing: true,
            meanings: .placeholders(2),
            phonetics: .placeholders(2)
        )
    }
}
