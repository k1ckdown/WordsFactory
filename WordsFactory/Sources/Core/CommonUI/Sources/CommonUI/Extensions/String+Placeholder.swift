//
//  String+Placeholder.swift
//
//
//  Created by Ivan Semenov on 28.03.2024.
//

public extension String {
    static func placeholder(_ count: Int) -> Self {
        String(Array(repeating: "x", count: count))
    }
}
