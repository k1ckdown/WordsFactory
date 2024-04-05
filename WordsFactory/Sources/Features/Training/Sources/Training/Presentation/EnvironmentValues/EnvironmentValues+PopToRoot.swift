//
//  EnvironmentValues+PopToRoot.swift
//
//
//  Created by Ivan Semenov on 06.04.2024.
//

import SwiftUI

typealias PopToRootAction = () -> Void

struct PopToRootKey: EnvironmentKey {
    static let defaultValue: PopToRootAction = {}
}

extension EnvironmentValues {
    var popToRoot: PopToRootAction {
        get { self[PopToRootKey.self] }
        set { self[PopToRootKey.self] = newValue }
    }
}

extension View {
    func popToRoot(_ action: @escaping PopToRootAction) -> some View {
        environment(\.popToRoot, action)
    }
}
