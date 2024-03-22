//
//  LearnAnytimeAssembly.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

enum LearnAnytimeAssembly {

    static func assemble() -> LearnAnytimeRouter<LearnAnytimeView, LearnAnytimeViewModel> {
        let viewModel = LearnAnytimeViewModel()
        let view = LearnAnytimeView(viewModel: viewModel)
        let router = LearnAnytimeRouter(content: view, state: viewModel)

        return router
    }
}
