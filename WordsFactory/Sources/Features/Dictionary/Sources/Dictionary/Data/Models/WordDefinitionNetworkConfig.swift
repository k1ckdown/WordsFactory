//
//  WordDefinitionNetworkConfig.swift
//
//
//  Created by Ivan Semenov on 26.03.2024.
//

import Networking

enum WordDefinitionNetworkConfig: NetworkConfig {
    case list(String)

    var path: String {
        Constants.path
    }

    var endpoint: String {
        switch self {
        case .list(let word): word
        }
    }

    var task: HTTPTask {
        switch self {
        case .list: .request
        }
    }

    var method: HTTPMethod {
        switch self {
        case .list: .get
        }
    }
}

// MARK: - Constants

private extension WordDefinitionNetworkConfig {

    enum Constants {
        static let path = "https://api.dictionaryapi.dev/api/v2/entries/en/"
    }
}
