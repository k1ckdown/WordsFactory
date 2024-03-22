//
//  ImproveSkillsAssembly.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

enum ImproveSkillsAssembly {

    static func assemble() -> ImproveSkillsCoordinator<ImproveSkillsView, ImproveSkillsViewModel> {
        let viewModel = ImproveSkillsViewModel()
        let view = ImproveSkillsView(viewModel: viewModel)
        let coordinator = ImproveSkillsCoordinator(content: view, state: viewModel)

        return coordinator
    }
}
