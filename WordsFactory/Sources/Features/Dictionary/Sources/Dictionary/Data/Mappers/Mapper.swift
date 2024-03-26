//
//  Mapper.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

protocol Mapper {
    associatedtype DTO
    associatedtype Domain

    static func toDomain(_ source: DTO) -> Domain
}

extension Mapper {

    static func toDomainList(_ source: [DTO]) -> [Domain] {
        source.map { toDomain($0) }
    }
}
