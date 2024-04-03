//
//  WordCardViewModel.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import Foundation
import CommonUI
import WordModuleAPI

struct WordCardViewModel: Equatable, Identifiable {
    let id = UUID()
    let text: String
    let phonetics: [String]
    let meanings: [MeaningCardViewModel]
    let isPhoneticsShowing: Bool
    let phoneticHandler: (String) -> Void

    static func == (lhs: WordCardViewModel, rhs: WordCardViewModel) -> Bool {
        lhs.id == rhs.id
    }
}

extension WordCardViewModel {
    init(text: String, definition: WordDefinition, phoneticHandler: @escaping (String) -> Void) {
        self.text = text
        phonetics = definition.phonetics.compactMap { $0.text }
        meanings = definition.meanings.map { .init($0) }
        isPhoneticsShowing = phonetics.isEmpty == false
        self.phoneticHandler = phoneticHandler
    }
}

// MARK: - Placeholder

extension WordCardViewModel: HasPlaceholder {
    static func placeholder(id: String) -> WordCardViewModel {
        .init(
            text: .placeholder(7),
            phonetics: .init(repeating: .placeholder(7), count: 2),
            meanings: .placeholders(2),
            isPhoneticsShowing: true,
            phoneticHandler: { _ in }
        )
    }
}
