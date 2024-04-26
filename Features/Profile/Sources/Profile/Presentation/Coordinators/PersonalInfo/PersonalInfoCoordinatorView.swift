//
//  PersonalInfoCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 27.04.2024.
//

import SwiftUI
import CommonUI

struct PersonalInfoCoordinatorView<Content: View>: View {

    private let content: () -> Content
    @ObservedObject private var coordinator: PersonalInfoCoordinator

    init(content: @autoclosure @escaping () -> Content, coordinator: PersonalInfoCoordinator) {
        self.content = content
        self.coordinator = coordinator
    }

    var body: some View {
        content()
            .appBackButton()
            .navigationTitle(Strings.personalInfo)
            .errorAlert($coordinator.errorMessage)
    }
}
