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
    let phoneticAction: (String) -> Void

    static func == (lhs: WordCardViewModel, rhs: WordCardViewModel) -> Bool {
        lhs.id == rhs.id
    }
}

extension WordCardViewModel {
    init(_ word: Word, phoneticAction: @escaping (String) -> Void) {
        text = word.text
        phonetics = word.phonetics.compactMap { $0.text }
        meanings = word.meanings.map { .init($0) }
        isPhoneticsShowing = phonetics.isEmpty == false
        self.phoneticAction = phoneticAction
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
            phoneticAction: { _ in }
        )
    }
}
