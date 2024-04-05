//
//  TrainingFinishCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 04.04.2024.
//

import SwiftUI
import CommonUI

struct TrainingFinishCoordinatorView<Content: View>: View {
    
    private let content: () -> Content
    @Environment(\.dismiss) private var dismiss
    @Environment(\.popToRoot) private var popToRoot
    @ObservedObject private var coordinator: TrainingFinishCoordinator
    
    init(content: @autoclosure @escaping () -> Content, coordinator: TrainingFinishCoordinator) {
        self.content = content
        self.coordinator = coordinator
    }
    
    var body: some View {
        content()
            .appBackButton(backHandler: popToRoot)
            .errorAlert($coordinator.errorMessage)
            .onChange(of: coordinator.screen) { screen in
                guard case .question = screen else { return }
                dismiss()
            }
    }
}
