//
//  WordRepository.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

protocol WordRepository: AnyObject {
    func save(_ words: [Word]) throws
    func remove(by text: String) throws
    func getAll(by text: String) async throws -> WordList
}
