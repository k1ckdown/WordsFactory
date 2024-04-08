//
//  DictionaryWidgetEntry.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 08.04.2024.
//

import WidgetKit

struct DictionaryWidgetEntry: TimelineEntry {
    var date = Date.now
    let totalWordCount: Int
    let rememberedWordCount: Int
}

extension DictionaryWidgetEntry {
    static let placeholder = DictionaryWidgetEntry(totalWordCount: 3125, rememberedWordCount: 41)
}
