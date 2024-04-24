//
//  Routable.swift
//
//
//  Created by Ivan Semenov on 04.04.2024.
//

public protocol Routable: Hashable, Identifiable, CaseIterable {
    var navigationLink: Self { get }
}

public extension Routable {
    var id: String {
        String(describing: self)
    }

    var navigationLink: Self {
        self
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
