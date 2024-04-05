//
//  HandleWordTestResultUseCase.swift
//
//
//  Created by Ivan Semenov on 04.04.2024.
//

import WordModuleAPI

final class HandleWordTestResultUseCase {
    
    private let wordRepository: WordRepositoryProtocol
    
    init(wordRepository: WordRepositoryProtocol) {
        self.wordRepository = wordRepository
    }
    
    func execute(_ result: WordTestResult) throws {
        try updateStudyCoefficients(result.correct, changeAmount: Constants.correctCoefficientAmount)
        try updateStudyCoefficients(result.incorrect, changeAmount: Constants.incorrectCoefficientAmount)
    }
}

// MARK: - Private methods

private extension HandleWordTestResultUseCase {
    
    func updateStudyCoefficients(_ testWords: [TestWord], changeAmount: Int) throws {
        try testWords.forEach { word in
            let updatedCoefficient = word.studyCoefficient + changeAmount
            try wordRepository.updateStudyCoefficient(updatedCoefficient, of: word.text)
        }
    }
}

// MARK: - Constants

private extension HandleWordTestResultUseCase {
    
    enum Constants {
        static let correctCoefficientAmount = 1
        static let incorrectCoefficientAmount = -1
    }
}
