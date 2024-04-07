//
//  DictionaryWidgetProvider.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 08.04.2024.
//

import WidgetKit
import Networking
import WordModule

struct DictionaryWidgetProvider: TimelineProvider {

    private let wordRepository = WordRepositoryAssembly.assemble(networkService: NetworkService())

    func placeholder(in context: Context) -> DictionaryWidgetEntry {
        .placeholder
    }

    func getSnapshot(in context: Context, completion: @escaping (DictionaryWidgetEntry) -> Void) {
        completion(.placeholder)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<DictionaryWidgetEntry>) -> Void) {
        do {
            let totalWords = try fetchTotalWords()
            let entry = DictionaryWidgetEntry(totalWords: totalWords, totalRememberWords: -1)
            print(totalWords)

            let timeline = Timeline(entries: [entry], policy: .atEnd)
            completion(timeline)
        } catch {
            print(error)
        }
    }
}

// MARK: - Private methods

private extension DictionaryWidgetProvider {

    func fetchTotalWords() throws -> Int {
        let words = try wordRepository.getAllDictionary()
        return words.count
    }
}
