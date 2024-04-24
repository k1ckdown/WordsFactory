//
//  DictionaryWordWidgetProvider.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 24.04.2024.
//

import WidgetKit

struct DictionaryWordWidgetProvider: TimelineProvider {

    private let getRandomWordUseCase: GetRandomWordUseCase

    init(getRandomWordUseCase: GetRandomWordUseCase) {
        self.getRandomWordUseCase = getRandomWordUseCase
    }

    func placeholder(in context: Context) -> DictionaryWordWidgetEntry {
        .placeholder
    }

    func getSnapshot(in context: Context, completion: @escaping (DictionaryWordWidgetEntry) -> Void) {
        completion(.placeholder)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<DictionaryWordWidgetEntry>) -> Void) {
        Task {
            let entry = await getTimelineEntry()
            let tomorrowDay = Calendar.current.date(byAdding: .day, value: 1, to: entry.date)
            let refreshDate = Calendar.current.date(bySetting: .hour, value: 20, of: tomorrowDay ?? .now)

            let timeline = Timeline(entries: [entry], policy: .after(refreshDate ?? .now))
            completion(timeline)
        }
    }
}

// MARK: - Private methods

private extension DictionaryWordWidgetProvider {


    func getTimelineEntry() async -> DictionaryWordWidgetEntry {
        let state: DictionaryWordWidgetEntry.ViewState

        do {
            let word = try await getRandomWordUseCase.execute()
            state = .loaded(.init(word: word.text, definition: word.definition))
        } catch {
            state = .failed(error)
        }

        return DictionaryWordWidgetEntry(date: .now, state: state)
    }
}
