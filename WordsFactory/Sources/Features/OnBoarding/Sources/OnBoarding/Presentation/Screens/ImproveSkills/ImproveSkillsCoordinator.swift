//
//  ImproveSkillsCoordinator.swift
//
//
//  Created by Ivan Semenov on 21.03.2024.
//

import SwiftUI

enum ImproveSkillsRoute: CaseIterable {
    case next
    case finish
}

protocol ImproveSkillsRouteState: ObservableObject {
    var route: ImproveSkillsRoute? { get set }
}

struct ImproveSkillsCoordinator<Content: View, State: ImproveSkillsRouteState>: View {

    private let content: Content
    @StateObject private var state: State
    @Environment(\.onBoardingFinish) var onBoardingFinish

    init(content: Content, state: State) {
        self.content = content
        _state = StateObject(wrappedValue: state)
    }

    var body: some View {
        content
            .navigationBarBackButtonHidden()
            .onChange(of: state.route) { _ in
                onBoardingFinish()
            }
    }
}
