//
//  PersonalInfoViewState.swift
//
//
//  Created by Ivan Semenov on 27.04.2024.
//

extension PersonalInfoViewModel {

    struct ViewState: Equatable {
        var name: String
        var email: String
        var isUpdating = false
        var isSaveDisabled = true
    }

    enum Event {
        case saveTapped
        case nameChanged(String)
        case emailChanged(String)
    }
}
