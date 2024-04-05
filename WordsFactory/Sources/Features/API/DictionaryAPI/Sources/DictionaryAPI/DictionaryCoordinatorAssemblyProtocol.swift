//
//  DictionaryCoordinatorAssemblyProtocol.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

import SwiftUI

public protocol DictionaryCoordinatorAssemblyProtocol {
    associatedtype V: View
    func assemble() -> V
}
