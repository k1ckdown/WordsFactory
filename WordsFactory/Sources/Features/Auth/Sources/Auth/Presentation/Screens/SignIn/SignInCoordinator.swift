//
//  SignInCoordinator.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI
import CommonUI

enum SignInRoute: CaseIterable {
    case main
    case signUp
}

protocol SignInRouteState: ObservableObject {
    var route: SignInRoute? { get set }
}

struct SignInCoordinator<Content: View, State: SignInRouteState>: View {

    private let content: Content
    private let showMainScene: () -> Void
    @ObservedObject private var state: State

    init(content: Content, showMainScene: @escaping () -> Void, state: State) {
        self.content = content
        self.showMainScene = showMainScene
        self.state = state
    }

    var body: some View {
        screenView
            .onChange(of: state.route) { route in
                guard case .main = route else { return }
                showMainScene()
            }
    }

    @ViewBuilder
    private var screenView: some View {
        switch state.route {
        case .signUp:
            SignUpAssembly.assemble(showMainScene: showMainScene)
        default:
            content
        }
    }
}
