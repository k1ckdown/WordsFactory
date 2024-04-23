//
//  DictionaryWidgetEntry.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 08.04.2024.
//

import WidgetKit

struct DictionaryWidgetEntry: TimelineEntry {
    var date = Date.now
    let state: ViewState
}

extension DictionaryWidgetEntry {
    enum ViewState {
        case failed(Error)
        case loaded(ViewData)

        struct ViewData {
            let totalWordCount: Int
            let rememberedWordCount: Int
        }
    }
}

extension DictionaryWidgetEntry {
    static let placeholder = DictionaryWidgetEntry(state: .loaded(.init(totalWordCount: 3125, rememberedWordCount: 41)))
}
