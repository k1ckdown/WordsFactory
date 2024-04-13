//
//  WordRepositoryMock.swift
//
//
//  Created by Ivan Semenov on 12.04.2024.
//

import Foundation
import WordModuleAPI

final class WordRepositoryMock: WordRepositoryProtocol {

    private(set) var updatedWordCoefficients: [String: Int] = [:]
    private let queue = DispatchQueue(label: "lock.queue")

    func get(by text: String) async throws -> Word? {
        nil
    }

    func saveDictionary(_ word: Word) async throws {

    }

    func removeDictionary(by text: String) async throws {

    }

    func getAllDictionary() async throws -> [DictionaryWord] {
        .init(repeating: .mock, count: 7)
    }

    func updateStudyCoefficient(_ coefficient: Int, of word: String) async throws {
        queue.sync {
            updatedWordCoefficients[word] = coefficient
        }
    }
}
