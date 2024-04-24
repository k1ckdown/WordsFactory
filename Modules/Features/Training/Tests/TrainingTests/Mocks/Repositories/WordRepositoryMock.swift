//
//  WordRepositoryMock.swift
//
//
//  Created by Ivan Semenov on 12.04.2024.
//

import Foundation
import WordModuleAPI

final class WordRepositoryMock: WordRepositoryProtocol {

    var dictionaryWords: [DictionaryWord] = []
    private(set) var updatedWordCoefficients: [String: Int] = [:]
    private let queue = DispatchQueue(label: "lock.queue")

    func saveDictionary(_ word: Word) async throws {
        let dictionaryWord = DictionaryWord(text: word.text, studyCoefficient: 0, definitions: word.definitions)
        dictionaryWords.append(dictionaryWord)
    }

    func removeDictionary(by text: String) async throws {
        dictionaryWords.removeAll(where: { $0.text == text })
    }

    func getAllDictionary() async throws -> [DictionaryWord] {
        dictionaryWords
    }

    func updateStudyCoefficient(_ coefficient: Int, of word: String) async throws {
        queue.sync {
            updatedWordCoefficients[word] = coefficient
        }
    }

    func get(by text: String) async throws -> Word? {
        guard let dictionaryWord = dictionaryWords.first(where: { $0.text == text }) else {
            return nil
        }

        let word = Word(text: dictionaryWord.text, isDictionary: true, definitions: dictionaryWord.definitions)
        return word
    }
}
