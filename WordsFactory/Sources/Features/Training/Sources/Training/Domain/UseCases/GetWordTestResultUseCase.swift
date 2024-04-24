//
//  GetWordTestResultUseCase.swift
//
//
//  Created by Ivan Semenov on 04.04.2024.
//

final class GetWordTestResultUseCase {

    func execute(_ answers: [WordTestAnswer]) -> [TestWordResult] {
        answers.reduce(into: [TestWordResult]()) { partialResult, answer in
            let testWord = answer.question.answerWord
            let isCorrect = answer.key == testWord.answerKey

            let result = TestWordResult(isCorrect: isCorrect, testWord: testWord)
            partialResult.append(result)
        }
    }
}
