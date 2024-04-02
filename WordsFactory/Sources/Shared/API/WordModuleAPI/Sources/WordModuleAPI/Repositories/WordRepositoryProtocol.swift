//
//  WordRepositoryProtocol.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

public protocol WordRepositoryProtocol: AnyObject {
    func save(_ words: [Word]) throws
    func remove(by text: String) throws
    func getDictionary() throws -> [Word]
    func getAll(by text: String) async throws -> WordList
}
