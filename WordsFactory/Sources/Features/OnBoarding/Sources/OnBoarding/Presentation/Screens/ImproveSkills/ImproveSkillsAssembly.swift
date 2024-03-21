//
//  ImproveSkillsAssembly.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

enum ImproveSkillsAssembly {

    static func assemble() -> ImproveSkillsRouter<ImproveSkillsView, ImproveSkillsViewModel> {
        let viewModel = ImproveSkillsViewModel()
        let view = ImproveSkillsView(viewModel: viewModel)
        let router = ImproveSkillsRouter(content: view, state: viewModel)

        return router
    }
}
