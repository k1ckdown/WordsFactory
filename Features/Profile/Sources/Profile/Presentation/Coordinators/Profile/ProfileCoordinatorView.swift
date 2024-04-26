//
//  ProfileCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 26.04.2024.
//

import SwiftUI

struct ProfileCoordinatorView<Content: View>: View {

    private let content: () -> Content
    @ObservedObject private var coordinator: ProfileCoordinator

    init(content: @autoclosure @escaping () -> Content, coordinator: ProfileCoordinator) {
        self.content = content
        self.coordinator = coordinator
    }

    var body: some View {
        content()
    }
}
