//
//  HasPlaceholder.swift
//
//
//  Created by Ivan Semenov on 28.03.2024.
//

import SwiftUI

public protocol HasPlaceholder {
    static func placeholder(id: String) -> Self
}

public extension Array where Element: HasPlaceholder {
    static func placeholders(_ count: Int) -> [Element] {
        (0..<count).map { .placeholder(id: "\($0)") }
    }
}
