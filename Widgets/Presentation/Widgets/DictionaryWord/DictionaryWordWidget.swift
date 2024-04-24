//
//  DictionaryWordWidget.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 24.04.2024.
//

import SwiftUI
import WidgetKit
import AppGroup

struct DictionaryWordWidget: Widget {

    private let kind = WidgetType.dictionaryWord.kind
    private let providerAssembly = DictionaryWordWidgetProviderAssembly()

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: providerAssembly.assemble()
        ) {
            DictionaryWordWidgetEntryView(entry: $0)
        }
        .contentMarginsDisabled()
        .configurationDisplayName(Strings.dictionaryWord)
        .description(Strings.dictionaryWordDescription)
        .supportedFamilies([.systemMedium])
    }
}
