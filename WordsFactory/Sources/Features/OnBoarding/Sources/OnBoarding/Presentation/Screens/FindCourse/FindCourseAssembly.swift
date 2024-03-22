//
//  FindCourseAssembly.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

enum FindCourseAssembly {

    static func assemble() -> FindCourseCoordinator<FindCourseView, FindCourseViewModel> {
        let viewModel = FindCourseViewModel()
        let view = FindCourseView(viewModel: viewModel)
        let coordinator = FindCourseCoordinator(content: view, state: viewModel)
        
        return coordinator
    }
}
