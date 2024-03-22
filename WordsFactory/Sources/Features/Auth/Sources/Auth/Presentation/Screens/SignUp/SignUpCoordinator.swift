//
//  SignUpCoordinator.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

import SwiftUI
import CommonUI

enum SignUpRoute: CaseIterable {
    case finish
    case signIn
}

protocol SignUpRouteState: ObservableObject {
    var route: SignUpRoute? { get set }
}

struct SignUpCoordinator<Content: View, State: SignUpRouteState>: View {

    private let content: Content
    @ObservedObject private var state: State
    @Environment(\.authFinish) private var authFinish

    init(content: Content, state: State) {
        self.content = content
        self.state = state
    }

    var body: some View {
        screenView
            .onChange(of: state.route) { route in
                guard case .finish = route else { return }
                authFinish?()
            }
    }

    @ViewBuilder
    private var screenView: some View {
        switch state.route {
        case .signIn:
            SignInAssembly.assemble()
        default:
            content
        }
    }
}
