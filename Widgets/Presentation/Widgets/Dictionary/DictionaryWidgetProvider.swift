//
//  DictionaryWidgetProvider.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 08.04.2024.
//

import WidgetKit
import WordModule

struct DictionaryWidgetProvider: TimelineProvider {

    private let getDictionaryWordCountUseCase: GetDictionaryWordCountUseCase
    private let getRememberedWordCountUseCase: GetRememberedWordCountUseCase

    init(
        getDictionaryWordCountUseCase: GetDictionaryWordCountUseCase,
        getRememberedWordCountUseCase: GetRememberedWordCountUseCase
    ) {
        self.getDictionaryWordCountUseCase = getDictionaryWordCountUseCase
        self.getRememberedWordCountUseCase = getRememberedWordCountUseCase
    }

    func placeholder(in context: Context) -> DictionaryWidgetEntry {
        .placeholder
    }

    func getSnapshot(in context: Context, completion: @escaping (DictionaryWidgetEntry) -> Void) {
        completion(.placeholder)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<DictionaryWidgetEntry>) -> Void) {
        Task {
            let entry = await getTimelineEntry()
            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
        }
    }
}

// MARK: - Private methods

private extension DictionaryWidgetProvider {

    func getTimelineEntry() async -> DictionaryWidgetEntry {
        let state: DictionaryWidgetEntry.ViewState

        do {
            let totalWordCount = try await getDictionaryWordCountUseCase.execute()
            let rememberedWordCount = try await getRememberedWordCountUseCase.execute()
            state = .loaded(.init(totalWordCount: totalWordCount, rememberedWordCount: rememberedWordCount))
        } catch {
            state = .failed(error)
        }

        return DictionaryWidgetEntry(state: state)
    }
}
