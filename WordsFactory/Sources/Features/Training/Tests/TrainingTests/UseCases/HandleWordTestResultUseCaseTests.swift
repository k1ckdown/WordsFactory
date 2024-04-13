//
//  HandleWordTestResultUseCaseTests.swift
//
//
//  Created by Ivan Semenov on 12.04.2024.
//

import XCTest
@testable import Training

final class HandleWordTestResultUseCaseTests: XCTestCase {

    private var sut: HandleWordTestResultUseCase!
    private var wordRepository: WordRepositoryMock!

    override func setUp() {
        super.setUp()

        wordRepository = WordRepositoryMock()
        sut = HandleWordTestResultUseCase(wordRepository: wordRepository)
    }

    override func tearDown() {
        sut = nil
        wordRepository = nil

        super.tearDown()
    }
}

// MARK: - Tests

extension HandleWordTestResultUseCaseTests {

    func test_execute_whenWordsIncorrect_thenUpdateCoefficients() async {
        //Given:
        let incorrectWords = createTestWords(count: 1)
        let testResult = WordTestResult(correct: [], incorrect: incorrectWords)

        //When:
        do {
            try await sut.execute(testResult)

            //Then:
            for word in incorrectWords {
                let coef = wordRepository.updatedWordCoefficients[word.text]
                let expectedCoef = word.studyCoefficient + HandleWordTestResultUseCase.Constants.incorrectCoefAmount

                XCTAssertEqual(expectedCoef, coef)
            }
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_execute_whenWordsCorrect_thenUpdateCoefficients() async {
        //Given:
        let correctWords = createTestWords(count: 1)
        let testResult = WordTestResult(correct: correctWords, incorrect: [])

        //When:
        do {
            try await sut.execute(testResult)

            //Then:
            for word in correctWords {
                let coef = wordRepository.updatedWordCoefficients[word.text]
                let expectedCoef = word.studyCoefficient + HandleWordTestResultUseCase.Constants.correctCoefAmount

                XCTAssertEqual(expectedCoef, coef)
            }
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}

// MARK: - Private methods

private extension HandleWordTestResultUseCaseTests {

    func createTestWords(count: Int) -> [TestWord] {
        (1...count).map {
            .init(
                answerKey: "\($0)",
                text: "word \($0)",
                definition: "definition \($0)",
                studyCoefficient: 0
            )
        }
    }
}
