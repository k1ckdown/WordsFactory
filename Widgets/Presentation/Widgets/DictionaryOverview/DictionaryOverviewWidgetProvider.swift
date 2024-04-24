//
//  DictionaryOverviewWidgetProvider.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 08.04.2024.
//

import WidgetKit
import WordModule
import UserModuleAPI

struct DictionaryOverviewWidgetProvider: TimelineProvider {

    private let getDictionaryWordCountUseCase: GetDictionaryWordCountUseCase
    private let getRememberedWordCountUseCase: GetRememberedWordCountUseCase

    init(
        getDictionaryWordCountUseCase: GetDictionaryWordCountUseCase,
        getRememberedWordCountUseCase: GetRememberedWordCountUseCase
    ) {
        self.getDictionaryWordCountUseCase = getDictionaryWordCountUseCase
        self.getRememberedWordCountUseCase = getRememberedWordCountUseCase
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
            let totalWordCount = try await getDictionaryWordCountUseCase.execute()
            let rememberedWordCount = try await getRememberedWordCountUseCase.execute()
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
