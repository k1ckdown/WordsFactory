//
//  WordRepositoryProtocol.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

public protocol WordRepositoryProtocol: AnyObject {
    func save(_ word: Word) throws
    func remove(by text: String) throws
    func get(by text: String) async throws -> Word?
    func getAllDictionary() throws -> [DictionaryWord]
}
