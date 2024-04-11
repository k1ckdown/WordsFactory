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
            do {
                let entry = try await getTimelineEntry()
                let timeline = Timeline(entries: [entry], policy: .never)
                completion(timeline)
            } catch {
                print(error)
            }
        }
    }
}

// MARK: - Private methods

private extension DictionaryWidgetProvider {

    func getTimelineEntry() async throws -> DictionaryWidgetEntry {
        let totalWordCount = try await getDictionaryWordCountUseCase.execute()
        let rememberedWordCount = try await getRememberedWordCountUseCase.execute()

        return .init(totalWordCount: totalWordCount, rememberedWordCount: rememberedWordCount)
    }
}
