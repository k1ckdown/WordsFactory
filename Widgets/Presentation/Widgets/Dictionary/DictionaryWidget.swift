//
//  DictionaryWidget.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 08.04.2024.
//

import SwiftUI
import WidgetKit
import WordModule
import Networking

struct DictionaryWidget: Widget {

    private let kind = WidgetType.dictionary.kind
    private let factory = UseCaseFactory()

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: DictionaryWidgetProvider(
                getDictionaryWordCountUseCase: factory.makeGetDictionaryWordCountUseCase(),
                getRememberedWordCountUseCase: factory.makeGetRememberedWordCountUseCase()
            )
        ) {
            DictionaryWidgetEntryView(entry: $0)
        }
        .contentMarginsDisabled()
        .configurationDisplayName("Dictionary")
        .description("Shows an overview of your dictionary")
        .supportedFamilies([.systemMedium])
    }
}

@available(iOS 17, *)
#Preview(as: .systemMedium) {
    DictionaryWidget()
} timeline: {
    DictionaryWidgetEntry.placeholder
}
