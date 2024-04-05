//
//  GetWordTestResultUseCase.swift
//
//
//  Created by Ivan Semenov on 04.04.2024.
//

final class GetWordTestResultUseCase {

    func execute(_ answers: [WordTestAnswer]) -> WordTestResult {
        var correct: [TestWord] = []
        var incorrect: [TestWord] = []

        answers.forEach { answer in
            let testWord = answer.question.answerWord
            testWord.answerKey == answer.key ? correct.append(testWord) : incorrect.append(testWord)
        }

        return WordTestResult(correct: correct, incorrect: incorrect)
    }
}
