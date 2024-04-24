//
//  DictionaryOverviewWidgetProviderAssembly.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 11.04.2024.
//

struct DictionaryOverviewWidgetProviderAssembly {

    private let useCaseFactory = UseCaseFactory()

    func assemble() -> DictionaryOverviewWidgetProvider {
        DictionaryOverviewWidgetProvider(
            getDictionaryWordCountUseCase: useCaseFactory.makeGetDictionaryWordCountUseCase(),
            getRememberedWordCountUseCase: useCaseFactory.makeGetRememberedWordCountUseCase()
        )
    }
}
