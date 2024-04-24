//
//  GetDictionaryWordCountUseCaseProtocol.swift
//
//
//  Created by Ivan Semenov on 11.04.2024.
//

public protocol GetDictionaryWordCountUseCaseProtocol: AnyObject {
    func execute() async throws -> Int
}
