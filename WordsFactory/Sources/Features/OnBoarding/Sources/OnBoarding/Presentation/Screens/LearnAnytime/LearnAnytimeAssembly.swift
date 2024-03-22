//
//  LearnAnytimeAssembly.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

enum LearnAnytimeAssembly {

    static func assemble() -> LearnAnytimeCoordinator<LearnAnytimeView, LearnAnytimeViewModel> {
        let viewModel = LearnAnytimeViewModel()
        let view = LearnAnytimeView(viewModel: viewModel)
        let coordinator = LearnAnytimeCoordinator(content: view, state: viewModel)

        return coordinator
    }
}
