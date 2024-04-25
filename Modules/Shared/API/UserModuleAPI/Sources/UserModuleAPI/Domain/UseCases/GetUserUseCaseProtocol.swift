//
//  GetUserUseCaseProtocol.swift
//  
//
//  Created by Ivan Semenov on 25.04.2024.
//

public protocol GetUserUseCaseProtocol: AnyObject {
    func execute() async throws -> User
}
