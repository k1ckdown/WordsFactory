//
//  TrainingCoordinatorAssemblyProtocol.swift
//
//
//  Created by Ivan Semenov on 31.03.2024.
//

import SwiftUI

public protocol TrainingCoordinatorAssemblyProtocol {
    associatedtype V: View
    func assemble() -> V
}
