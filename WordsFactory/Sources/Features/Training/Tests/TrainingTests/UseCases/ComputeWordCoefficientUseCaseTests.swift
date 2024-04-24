//
//  ComputeWordCoefficientUseCaseTests.swift
//
//
//  Created by Ivan Semenov on 24.04.2024.
//

import XCTest
@testable import Training

final class ComputeWordCoefficientUseCaseTests: XCTestCase {

    private var sut: ComputeWordCoefficientUseCase!

    override func setUp() {
        super.setUp()
        sut = ComputeWordCoefficientUseCase()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
}

// MARK: - Tests

extension ComputeWordCoefficientUseCaseTests {

    func test_execute_whenWordCorrect_thenUpdateCoefficient() {
        //Given:
        let initialCoefficient = 0
        let testWord = TestWord.mock(studyCoefficient: initialCoefficient)

        //When:
        let newCoefficient = sut.execute(word: testWord, isCorrect: true)

        //Then:
        let expectedCoefficient = initialCoefficient + 1
        XCTAssertEqual(newCoefficient, expectedCoefficient)
    }

    func test_execute_whenWordIncorrect_thenUpdateCoefficient() {
        //Given:
        let initialCoefficient = 0
        let testWord = TestWord.mock(studyCoefficient: initialCoefficient)

        //When:
        let newCoefficient = sut.execute(word: testWord, isCorrect: false)

        //Then:
        let expectedCoefficient = initialCoefficient - 1
        XCTAssertEqual(newCoefficient, expectedCoefficient)
    }
}
