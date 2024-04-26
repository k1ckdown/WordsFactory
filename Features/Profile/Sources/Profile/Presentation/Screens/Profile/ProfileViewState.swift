//
//  ProfileViewState.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
//

extension ProfileViewModel {

    enum ViewState: Equatable {
        case idle
        case failed
        case loading
        case loaded(ViewData)

        struct ViewData: Equatable {
            let name: String
            let joinDate: String
        }
    }
    
    enum Event {
        case onAppear
        case signOutTapped
        case personalInfoTapped
        case myDictionaryTapped
    }
}
