//
//  GetWordQuestionsUseCaseTests.swift
//
//
//  Created by Ivan Semenov on 13.04.2024.
//

import XCTest
import WordModuleAPI
@testable import Training

final class GetWordTestQuestionsUseCaseTests: XCTestCase {

    private var sut: GetWordTestQuestionsUseCase!

    override func setUp() {
        super.setUp()
        sut = GetWordTestQuestionsUseCase()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}

// MARK: - Tests

extension GetWordTestQuestionsUseCaseTests {

    func test_execute_whenQuestionsSelected_thenChoicesContainsAnswer() async {
        //Given:
        let dictionaryWords = createDictionaryWords(count: 2)

        //When:
        let questions = sut.execute(dictionaryWords)

        //Then:
        for question in questions {
            let answerKey = question.answerWord.answerKey
            XCTAssertTrue(question.choices.keys.contains(answerKey))
        }
    }

    func test_execute_whenWordCountIsGreaterThan10_thenQuestionCountIs10() async {
        //Given:
        let dictionaryWords = createDictionaryWords(count: 11)

        //When:
        let questions = sut.execute(dictionaryWords)

        //Then:
        let expectedQuestionCount = 10
        XCTAssertEqual(questions.count, expectedQuestionCount)
    }

    func test_execute_whenWordCountIsLessThan10_thenQuestionCountIsEqualToWordCount() async {
        //Given:
        let dictionaryWords = createDictionaryWords(count: 7)

        //When:
        let questions = sut.execute(dictionaryWords)

        //Then:
        let expectedQuestionCount = dictionaryWords.count
        XCTAssertEqual(questions.count, expectedQuestionCount)
    }

    func test_execute_whenSortingByStudyCoef_thenCorrectTestWordsSelected() async {
        //Given:
        let dictionaryWords = createDictionaryWords(count: 20)

        //When:
        let questions = sut.execute(dictionaryWords)
        let wordsTexts = questions.map { $0.answerWord.text }.sorted()

        //Then:
        let expectedWordsTexts = dictionaryWords
            .sorted { $0.studyCoefficient < $1.studyCoefficient }
            .prefix(GetWordTestQuestionsUseCase.Constants.numberOfQuestions)
            .map { $0.text }
            .sorted()

        XCTAssertEqual(wordsTexts, expectedWordsTexts)
    }
}

// MARK: - Private methods

private extension GetWordTestQuestionsUseCaseTests {

    func createDictionaryWords(count: Int) -> [DictionaryWord] {
        (1...count).map { .mock(text: "word \($0)", studyCoefficient: Int.random(in: -20...20)) }
    }
}
