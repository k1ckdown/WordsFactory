//
//  GetWordTestQuestionsUseCase.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import DictionaryDomain

final class GetWordTestQuestionsUseCase {

    func execute(_ dictionaryWords: [DictionaryWord]) -> [WordTestQuestion] {
        let testWords = dictionaryWords
            .sorted { $0.studyCoefficient < $1.studyCoefficient }
            .prefix(Constants.numberOfQuestions)
            .shuffled()

        let dictionary = dictionaryWords.count >= Constants.keys.count
        ? dictionaryWords.map { $0.text }
        : Constants.defaultDictionary

        return testWords.compactMap { makeQuestion(for: $0, from: dictionary) }
    }
}

// MARK: - Private methods

private extension GetWordTestQuestionsUseCase {

    func makeTestWord(from word: DictionaryWord, answerKey: String, definition: String) -> TestWord {
        TestWord(
            answerKey: answerKey,
            text: word.text,
            definition: definition,
            studyCoefficient: word.studyCoefficient
        )
    }

    func makeQuestion(for word: DictionaryWord, from dictionary: [String]) -> WordTestQuestion? {
        guard
            let answerKey = Constants.keys.randomElement(),
            let definition = word.definitions.randomElement()?.meanings.randomElement()?.definitions.randomElement()?.definition
        else { return nil }

        let wordChoices = dictionary.filter { $0 != word.text }.shuffled().prefix(Constants.keys.count - 1)
        let answerChoices: [String: String] = Constants.keys
            .filter { $0 != answerKey }
            .enumerated()
            .reduce(into: [answerKey: word.text]) { result, pair in
                result[pair.element] = wordChoices[pair.offset]
            }

        let testWord = makeTestWord(from: word, answerKey: answerKey, definition: definition)
        return WordTestQuestion(answerWord: testWord, choices: answerChoices)
    }
}

// MARK: - Constants

private extension GetWordTestQuestionsUseCase {

    enum Constants {
        static let numberOfQuestions = 10
        static let keys = ["A", "B", "C"]
        static let defaultDictionary = ["Cooking", "Smiling", "Freezing"]
    }
}
