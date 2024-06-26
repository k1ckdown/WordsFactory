//
//  DictionaryWordWidgetEntry.swift
//  WordsFactory
//
//  Created by Ivan Semenov on 24.04.2024.
//

import WidgetKit

struct DictionaryWordWidgetEntry: TimelineEntry {
    let date: Date
    let state: ViewState
}

extension DictionaryWordWidgetEntry {

    enum ViewState {
        case failed(String)
        case loaded(ViewData)

        struct ViewData {
            let word: String
            let definition: String
        }
    }
}

extension DictionaryWordWidgetEntry {
    static let placeholder = DictionaryWordWidgetEntry(
        date: .now,
        state: .loaded(.init(
            word: "Cooking",
            definition: "The practice or skill of preparing food by combining, mixing, and heating ingredients."
        ))
    )
}
