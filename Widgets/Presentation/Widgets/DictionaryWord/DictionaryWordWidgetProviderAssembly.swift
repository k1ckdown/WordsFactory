//
//  DictionaryWordWidgetProviderAssembly.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 24.04.2024.
//

struct DictionaryWordWidgetProviderAssembly {

    private let useCaseFactory = UseCaseFactory()

    func assemble() -> DictionaryWordWidgetProvider {
        DictionaryWordWidgetProvider(
            getRandomWordUseCase: useCaseFactory.makeGetRandomWordUseCase()
        )
    }
}
