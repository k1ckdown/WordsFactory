//
//  DictionaryOverviewWidgetEntry.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 08.04.2024.
//

import WidgetKit

struct DictionaryOverviewWidgetEntry: TimelineEntry {
    var date = Date.now
    let state: ViewState
}

extension DictionaryOverviewWidgetEntry {
    enum ViewState {
        case failed(Error)
        case loaded(ViewData)

        struct ViewData {
            let totalWordCount: Int
            let rememberedWordCount: Int
        }
    }
}

extension DictionaryOverviewWidgetEntry {
    static let placeholder = DictionaryOverviewWidgetEntry(state: .loaded(.init(totalWordCount: 3125, rememberedWordCount: 41)))
}
