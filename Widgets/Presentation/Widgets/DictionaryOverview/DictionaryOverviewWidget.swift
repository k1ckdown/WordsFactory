//
//  DictionaryOverviewWidget.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 08.04.2024.
//

import SwiftUI
import WidgetKit
import AppGroup

struct DictionaryOverviewWidget: Widget {

    private let kind = WidgetType.dictionary.kind
    private let providerAssembly = DictionaryOverviewWidgetProviderAssembly()

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind,
            provider: providerAssembly.assemble()
        ) {
            DictionaryOverviewWidgetEntryView(entry: $0)
        }
        .contentMarginsDisabled()
        .configurationDisplayName(Strings.dictionary)
        .description(Strings.dictionaryOverview)
        .supportedFamilies([.systemMedium])
    }
}

@available(iOS 17, *)
#Preview(as: .systemMedium) {
    DictionaryOverviewWidget()
} timeline: {
    DictionaryOverviewWidgetEntry.placeholder
}
