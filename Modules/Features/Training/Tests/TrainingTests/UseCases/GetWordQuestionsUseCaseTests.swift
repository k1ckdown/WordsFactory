//
//  GetWordQuestionsUseCaseTests.swift
//
//
//  Created by Ivan Semenov on 13.04.2024.
//

import XCTest
import WordModuleAPI
@testable import Training

final class GetWordQuestionsUseCaseTests: XCTestCase {

    private var sut: GetWordQuestionsUseCase!
    private var wordRepository: WordRepositoryMock!

    override func setUp() {
        super.setUp()

        wordRepository = WordRepositoryMock()
        sut = GetWordQuestionsUseCase(wordRepository: wordRepository)
    }

    override func tearDown() {
        sut = nil
        wordRepository = nil

        super.tearDown()
    }
}

// MARK: - Tests

extension GetWordQuestionsUseCaseTests {

    func test_execute_whenSelectingChoices_thenChoicesContainsAnswer() async {
        //Given:
        let dictionaryWords = createDictionaryWords(count: 2)
        wordRepository.dictionaryWords = dictionaryWords

        //When:
        do {
            let questions = try await sut.execute()

            //Then:
            for question in questions {
                let answerKey = question.answerWord.answerKey
                XCTAssertTrue(question.choices.keys.contains(answerKey))
            }
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_execute_whenWordCountIsGreaterThan10_thenQuestionCountIs10() async {
        //Given:
        let dictionaryWords = createDictionaryWords(count: 11)
        wordRepository.dictionaryWords = dictionaryWords

        //When:
        do {
            let questions = try await sut.execute()

            //Then:
            let expectedQuestionCount = 10
            XCTAssertEqual(questions.count, expectedQuestionCount)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_execute_whenWordCountIsLessThan10_thenQuestionCountIsEqualToWordCount() async {
        //Given:
        let dictionaryWords = createDictionaryWords(count: 7)
        wordRepository.dictionaryWords = dictionaryWords

        //When:
        do {
            let questions = try await sut.execute()

            //Then:
            let expectedQuestionCount = dictionaryWords.count
            XCTAssertEqual(questions.count, expectedQuestionCount)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_execute_whenSortingByStudyCoef_thenCorrectTestWordsSelected() async {
        //Given:
        let dictionaryWords = createDictionaryWords(count: 20)
        wordRepository.dictionaryWords = dictionaryWords

        //When:
        do {
            let questions = try await sut.execute()
            let wordsTexts = questions.map { $0.answerWord.text }.sorted()

            //Then:
            let expectedWordsTexts = dictionaryWords
                .sorted { $0.studyCoefficient < $1.studyCoefficient }
                .prefix(GetWordQuestionsUseCase.Constants.numberOfQuestions)
                .map { $0.text }
                .sorted()

            XCTAssertEqual(wordsTexts, expectedWordsTexts)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}

// MARK: - Private methods

private extension GetWordQuestionsUseCaseTests {

    func createDictionaryWords(count: Int) -> [DictionaryWord] {
        (1...count).map { .mock(text: "word \($0)", studyCoefficient: Int.random(in: -20...20)) }
    }
}
