//
//  ComputeWordCoefficientUseCase.swift
//
//
//  Created by Ivan Semenov on 24.04.2024.
//

final class ComputeWordCoefficientUseCase {

    func execute(word: TestWord, isCorrect: Bool) -> Int {
        word.studyCoefficient + (isCorrect ? Constants.correctCoefAmount : Constants.incorrectCoefAmount)
    }
}

// MARK: - Constants

private extension ComputeWordCoefficientUseCase {

    enum Constants {
        static let correctCoefAmount = 1
        static let incorrectCoefAmount = -1
    }
}
