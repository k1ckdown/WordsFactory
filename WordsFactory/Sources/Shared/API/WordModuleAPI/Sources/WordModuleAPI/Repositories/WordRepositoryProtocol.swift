//
//  WordRepositoryProtocol.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

public protocol WordRepositoryProtocol: AnyObject {
    func get(by text: String) async throws -> Word?
    func saveDictionary(_ word: Word) throws
    func removeDictionary(by text: String) throws
    func getAllDictionary() throws -> [DictionaryWord]
    func updateStudyCoefficient(_ coefficient: Int, of word: String) throws
}
