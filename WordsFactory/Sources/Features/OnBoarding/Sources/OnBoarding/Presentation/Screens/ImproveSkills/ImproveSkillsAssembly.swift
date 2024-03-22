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
        let Coordinator = ImproveSkillsCoordinator(content: view, state: viewModel)

        return Coordinator
    }
}
