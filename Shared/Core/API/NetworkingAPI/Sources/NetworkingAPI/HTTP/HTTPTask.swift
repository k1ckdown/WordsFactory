//
//  HTTPTask.swift
//
//
//  Created by Ivan Semenov on 24.03.2024.
//

import Foundation

public typealias Parameters = [String: Any]

public enum HTTPTask {
    case request
    case requestBody(Data)
    case requestParameters(Parameters)
}
