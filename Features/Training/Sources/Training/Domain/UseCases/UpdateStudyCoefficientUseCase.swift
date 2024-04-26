//
//  UpdateWordCoefficientUseCase.swift
//
//
//  Created by Ivan Semenov on 24.04.2024.
//

import DictionaryDomain

final class UpdateStudyCoefficientUseCase {

    private let wordRepository: WordRepositoryProtocol

    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }

    func execute(wordText: String, coefficient: Int) async throws {
        try await wordRepository.updateStudyCoefficient(coefficient, of: wordText)
    }
}
