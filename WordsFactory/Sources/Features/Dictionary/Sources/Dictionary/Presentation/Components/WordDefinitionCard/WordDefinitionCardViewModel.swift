//
//  WordDefinitionCardViewModel.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import Foundation

struct WordDefinitionCardViewModel: Equatable, Identifiable {
    let id = UUID()
    let word: String
    let phonetics: [String]
    let meanings: [MeaningCardViewModel]
    let isPhoneticsShowing: Bool
    let phoneticAction: (String) -> Void

    init(_ definition: WordDefinition, phoneticAction: @escaping (String) -> Void) {
        word = definition.word
        phonetics = definition.phonetics.compactMap { $0.text }
        meanings = definition.meanings.map { .init($0) }
        isPhoneticsShowing = phonetics.isEmpty == false
        self.phoneticAction = phoneticAction
    }

    static func == (lhs: WordDefinitionCardViewModel, rhs: WordDefinitionCardViewModel) -> Bool {
        lhs.id == rhs.id
    }
}
