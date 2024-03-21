//
//  FindCourseAssembly.swift
//
//
//  Created by Ivan Semenov on 22.03.2024.
//

enum FindCourseAssembly {

    static func assemble() -> FindCourseRouter<FindCourseView, FindCourseViewModel> {
        let viewModel = FindCourseViewModel()
        let view = FindCourseView(viewModel: viewModel)
        let router = FindCourseRouter(content: view, state: viewModel)
        
        return router
    }
}
