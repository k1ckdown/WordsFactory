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

    func execute(_ result: WordTestResult) async throws {
        async let updateCorrects: Void = updateStudyCoefficients(result.correct, changeAmount: Constants.correctCoefAmount)
        async let updateIncorrect: Void = updateStudyCoefficients(result.incorrect, changeAmount: Constants.incorrectCoefAmount)
        _ = try await (updateCorrects, updateIncorrect)
    }
}

// MARK: - Private methods

private extension HandleWordTestResultUseCase {

    func updateStudyCoefficients(_ testWords: [TestWord], changeAmount: Int) async throws {
        try await withThrowingTaskGroup(of: Void.self) { taskGroup in
            for word in testWords {
                let updatedCoefficient = word.studyCoefficient + changeAmount
                taskGroup.addTask {
                    try await self.wordRepository.updateStudyCoefficient(updatedCoefficient, of: word.text)
                }
            }

            try await taskGroup.waitForAll()
        }
    }
}

// MARK: - Constants

extension HandleWordTestResultUseCase {

    enum Constants {
        static let correctCoefAmount = 1
        static let incorrectCoefAmount = -1
    }
}
