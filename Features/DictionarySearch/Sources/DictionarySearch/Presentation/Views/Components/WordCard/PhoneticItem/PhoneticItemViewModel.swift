//
//  PhoneticItemViewModel.swift
//
//
//  Created by Ivan Semenov on 07.04.2024.
//

import Foundation
import DictionaryDomain
import CommonUI

struct PhoneticItemViewModel: Equatable, Identifiable {
    let id = UUID()
    let text: String
    let isSpeakerShowing: Bool
    let tapHandler: (() -> Void)?

    static func == (lhs: PhoneticItemViewModel, rhs: PhoneticItemViewModel) -> Bool {
        lhs.id == rhs.id
    }
}

extension PhoneticItemViewModel {
    init(phonetic: Phonetic, tapHandler: (() -> Void)?) {
        text = phonetic.text ?? "N/A"
        isSpeakerShowing = phonetic.audio != nil
        self.tapHandler = tapHandler
    }
}

// MARK: - Placeholder

extension PhoneticItemViewModel: HasPlaceholder {
    static func placeholder(id: String) -> PhoneticItemViewModel {
        .init(text: .placeholder(7), isSpeakerShowing: true, tapHandler: nil)
    }
}
