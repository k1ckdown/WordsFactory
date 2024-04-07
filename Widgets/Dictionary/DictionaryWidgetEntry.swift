//
//  DictionaryWidgetEntry.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 08.04.2024.
//

import WidgetKit

struct DictionaryWidgetEntry: TimelineEntry {
    var date = Date.now
    let totalWords: Int
    let totalRememberWords: Int
}

extension DictionaryWidgetEntry {
    static let placeholder = DictionaryWidgetEntry(totalWords: 3125, totalRememberWords: 41)
}
