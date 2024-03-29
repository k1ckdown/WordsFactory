//
//  ScreenFactoryProtocols.swift
//
//
//  Created by Ivan Semenov on 29.03.2024.
//

protocol DictionaryScreenFactory {
    func makeDictionaryScreen(coordinator: DictionaryCoordinatorProtocol) -> DictionaryView
}
