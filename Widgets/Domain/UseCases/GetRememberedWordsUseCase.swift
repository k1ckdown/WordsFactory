//
//  GetRememberedWordsUseCase.swift
//  WidgetsExtension
//
//  Created by Ivan Semenov on 09.04.2024.
//

import DictionaryDomain

final class GetRememberedWordsUseCase {
    
    func execute(_ dictionaryWords: [DictionaryWord]) -> [DictionaryWord] {
        dictionaryWords.filter { $0.studyCoefficient >= Constants.minRememberCoef }
    }
}

// MARK: - Constants

private extension GetRememberedWordsUseCase {
    
    enum Constants {
        static let minRememberCoef = 6
    }
}
