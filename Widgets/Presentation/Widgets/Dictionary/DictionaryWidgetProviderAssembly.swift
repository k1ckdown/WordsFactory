//
//  DictionaryWidgetProviderAssembly.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 11.04.2024.
//

struct DictionaryWidgetProviderAssembly {

    private let useCaseFactory = UseCaseFactory()

    func assemble() -> DictionaryWidgetProvider {
        DictionaryWidgetProvider(
            getDictionaryWordCountUseCase: useCaseFactory.makeGetDictionaryWordCountUseCase(),
            getRememberedWordCountUseCase: useCaseFactory.makeGetRememberedWordCountUseCase()
        )
    }
}
