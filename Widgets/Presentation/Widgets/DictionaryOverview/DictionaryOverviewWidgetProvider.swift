//
//  DictionaryOverviewWidgetProvider.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 08.04.2024.
//

import WidgetKit
import UserDomain
import DictionaryDomain

struct DictionaryOverviewWidgetProvider: TimelineProvider {

    private let getAllDictionaryUseCase: GetAllDictionaryUseCase
    private let getRememberedWordsUseCase: GetRememberedWordsUseCase

    init(
        getAllDictionaryUseCase: GetAllDictionaryUseCase,
        getRememberedWordsUseCase: GetRememberedWordsUseCase
    ) {
        self.getAllDictionaryUseCase = getAllDictionaryUseCase
        self.getRememberedWordsUseCase = getRememberedWordsUseCase
    }

    func placeholder(in context: Context) -> DictionaryOverviewWidgetEntry {
        .placeholder
    }

    func getSnapshot(in context: Context, completion: @escaping (DictionaryOverviewWidgetEntry) -> Void) {
        completion(.placeholder)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<DictionaryOverviewWidgetEntry>) -> Void) {
        Task {
            let entry = await getTimelineEntry()
            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
        }
    }
}

// MARK: - Private methods

private extension DictionaryOverviewWidgetProvider {

    func getTimelineEntry() async -> DictionaryOverviewWidgetEntry {
        let state: DictionaryOverviewWidgetEntry.ViewState

        do {
            let dictionaryWords = try await getAllDictionaryUseCase.execute()
            let totalWordCount = dictionaryWords.count
            let rememberedWordCount = getRememberedWordsUseCase.execute(dictionaryWords).count
            state = .loaded(.init(totalWordCount: totalWordCount, rememberedWordCount: rememberedWordCount))
        } catch {
            state = .failed(getErrorMessage(error))
        }

        return DictionaryOverviewWidgetEntry(state: state)
    }

    func getErrorMessage(_ error: Error) -> String {
        switch error {
        case AuthError.unauthorized:
            Strings.needLogIn
        default:
            Strings.occurredError
        }
    }
}
