//
//  ImproveSkillsCoordinator.swift
//
//
//  Created by Ivan Semenov on 21.03.2024.
//

import SwiftUI

enum ImproveSkillsRoute: CaseIterable {
    
}

protocol ImproveSkillsRouteState: ObservableObject {
    var route: ImproveSkillsRoute? { get set }
}

struct ImproveSkillsCoordinator<Content: View, State: ImproveSkillsRouteState>: View {
    
    private let content: Content
    @ObservedObject private var state: State
    
    init(content: Content, state: State) {
        self.content = content
        self.state = state
    }
    
    var body: some View {
        content
            .navigationBarBackButtonHidden()
    }
}
