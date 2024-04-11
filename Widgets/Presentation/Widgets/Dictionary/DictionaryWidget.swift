//
//  DictionaryWidget.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 08.04.2024.
//

import SwiftUI
import WidgetKit
import WordModuleAPI

struct DictionaryWidget: Widget {

    private let kind = WidgetType.dictionary.kind
    private let providerAssembly = DictionaryWidgetProviderAssembly()

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: providerAssembly.assemble()
        ) {
            DictionaryWidgetEntryView(entry: $0)
        }
        .contentMarginsDisabled()
        .configurationDisplayName(LocalizedStringKey(Strings.dictionary))
        .description(LocalizedStringKey(Strings.dictionaryOverview))
        .supportedFamilies([.systemMedium])
    }
}

@available(iOS 17, *)
#Preview(as: .systemMedium) {
    DictionaryWidget()
} timeline: {
    DictionaryWidgetEntry.placeholder
}