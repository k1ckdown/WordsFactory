//
//  TrainingCoordinatorView.swift
//
//
//  Created by Ivan Semenov on 03.04.2024.
//

import SwiftUI

struct TrainingCoordinatorView: View {

    private let factory: CoordinatorFactory

    init(factory: CoordinatorFactory) {
        self.factory = factory
    }

    var body: some View {
        factory.makeTrainingStartCoordinator()
    }
}
