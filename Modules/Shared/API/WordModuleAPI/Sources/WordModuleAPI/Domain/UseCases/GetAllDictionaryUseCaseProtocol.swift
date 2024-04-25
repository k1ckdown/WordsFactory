//
//  GetAllDictionaryUseCaseProtocol.swift
//
//
//  Created by Ivan Semenov on 11.04.2024.
//

public protocol GetAllDictionaryUseCaseProtocol: AnyObject {
    func execute() async throws -> [DictionaryWord]
}
