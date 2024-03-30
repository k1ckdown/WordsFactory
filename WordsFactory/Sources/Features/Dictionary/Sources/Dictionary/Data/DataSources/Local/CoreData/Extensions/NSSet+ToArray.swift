//
//  NSSet+ToArray.swift
//
//
//  Created by Ivan Semenov on 30.03.2024.
//

import Foundation

extension NSSet {
    func toArray<T>(of type: T.Type) -> [T] {
        allObjects.compactMap { $0 as? T }
    }
}
