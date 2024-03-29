//
//  NetworkConfig.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

public protocol NetworkConfig {
    var path: String { get }
    var endpoint: String { get }
    var task: HTTPTask { get }
    var method: HTTPMethod { get }
}
