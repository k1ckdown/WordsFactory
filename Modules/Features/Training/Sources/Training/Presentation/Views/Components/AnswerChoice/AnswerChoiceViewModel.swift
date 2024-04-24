//
//  AnswerChoiceViewModel.swift
//
//
//  Created by Ivan Semenov on 01.04.2024.
//

import Foundation

struct AnswerChoiceViewModel: Equatable, Identifiable {
    let id = UUID()
    let key: String
    let value: String
    let chooseHandler: () -> Void

    static func == (lhs: AnswerChoiceViewModel, rhs: AnswerChoiceViewModel) -> Bool {
        lhs.id == rhs.id
    }
}
